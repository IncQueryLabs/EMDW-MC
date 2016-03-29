/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class EventTemplates extends CPPTemplate {
	extension val AttributeTemplates attributeTemplates
	extension val EnumTemplates enumTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		this.attributeTemplates = new AttributeTemplates(engine)
		this.enumTemplates = new EnumTemplates
	}

	def enumInClassHeader(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		val eventEnumeratorNames = classEvents.map[ event | eventEnumeratorName(cppClass, event)]
		'''
		«IF !classEvents.isNullOrEmpty»
		// Event enum class
		«enumClassTemplate(cppClass.eventEnumClassName, eventEnumeratorNames)»
		«ELSE»
		// No event enum class
		«ENDIF»
		'''
	}
	
	def String eventEnumClassName(CPPClass cppClass) {
		'''«cppClass.cppName»_event'''
	}
	
	def String eventEnumClassQualifiedName(CPPClass cppClass) {
		'''«cppClass.cppQualifiedName»::«cppClass.eventEnumClassName»'''
	}
	
	def String eventEnumeratorName(CPPClass cppClass, CPPEvent cppEvent) {
		'''«cppEvent.cppName»_event'''
	}
	
	def String eventEnumeratorQualifiedName(CPPClass cppClass, CPPEvent cppEvent) {
		'''«cppClass.eventEnumClassQualifiedName»::«eventEnumeratorName(cppClass, cppEvent)»'''
	}
	
	def innerClassesInClassHeader(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			class «event.generatedEventClassName» : «event.superEventsTemplate» {
				public:
					«typeIdTemplate(event.generatedEventClassName)»
					// Virtual clone
					virtual «event.generatedEventClassQualifiedName»* clone() const;
					// Attributes
					«event.attributesInEventClassHeader»
			};
			
		«ENDFOR»
		'''
	}
	
	def generatedEventClassName(CPPEvent event) {
		'''«event.cppName»_event'''
	}
	
	def generatedEventClassQualifiedName(CPPEvent event) {
		'''«event.cppPrefix»«event.generatedEventClassName»'''
	}
	
	def superEventsTemplate(CPPEvent cppEvent) {
		val superEvents = cppEvent.superEvents
		if(superEvents.isNullOrEmpty){
			return '''public «ClassTemplates.EVENT_FQN»'''
		} else {
			return '''«FOR superEvent : superEvents SEPARATOR ","»
			public «superEvent.generatedEventClassQualifiedName»«ENDFOR»'''
		}
	}
	
	def getSuperEvents(CPPEvent cppEvent){
		val xtEvent = cppEvent.xtEvent
		if(xtEvent instanceof XTClassEvent){
			val xtSuperEvent = xtEvent.redefines as XTClassEvent
			if(xtSuperEvent != null){
				val cppSuperEvents = engine.getCppEvents().getAllValuesOfcppEvent(xtSuperEvent)
				return cppSuperEvents
			}
		}
		return #[]
	}
	
	def attributesInEventClassHeader(CPPEvent event) {
		'''
		«FOR attribute : event.subElements.filter(CPPAttribute)»
			«attributeDeclarationInClassHeader(attribute)»
		«ENDFOR»
		'''
	}
	
	def innerClassesInClassBody(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			«event.cloneTemplate»
		«ENDFOR»
		'''
	}
	
	def cloneTemplate(CPPEvent event){
		'''
			«event.generatedEventClassQualifiedName»* «event.generatedEventClassQualifiedName»::clone() const {
				return new «event.generatedEventClassQualifiedName»(*this);
			}
		'''
	}
	
	def incomingEventType(CPPState cppState){
		val eventMatcher = codeGenQueries.getCppStateIncomingCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppState)
		return eventType(cppEvents)
	}
	
	def outgoingEventType(CPPState cppState){
		val eventMatcher = codeGenQueries.getCppStateOutgoingCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppState)
		return eventType(cppEvents)
	}
	
	def eventType(CPPTransition cppTransition){
		val eventMatcher = codeGenQueries.getCppTransitionCppEvents(engine)
		val cppEvents = eventMatcher.getAllValuesOfcppEvent(cppTransition)
		return eventType(cppEvents)
	}
	
	def eventType(Iterable<CPPEvent> events){
		var CharSequence ancestorQualifiedName = ClassTemplates.EVENT_FQN
		if(events.length > 0) {
			val lowestCommonAncestorEvent = events.fold(events.head,[result, event | getLowestCommonAncestor(result, event)])
			if (lowestCommonAncestorEvent != null){
				ancestorQualifiedName = generatedEventClassQualifiedName(lowestCommonAncestorEvent)
			}
		}
		
		return ancestorQualifiedName
	}
	
	def getLowestCommonAncestor(CPPEvent event1, CPPEvent event2) {
		if(event1 == null || event2 == null){
			return null
		}
		if (event1 == event2) {
			return event1
		}
		val eventAncestorMatcher = codeGenQueries.getCppEventCommonAncestor(engine)
		val cppEventMatcher = codeGenQueries.getCppEvents(engine)
		val commonXtAncestors = eventAncestorMatcher.getAllValuesOfcommonXtAncestor(event1, event2, null)
		if(commonXtAncestors.isNullOrEmpty){
			return null
		}
		var currentXtEvent = event1.xtEvent as XTClassEvent
		while(!commonXtAncestors.contains(currentXtEvent)){
			currentXtEvent = currentXtEvent.redefines as XTClassEvent
		}
		val lowestCommonAncestor = cppEventMatcher.getAllValuesOfcppEvent(currentXtEvent).head
		return lowestCommonAncestor
	}
}
