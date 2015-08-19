package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class EventTemplates extends CPPTemplate {
	val AttributeTemplates attributeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		this.attributeTemplates = new AttributeTemplates(engine)
	}

	def enumInClassHeader(CPPClass cppClass) {
		val cppClassName = cppClass.cppName
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		enum «cppClassName»_event {
			«FOR event : classEvents SEPARATOR ","»
				«cppClassName»_EVENT_«event.cppName»
			«ENDFOR»
		};
		'''
	}
	
	def innerClassesInClassHeader(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			class «event.generatedEventClassName» : «event.superEventsTemplate» {
				public:
					// Constructor
					«event.generatedEventClassName»(bool isInternal);
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
			return '''public «ClassTemplates.EventFQN»'''
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
			«attributeTemplates.attributeDeclarationInClassHeader(attribute)»
		«ENDFOR»
		'''
	}
	
	def innerClassesInClassBody(CPPClass cppClass) {
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			«event.constructorTemplate»
		«ENDFOR»
		'''
	}
	
	def constructorTemplate(CPPEvent event){
		var CPPClass cppClass = event.eContainer as CPPClass
		val cppClassName = cppClass.cppName
		val superEvents = event.superEvents
		
		if(superEvents.isNullOrEmpty){
			'''
				«event.generatedEventClassQualifiedName»::«event.generatedEventClassName»(bool isInternal) : 
				«ClassTemplates.EventFQN»(«cppClassName»_EVENT_«event.cppName», isInternal){
				}
			'''
		} else {
			'''
				«event.generatedEventClassQualifiedName»::«event.generatedEventClassName»(bool isInternal) : 
				«superEvents.head.generatedEventClassQualifiedName»(isInternal){
					this->::Event::_id = «cppClassName»_EVENT_«event.cppName»;
				}
			'''
		}
		
		
	}
}
