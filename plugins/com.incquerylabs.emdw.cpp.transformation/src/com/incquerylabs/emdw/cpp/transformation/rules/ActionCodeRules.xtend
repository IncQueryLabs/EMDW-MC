package com.incquerylabs.emdw.cpp.transformation.rules

import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ActionCodeRules {
	private static val RETHROW_EXCEPTIONS = false
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val BatchTransformationStatements statements
	extension val BodyConverter converter
	val BasicUMLContextProvider context
	
	new(BatchTransformationStatements statements, AdvancedIncQueryEngine engine) {
		this.statements = statements
		this.converter = new BodyConverter
		this.context = new BasicUMLContextProvider(engine)
		converter.initialize(engine, context)
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
	val operationActionCodeRule = createRule.precondition(cppOperationWithActionCodes).action [ match |
		val cppOperation = match.cppOperation
		try{
			cppOperation.convertOperation
			logResult('''Converted Operation «cppOperation.cppName»'s code''')
		} catch (Exception e) {
			e.rethrowOrLogException('''ERROR in Operation «cppOperation.cppName»'s code''')
		}
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateEntryActionCodeRule = createRule.precondition(cppStateWithEntryActionCodes).action[ match |
		val cppState = match.cppState
		try{
			cppState.convertStateEntry
			logResult('''Converted State «cppState.cppName»'s entry code''')
		} catch (Exception e) {
			e.rethrowOrLogException('''ERROR in State «cppState.cppName»'s entry code''')
		}
	].build
	
	@Accessors(PUBLIC_GETTER)
	val stateExitActionCodeRule = createRule.precondition(cppStateWithExitActionCodes).action[ match |
		val cppState = match.cppState
		try{
			cppState.convertStateExit
			logResult('''Converted State «cppState.cppName»'s exit code''')
		} catch (Exception e) {
			e.rethrowOrLogException('''ERROR in State «cppState.cppName»'s exit code''')
		}
	].build
	
	@Accessors(PUBLIC_GETTER)
	val transitionActionCodeRule = createRule.precondition(cppTransitionWithActionCodes).action[ match |
		val cppTransition = match.cppTransition
		try{
			cppTransition.convertTransition
			logResult('''Converted Transition «cppTransition.cppName»'s code''')
		} catch (Exception e) {
			e.rethrowOrLogException('''ERROR in Transition «cppTransition.cppName»'s code''')
		}
	].build
	
	@Accessors(PUBLIC_GETTER)
	val guardActionCodeRule = createRule.precondition(cppTransitionWithGuardActionCodes).action[ match |
		val cppTransition = match.cppTransition
		try{
			cppTransition.convertTransitionGuard
			logResult('''Converted Transition «cppTransition.cppName»'s guard code''')
		} catch (Exception e) {
			e.rethrowOrLogException('''ERROR in Transition «cppTransition.cppName»'s guard code''')
		}
	].build
	
	private def rethrowOrLogException(Exception e, String errorMessage) {
		if(RETHROW_EXCEPTIONS){
			throw e;
		} else {
			error(errorMessage, e)
		}
	}
	
	private def logResult(String message){
		debug('''«message»''')
	}
}
