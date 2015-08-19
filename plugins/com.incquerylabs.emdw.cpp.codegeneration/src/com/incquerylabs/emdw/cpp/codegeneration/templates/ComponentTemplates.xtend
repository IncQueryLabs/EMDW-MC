package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ComponentTemplates extends CPPTemplate {
	extension val NamespaceTemplates namespaceTemplates
	extension val HeaderGuardTemplates headerGuardTemplates
	extension val IncludeTemplates includeTemplates
	
	new(IncQueryEngine engine) {
		super(engine)
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
		class «cppComponent.cppName»;
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
		class «cppComponent.cppName» «superclassTemplate(cppComponent)»{
«««		TODO: Generate component code from cppmodel 
		public:
		    «cppComponent.cppName»(){}
		private:
		    «cppComponent.cppName»(const «cppComponent.cppName»&);
		    «cppComponent.cppName»& operator=(const «cppComponent.cppName»&);
		};
		«cppComponent.namespaceCloserTemplate»
		
		«closeHeaderGuard(cppComponent, headerGuardPostfix)»
		
		'''
	}
	
	def superclassTemplate(CPPComponent cppComponent) {
		val stateMachineMatcher = codeGenQueries.getCppComponentStateMachines(engine)
		val isActiveComponent = stateMachineMatcher.hasMatch(cppComponent, null);
		
		'''«IF isActiveComponent»: public ActiveComponent «ENDIF»'''
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
