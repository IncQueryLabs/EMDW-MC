package com.incquerylabs.emdw.cpp.codegeneration.util

import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.templates.CPPTemplates
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.TransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup

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
	
	public val xtClassRule = createRule.precondition(cppClasses).action[ match |
		val cppClass = match.cppClass
		trace('''Generating code for «cppClass.cppName» CPPClass''')
		val header = classHeaderTemplate(cppClass)
		val className = cppClass.cppName + "_statemachine_snippet"
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
		trace('''Generated code for «cppClass.cppName» CPPClass''')
	].build
	
	public def addRules(BatchTransformation transformation) {
		
		val rules = new BatchTransformationRuleGroup(
			xtClassRule
		)
		
		transformation.addRules(rules)
	}
	
//	
//	private def initRule(AbstractObjectMapping rule) {
//		val eventDrivenRule = createRule.precondition().action().build
//	}
}