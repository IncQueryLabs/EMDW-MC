package com.incquerylabs.emdw.cpp.transformation.rules

import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class IncludeRules {
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			classComponentIncludeRule,
			packageComponentIncludeRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val classComponentIncludeRule = createRule.precondition(cppClassInComponentSubPackages).action[ match |
		val cppClass = match.cppClass
		val cppComponent = match.cppComponent
		val componentDeclHeader = cppComponent.declarationHeaderFile
		val componentDefHeader = cppComponent.definitionHeaderFile
		val classHeader = cppClass.headerFile
		val classBody = cppClass.bodyFile
		
		classHeader.includedHeaders += componentDeclHeader
		classBody.includedHeaders += componentDefHeader
		componentDefHeader.includedHeaders += classHeader
		
		trace('''Added includes between «cppClass.cppName» and «cppComponent.cppName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val packageComponentIncludeRule = createRule.precondition(cppPackageInComponentSubPackages).action[ match |
		val cppPackage = match.cppPackage
		val cppComponent = match.cppComponent
		val componentDeclHeader = cppComponent.declarationHeaderFile
		val componentDefHeader = cppComponent.definitionHeaderFile
		val packageHeader = cppPackage.headerFile
		val packageBody = cppPackage.bodyFile
		
		packageHeader.includedHeaders += componentDeclHeader
		packageBody.includedHeaders += componentDefHeader
		componentDefHeader.includedHeaders += packageHeader
		trace('''Added includes between «cppPackage.cppName» and «cppComponent.cppName»''')
	].build
}