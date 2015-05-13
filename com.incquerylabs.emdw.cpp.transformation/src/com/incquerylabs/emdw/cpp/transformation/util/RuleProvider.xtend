package com.incquerylabs.emdw.cpp.transformation.util

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class RuleProvider {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	
	IncQueryEngine engine
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	public val cleanComponentsRule = createRule.precondition(cppComponents).action[ match |
		// TODO clean component
		val cppComponent = match.cppComponent
		cppComponent.subElements.clear
		val bodyDirectory = cppComponent.bodyDirectory
		if(bodyDirectory != null){
			bodyDirectory.files.clear
			bodyDirectory.subDirectories.clear
		}
		val headerDirectory = cppComponent.headerDirectory
		if(headerDirectory != null){
			headerDirectory.files.clear
			headerDirectory.subDirectories.clear
		}
		
		trace('''Cleaned Component «cppComponent.xtComponent.name»''')
	].build
	
	public val componentAttributeRule = createRule.precondition(cppComponentAttributes).action[ match |
		val cppComponent = match.cppComponent
		val attribute = match.attribute
		val cppAttribute = createCPPAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = attribute ]
		]
		cppComponent.subElements += cppAttribute
		trace('''Mapped Attribute «attribute.name» in component «match.xtComponent.name» to CPPAttribute''')
	].build

	public val classRule = createRule.precondition(cppComponentClasses).action[ match |
		val xtCls = match.xtClass
		val bodyDir = match.cppComponent.bodyDirectory
		val headerDir = match.cppComponent.headerDirectory
		val cppClass = createCPPClass => [
			xtClass = xtCls
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
			
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = xtCls ]
		]
		match.cppComponent.subElements += cppClass
		trace('''Mapped Class «xtCls.name» in component «match.xtComponent.name» to CPPClass''')
	].build
	
	public val classAttributeRule = createRule.precondition(cppClassAttributes).action[ match |
		val cppClass = match.cppClass
		val attribute = match.attribute
		val cppAttribute = createCPPAttribute => [
			commonAttribute = attribute
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = attribute ]
		]
		cppClass.subElements += cppAttribute
		trace('''Mapped Attribute «attribute.name» in class «match.xtClass.name» to CPPAttribute''')
	].build
	
	public val classOperationRule = createRule.precondition(cppClassOperations).action[ match |
		val cppClass = match.cppClass
		val operation = match.operation
		val cppOperation = createCPPOperation => [
			commonOperation = operation
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = operation ]
		]
		cppClass.subElements += cppOperation
		trace('''Mapped Operation «operation.name» in class «match.xtClass.name» to CPPOperation''')
	].build
	
	
	public val stateRule = createRule.precondition(cppClassStateMachineStates).action[ match |
		val state = match.state
		val cppState = createCPPState => [
			commonState = state
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = state ]
		]
		match.cppClass.subElements += cppState
		trace('''Mapped State «state.name» in state machine of «match.xtClass.name» to CPPState''')
	].build
	
	public val transitionRule = createRule.precondition(cppClassStateMachineTransitions).action[ match |
		val transition = match.transition
		val cppTransition = createCPPTransition => [
			commonTransition = transition
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = transition ]
		]
		match.cppClass.subElements += cppTransition
		trace('''Mapped Transition «transition.name» in state machine of «match.xtClass.name» to CPPTransition''')
	].build
	
	public val eventRule = createRule.precondition(cppClassStateMachineEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
			ooplNameProvider = createOOPLExistingNameProvider=>[ commonNamedElement = event ]
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
	].build
	
	public def addRules(BatchTransformation transformation) {
		val rules = new TransformationRuleGroup(
			stateRule,
			transitionRule,
			eventRule
		)
		
		transformation.addRules(rules)
	}
	
//	
//	private def initRule(AbstractObjectMapping rule) {
//		val eventDrivenRule = createRule.precondition().action().build
//	}
}