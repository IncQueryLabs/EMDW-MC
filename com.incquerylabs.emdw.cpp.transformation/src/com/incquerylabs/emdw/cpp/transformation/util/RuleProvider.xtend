package com.incquerylabs.emdw.cpp.transformation.util

import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup

class RuleProvider {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	
	IncQueryEngine engine
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	public val stateRule = createRule.precondition(classStateMachineStates).action[ match |
		val state = match.state
		val cppState = createCPPState => [
			commonState = state
		]
		match.cppClass.subElements += cppState
		trace('''Mapped State «state.name» in state machine of «match.xtClass.name» to CPPState''')
	].build
	
	public val transitionRule = createRule.precondition(classStateMachineTransitions).action[ match |
		val transition = match.transition
		val cppTransition = createCPPTransition => [
			commonTransition = transition
		]
		match.cppClass.subElements += cppTransition
		trace('''Mapped Transition «transition.name» in state machine of «match.xtClass.name» to CPPTransition''')
	].build
	
	public val eventRule = createRule.precondition(classStateMachineEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
	].build
	
	/**
	 * Public method that initiates each rule
	 * 
	 */
	public def initRules() {
//		ActionChainRules.getRules(engine).initRules
	}
	
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