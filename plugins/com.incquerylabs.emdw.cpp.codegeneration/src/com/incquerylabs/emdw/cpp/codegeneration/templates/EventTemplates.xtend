package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute

class EventTemplates {

	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE
	extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	val IncQueryEngine engine
	val AttributeTemplates attributeTemplates
	
	new(IncQueryEngine engine) {
		this.engine = engine
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
			class «event.generatedEventClassName» : public «ClassTemplates.EventFQN»«event.superEventsTemplate» {
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
		'''«FOR superEvent : superEvents»,
		public «superEvent.generatedEventClassQualifiedName»«ENDFOR»'''
	}
	
	def getSuperEvents(CPPEvent cppEvent){
		val xtEvent = cppEvent.xtEvent
		if(xtEvent instanceof XTClassEvent){
			val cppSuperEvents = xtEvent.definingEvents.map[ xtSuperEvent |
				engine.getCppEvents().getAllValuesOfcppEvent(xtSuperEvent).head
			]
			return cppSuperEvents
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
		val cppClassName = cppClass.cppName
		val classEvents = cppClass.subElements.filter(CPPEvent).sortBy[cppName]
		'''
		«FOR event : classEvents»
			«event.generatedEventClassQualifiedName»::«event.generatedEventClassName»(bool isInternal) : 
				«ClassTemplates.EventFQN»(«cppClassName»_EVENT_«event.cppName», isInternal){
			}
		«ENDFOR»
		'''
	}
}