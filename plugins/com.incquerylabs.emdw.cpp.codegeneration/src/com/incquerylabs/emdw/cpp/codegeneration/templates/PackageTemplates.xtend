package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import org.eclipse.incquery.runtime.api.IncQueryEngine

class PackageTemplates extends CPPTemplate {
	extension val NamespaceTemplates namespaceTemplates
	extension val HeaderGuardTemplates headerGuardTemplates
	extension val IncludeTemplates includeTemplates
	extension val EnumTemplates enumTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
		namespaceTemplates = new NamespaceTemplates
		headerGuardTemplates = new HeaderGuardTemplates
		includeTemplates = new IncludeTemplates
		enumTemplates = new EnumTemplates
	}
	
	def packageMainHeaderTemplate(CPPPackage cppPackage) {
		val cppPackageName = cppPackage.cppName
		val headerGuardPostfix = "MAIN_HEADER"
		
		'''
		/******************************************************************************
		 *
		 * P A C K A G E   M A I N   ( H E A D E R )
		 *
		 * NAME: «cppPackageName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		«startHeaderGuard(cppPackage, headerGuardPostfix)»
		
		«cppPackage.headerFile.inclusions»
		
		«cppPackage.namespaceOpenerTemplate»
		
		«cppPackage.cppEnumsInContainer»
		
		«cppPackage.namespaceCloserTemplate»
		
		«closeHeaderGuard(cppPackage, headerGuardPostfix)»
		'''
	}
	
	def packageMainBodyTemplate(CPPPackage cppPackage) {
		val cppPackageName = cppPackage.cppName
		
		'''
		/******************************************************************************
		 *
		 * P A C K A G E   M A I N   ( B O D Y )
		 *
		 * NAME: «cppPackageName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		
		«cppPackage.bodyFile.inclusions»
		
		'''
	}
}
