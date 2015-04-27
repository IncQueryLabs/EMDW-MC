package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import com.incquerylabs.emdw.cpp.codegeneration.rules.CPPTemplates

class RuleProvider {
	static extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension CPPTemplates = new CPPTemplates	
	
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
	
	public val xtClassRule = createRule.precondition(classStateMachine).action[ match |
		val cppClass = match.cppClass
		val header = classHeaderTemplate(cppClass, engine)
		debug(
		'''«cppClass.xtClass.name».hh
		
			«header»
		''')
		val body = classBodyTemplate(cppClass, engine)
		debug(
		'''«cppClass.xtClass.name».hh
		
			«body»
		''')
		trace('''Generated code for «cppClass.xtClass.name» CPPClass''')
	].build
	
	public def addRules(BatchTransformation transformation) {
		
		val rules = new TransformationRuleGroup(
			xtClassRule
		)
		
		transformation.addRules(rules)
	}
	
//	
//	private def initRule(AbstractObjectMapping rule) {
//		val eventDrivenRule = createRule.precondition().action().build
//	}
}