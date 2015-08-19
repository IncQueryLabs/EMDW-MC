package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import org.eclipse.incquery.runtime.api.IncQueryEngine

class CPPTemplates {
	public static boolean GENERATE_TRACING_CODE = true
	
	val NamespaceTemplates namespaceTemplates
	val ClassTemplates classTemplates
	val ComponentTemplates componentTemplates
	val PackageTemplates packageTemplates
	
	new(IncQueryEngine engine) {
		namespaceTemplates = new NamespaceTemplates
		packageTemplates = new PackageTemplates(engine)
		componentTemplates = new ComponentTemplates(engine)
		classTemplates = new ClassTemplates(engine)
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
