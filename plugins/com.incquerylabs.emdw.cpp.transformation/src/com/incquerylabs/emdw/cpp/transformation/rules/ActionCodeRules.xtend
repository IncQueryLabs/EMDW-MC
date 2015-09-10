package com.incquerylabs.emdw.cpp.transformation.rules

import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.uml.ralf.scoping.BasicUMLContextProvider
import com.incquerylabs.uml.ralf.transformation.impl.BodyConverter
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode

class ActionCodeRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val BatchTransformationStatements statements
	extension val BodyConverter converter
	
	new(BatchTransformationStatements statements, AdvancedIncQueryEngine engine) {
		this.statements = statements
		this.converter = new BodyConverter
		initialize(engine, new BasicUMLContextProvider(engine))
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			operationActionCodeRule,
			stateEntryActionCodeRule,
			stateExitActionCodeRule,
			transitionActionCodeRule,
			guardActionCodeRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val operationActionCodeRule = createRule.precondition(cppOperationWithActionCodes).action[ match |
		val operation = match.cppOperation
		if((operation.commonOperation.body as ActionCode).source==null) {
			(operation.commonOperation.body as ActionCode).source = operation.convertOperation
		}
		
		debug('''Converted Operation «operation.cppName»'s code''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateEntryActionCodeRule = createRule.precondition(cppStateWithEntryActionCodes).action[ match |
		val state = match.cppState
		if((state.commonState.entryAction as ActionCode).source == null) {
			(state.commonState.entryAction as ActionCode).source = state.convertStateEntry
		}
		
		debug('''Converted State «state.cppName»'s entry code''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateExitActionCodeRule = createRule.precondition(cppStateWithExitActionCodes).action[ match |
		val state = match.cppState
		if((state.commonState.exitAction as ActionCode).source == null) {
			(state.commonState.exitAction as ActionCode).source = state.convertStateExit
		}
		
		debug('''Converted State «state.cppName»'s exit code''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val transitionActionCodeRule = createRule.precondition(cppTransitionWithActionCodes).action[ match |
		val transition = match.cppTransition
		if((transition.commonTransition.actionChain.actions.head as ActionCode).source == null) {
			(transition.commonTransition.actionChain.actions.head as ActionCode).source = transition.convertTransition
		}
		
		debug('''Converted Transition «transition.cppName»'s code''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val guardActionCodeRule = createRule.precondition(cppTransitionWithGuardActionCodes).action[ match |
		val transition = match.cppTransition
		if((transition.commonTransition.guard.body as ActionCode).source == null) {
			(transition.commonTransition.guard.body as ActionCode).source = transition.convertTransitionGuard
		}
		
		debug('''Converted Transition «transition.cppName»'s guard code''')
	].build
	
}
