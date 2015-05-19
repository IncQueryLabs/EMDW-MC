package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ClassRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new TransformationRuleGroup(
			classRule,
			classAttributeRule,
			classOperationRule,
			stateRule,
			transitionRule,
			eventRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val classRule = createRule.precondition(cppComponentClasses).action[ match |
		val xtCls = match.xtClass
		val bodyDir = match.cppComponent.bodyDirectory
		val headerDir = match.cppComponent.headerDirectory
		val cppClass = createCPPClass => [
			xtClass = xtCls
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
			
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = xtCls ]
		]
		match.cppComponent.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in component «match.xtComponent.name» to CPPClass''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val classAttributeRule = createRule.precondition(cppClassAttributes).action[ match |
		val cppClass = match.cppClass
		val attribute = match.attribute
		val cppAttribute = createCPPAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = attribute ]
		]
		cppClass.subElements += cppAttribute
		trace('''Mapped Attribute «attribute.name» in class «match.xtClass.name» to CPPAttribute''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val classOperationRule = createRule.precondition(cppClassOperations).action[ match |
		val cppClass = match.cppClass
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = operation ]
		]
		operation.parameters.forEach[ param |
			val cppFormalParameter = createCPPFormalParameter => [
				commonParameter = param
				ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = param ]
			]
			cppOperation.subElements += cppFormalParameter
		]
		cppClass.subElements += cppOperation
		trace('''Mapped Operation «operation.name» in class «match.xtClass.name» to CPPOperation''')
	].build
	
	
	@Accessors(PUBLIC_GETTER)
	val stateRule = createRule.precondition(cppClassStateMachineStates).action[ match |
		val state = match.state
		val cppState = createCPPState => [
			commonState = state
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = state ]
		]
		match.cppClass.subElements += cppState
		trace('''Mapped State «state.name» in state machine of «match.xtClass.name» to CPPState''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val transitionRule = createRule.precondition(cppClassStateMachineTransitions).action[ match |
		val transition = match.transition
		val cppTransition = createCPPTransition => [
			commonTransition = transition
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = transition ]
		]
		match.cppClass.subElements += cppTransition
		trace('''Mapped Transition «transition.name» in state machine of «match.xtClass.name» to CPPTransition''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val eventRule = createRule.precondition(cppClassStateMachineEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = event ]
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
	].build

}