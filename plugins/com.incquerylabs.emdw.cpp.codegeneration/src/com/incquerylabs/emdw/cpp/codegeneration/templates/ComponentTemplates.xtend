package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ComponentTemplates {
	extension CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	
	// TODO @Inject
	val generateTracingCode = CPPTemplates.GENERATE_TRACING_CODE

	IncQueryEngine engine
	
	extension val NamespaceTemplates namespaceTemplates
	extension val HeaderGuardTemplates headerGuardTemplates
	extension val IncludeTemplates includeTemplates
	
	new(IncQueryEngine engine) {
		this.engine = engine
		namespaceTemplates = new NamespaceTemplates
		headerGuardTemplates = new HeaderGuardTemplates
		includeTemplates = new IncludeTemplates
	}
	
	def componentDeclHeaderTemplate(CPPComponent cppComponent) {
		val cppComponentName = cppComponent.cppName
		val headerGuardPostfix = "DECLARATION_HEADER"
		
		'''
		/******************************************************************************
		 *
		 * C O M P O N E N T   D E C L A R A T I O N S
		 *
		 * NAME: «cppComponentName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		
		«startHeaderGuard(cppComponent, headerGuardPostfix)»
		
		«cppComponent.declarationHeaderFile.inclusions»
		
		«cppComponent.namespaceOpenerTemplate»
		class CompMain;
		«cppComponent.namespaceCloserTemplate»
		«cppComponent.classDeclarationsTemplate»
		
		«closeHeaderGuard(cppComponent, headerGuardPostfix)»
		'''
	}
	
	def componentDefHeaderTemplate(CPPComponent cppComponent) {
		val cppComponentName = cppComponent.cppName
		val headerGuardPostfix = "DEFINITION_HEADER"
		
		'''
		/******************************************************************************
		 *
		 * C O M P O N E N T   D E F I N I T I O N S
		 *
		 * NAME: «cppComponentName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		 
		«startHeaderGuard(cppComponent, headerGuardPostfix)»
		
		«cppComponent.definitionHeaderFile.inclusions»
		
		«closeHeaderGuard(cppComponent, headerGuardPostfix)»
		'''
	}
	
	def componentMainHeaderTemplate(CPPComponent cppComponent) {
		val cppComponentName = cppComponent.cppName
		val headerGuardPostfix = "MAIN_HEADER"
		
		'''
		/******************************************************************************
		 *
		 * C O M P O N E N T   M A I N   ( H E A D E R )
		 *
		 * NAME: «cppComponentName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		
		«startHeaderGuard(cppComponent, headerGuardPostfix)»
		
		«cppComponent.mainHeaderFile.inclusions»
		
		«cppComponent.namespaceOpenerTemplate»
		class CompMain : public ActiveComponent {
«««		TODO: Generate component code from cppmodel 
		public:
		    CompMain(){}
		private:
		    CompMain(const CompMain&);
		    CompMain& operator=(const CompMain&);
		};
		«cppComponent.namespaceCloserTemplate»
		
		«closeHeaderGuard(cppComponent, headerGuardPostfix)»
		
		'''
	}
	
	def componentMainBodyTemplate(CPPComponent cppComponent) {
		val cppComponentName = cppComponent.cppName
		
		'''
		/******************************************************************************
		 *
		 * C O M P O N E N T   M A I N   ( B O D Y )
		 *
		 * NAME: «cppComponentName»
		 *
		 *
«««		 TODO: generated by [...]
		 *
		 ******************************************************************************/
		
		«cppComponent.mainBodyFile.inclusions»
		
		'''
	}
	
	def CharSequence classDeclarationsTemplate(CPPQualifiedNamedElement cppContainer) {
		val cppClasses = engine.cppClassInQualifiedNamedElement.getAllValuesOfcppClass(cppContainer)
		val innerCppPackages = engine.cppPackageInQualifiedNamedElement.getAllValuesOfcppPackage(cppContainer)
		'''
		«IF !cppClasses.isNullOrEmpty»
			«cppContainer.namespaceOpenerTemplate»
				«FOR cppClass : cppClasses»
				class «cppClass.cppName»;
				«ENDFOR»
			«cppContainer.namespaceCloserTemplate»
		«ENDIF»
		
		«FOR innerCppPackage : innerCppPackages»
			«innerCppPackage.classDeclarationsTemplate»
		«ENDFOR»
		'''
	}
}