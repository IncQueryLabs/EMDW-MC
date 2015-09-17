package com.incquerylabs.emdw.cpp.transformation.rules

import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction

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
		val body = operation.commonOperation.body
		if(body instanceof ActionCode) {
			if(body.source==null) {
				try{
					body.source = operation.convertOperation
					debug('''Converted Operation «operation.cppName»'s code''')
				} catch (Exception e) {
					body.source = ""
					error('''ERROR in Operation «operation.cppName»'s code''', e)
				}
			}
		} else if(body instanceof XTAction) {
			try{
				operation.convertOperation
				debug('''Converted Operation «operation.cppName»'s code''')
			} catch (Exception e) {
				error('''ERROR in Operation «operation.cppName»'s code''', e)
			}
		}
		
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateEntryActionCodeRule = createRule.precondition(cppStateWithEntryActionCodes).action[ match |
		val state = match.cppState
		val entryAction = state.commonState.entryAction
		if(entryAction instanceof ActionCode) {
			if(entryAction.source == null) {
				try{
					entryAction.source = state.convertStateEntry
					debug('''Converted State «state.cppName»'s entry code''')
				} catch (Exception e) {
					entryAction.source = ""
					error('''ERROR in State «state.cppName»'s entry code''', e)
				}
			}
		} else if(entryAction instanceof XTAction) {
			try{
				state.convertStateEntry
				debug('''Converted State «state.cppName»'s entry code''')
			} catch (Exception e) {
				error('''ERROR in State «state.cppName»'s entry code''', e)
			}
		}
		
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateExitActionCodeRule = createRule.precondition(cppStateWithExitActionCodes).action[ match |
		val state = match.cppState
		val stateExit = state.commonState.exitAction
		if(stateExit instanceof ActionCode) {
			if(stateExit.source == null) {
				try{
					stateExit.source = state.convertStateExit
					debug('''Converted State «state.cppName»'s exit code''')
				} catch (Exception e) {
					stateExit.source = ""
					error('''ERROR in State «state.cppName»'s exit code''', e)
				}
			}
		} else if(stateExit instanceof XTAction) {
			try{
				state.convertStateExit
				debug('''Converted State «state.cppName»'s exit code''')
			} catch (Exception e) {
				error('''ERROR in State «state.cppName»'s exit code''', e)
			}
		}
		
	].build
	
	@Accessors(PUBLIC_GETTER)
	val transitionActionCodeRule = createRule.precondition(cppTransitionWithActionCodes).action[ match |
		val transition = match.cppTransition
		val transitionAction = transition.commonTransition.actionChain.actions.head
		if(transitionAction instanceof ActionCode) {
			if(transitionAction.source == null) {
				try{
					transitionAction.source = transition.convertTransition
					debug('''Converted Transition «transition.cppName»'s code''')
				} catch (Exception e) {
					transitionAction.source = ""
					error('''ERROR in Transition «transition.cppName»'s code''', e)
				}
			}
		} else if(transitionAction instanceof XTAction) {
			try{
				transition.convertTransition
				debug('''Converted Transition «transition.cppName»'s code''')
			} catch (Exception e) {
				error('''ERROR in Transition «transition.cppName»'s code''', e)
			}
			
		}
		
	].build
	
	@Accessors(PUBLIC_GETTER)
	val guardActionCodeRule = createRule.precondition(cppTransitionWithGuardActionCodes).action[ match |
		val transition = match.cppTransition
		val transitionGuard = transition.commonTransition.guard.body
		if(transitionGuard instanceof ActionCode){
			if(transitionGuard.source == null) {
				try{
					transitionGuard.source = transition.convertTransitionGuard
					debug('''Converted Transition «transition.cppName»'s guard code''')
				} catch (Exception e) {
					transitionGuard.source = ""
					error('''ERROR in Transition «transition.cppName»'s guard code''', e)
				}
			}
		} else if(transitionGuard instanceof XTAction) {
			try{
				transition.convertTransitionGuard
				debug('''Converted Transition «transition.cppName»'s guard code''')
			} catch (Exception e) {
				error('''ERROR in Transition «transition.cppName»'s guard code''', e)
			}
		}
		
	].build
	
}
