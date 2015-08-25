package com.incquerylabs.emdw.cpp.codegeneration.templates

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEnumType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ComponentTemplates extends CPPTemplate {
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
		«cppComponent.forwardDeclarationsTemplate»
		
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
		
		«cppComponent.namespaceOpenerTemplate»
		
		«cppComponent.cppEnumsInContainer»
		
		«cppComponent.namespaceCloserTemplate»
		
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
		
		«cppComponent.startHeaderGuard(headerGuardPostfix)»
		
		«cppComponent.mainHeaderFile.inclusions»
		
		«cppComponent.namespaceOpenerTemplate»
		
		«cppComponent.componentClassInComponentMainHeader»
		
		«cppComponent.namespaceCloserTemplate»
		
		«cppComponent.closeHeaderGuard(headerGuardPostfix)»
		
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
	
	def componentClassInComponentMainHeader(CPPComponent cppComponent){
		'''
		class «cppComponent.cppName» «superclassTemplate(cppComponent)»{
«««		TODO: Generate component code from cppmodel 
		public:
			«cppComponent.cppName»(){}
			
		private:
			«cppComponent.cppName»(const «cppComponent.cppName»&);
			«cppComponent.cppName»& operator=(const «cppComponent.cppName»&);
		};
		'''
	}
	
	def CharSequence forwardDeclarationsTemplate(CPPQualifiedNamedElement cppContainer) {
		val cppClasses = cppContainer.subElements.filter(CPPClass)
		val cppEnumTypes = cppContainer.subElements.filter(CPPEnumType)
		val innerCppPackages = cppContainer.subElements.filter(CPPPackage)
		val hasForwardDeclarations = !(cppClasses.isNullOrEmpty && cppEnumTypes.isNullOrEmpty)
		'''
		«IF hasForwardDeclarations»
			«cppContainer.namespaceOpenerTemplate»
				«FOR cppClass : cppClasses»
					class «cppClass.cppName»;
				«ENDFOR»
				«FOR cppEnumType : cppEnumTypes»
					class «cppEnumType.cppName»;
				«ENDFOR»
			«cppContainer.namespaceCloserTemplate»
		«ENDIF»
		
		«FOR innerCppPackage : innerCppPackages»
			«innerCppPackage.forwardDeclarationsTemplate»
		«ENDFOR»
		'''
	}
}
