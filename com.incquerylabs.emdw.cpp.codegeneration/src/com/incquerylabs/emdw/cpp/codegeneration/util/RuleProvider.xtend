package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.rules.CPPTemplates
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class RuleProvider {
	static extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTemplates templates
	
	IncQueryEngine engine
	public val generatedFiles = <String, String>newHashMap
	
	new(IncQueryEngine engine) {
		this.engine = engine
		templates = new CPPTemplates(engine)
	}
	
	public val xtClassRule = createRule.precondition(classStateMachine).action[ match |
		val cppClass = match.cppClass
		trace('''Generating code for «cppClass.xtClass.name» CPPClass''')
		val header = classHeaderTemplate(cppClass)
		val className = cppClass.xtClass.name + "_statemachine_snippet"
		generatedFiles.put('''«className».hh''', header.toString)
		debug(
		'''
			«className».hh
			
			«header»
		''')
		val body = classBodyTemplate(cppClass)
		generatedFiles.put('''«className».cc''', body.toString)
		debug(
		'''
			«className».cc
			
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