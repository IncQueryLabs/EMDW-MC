package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.codegeneration.util.TypeIdentifierGenerator
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPTemplates {
	
	public static boolean GENERATE_TRACING_CODE = true
	
	// TODO @Inject
	boolean generateTracingCode = GENERATE_TRACING_CODE
	val NamespaceTemplates namespaceTemplates
	val IncQueryEngine engine
	val ClassTemplates classTemplates
	val ComponentTemplates componentTemplates
	val PackageTemplates packageTemplates
	val TypeIdentifierGenerator typeIdGenerator
	
	new(IncQueryEngine engine) {
		this.engine = engine
		namespaceTemplates = new NamespaceTemplates
		typeIdGenerator = new TypeIdentifierGenerator
		packageTemplates = new PackageTemplates(engine)
		componentTemplates = new ComponentTemplates(engine, namespaceTemplates)
		classTemplates = new ClassTemplates(engine, typeIdGenerator, namespaceTemplates)
	}
	
	def CharSequence componentDeclHeaderTemplate(CPPComponent cppComponent){
		componentTemplates.componentDeclHeaderTemplate(cppComponent)
	}
	
	def CharSequence componentDefHeaderTemplate(CPPComponent cppComponent){
		componentTemplates.componentDefHeaderTemplate(cppComponent)
	}
	
	def CharSequence componentMainHeaderTemplate(CPPComponent cppComponent){
		componentTemplates.componentMainHeaderTemplate(cppComponent)
	}
	
	def CharSequence componentMainBodyTemplate(CPPComponent cppComponent){
		componentTemplates.componentMainBodyTemplate(cppComponent)
	}
	
	def CharSequence packageMainHeaderTemplate(CPPPackage cppPackage){
		packageTemplates.packageMainHeaderTemplate(cppPackage)
	}
	
	def CharSequence packageMainBodyTemplate(CPPPackage cppPackage){
		packageTemplates.packageMainBodyTemplate(cppPackage)
	}
	
	def classHeaderTemplate(CPPClass cppClass) {
		classTemplates.classHeaderTemplate(cppClass)
	}
	
	def classBodyTemplate(CPPClass cppClass) {
		classTemplates.classBodyTemplate(cppClass)
	}
	
}