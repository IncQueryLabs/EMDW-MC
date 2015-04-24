package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class RuleProvider {
	static extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	IncQueryEngine engine
	new(IncQueryEngine engine) {
		this.engine = engine
	}
	
	/**
	 * Public method that initiates each rule
	 * 
	 */
	public def initRules() {
//		ActionChainRules.getRules(engine).initRules
	}
	
	public def addRules(BatchTransformation transformation) {
		
		
		val rules = new TransformationRuleGroup(
		)
		
		transformation.addRules(rules)
	}
	
//	
//	private def initRule(AbstractObjectMapping rule) {
//		val eventDrivenRule = createRule.precondition().action().build
//	}
}