package com.incquerylabs.emdw.cpp.codegeneration.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppPackageInQualifiedNamedElementMatch
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppPackageInQualifiedNamedElementMatcher
import com.incquerylabs.emdw.cpp.codegeneration.templates.CPPTemplates
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRule
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation

class RuleProvider {
	static extension val CppCodeGenerationQueries codeGenQueries = CppCodeGenerationQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTemplates templates
	
	IncQueryEngine engine
	public val generatedFiles = <String, String>newHashMap
	public val generatedCPPSourceFiles = <CPPSourceFile, CharSequence>newHashMap()
	extension BatchTransformationStatements statements
	
	new(IncQueryEngine engine, BatchTransformationStatements statements) {
		this.engine = engine
		this.templates = new CPPTemplates(engine)
		this.statements = statements
	}
	
	public val cppComponentRule = createRule.precondition(cppComponents).action[ match |
		val cppComponent = match.cppComponent
		val componentName = cppComponent.cppName
		val declHeaderName = '''«componentName»_decl.hh'''
		val defHeaderName = '''«componentName»_def.hh'''
		val mainHeaderName = '''«componentName»_main.hh'''
		val mainBodyName = '''«componentName»_main.cc'''
		
		trace('''Generating code for «cppComponent.cppName» CPPComponent''')
		
		val declHeader = componentDeclHeaderTemplate(cppComponent)
		val defHeader = componentDefHeaderTemplate(cppComponent)
		val mainHeader = componentMainHeaderTemplate(cppComponent)
		val mainBody = componentMainBodyTemplate(cppComponent)
		generatedFiles.put(declHeaderName, declHeader.toString)
		generatedFiles.put(defHeaderName, defHeader.toString)
		generatedFiles.put(mainHeaderName, mainHeader.toString)
		generatedFiles.put(mainBodyName, mainBody.toString)
		generatedCPPSourceFiles.put(cppComponent.declarationHeaderFile, declHeader)
		generatedCPPSourceFiles.put(cppComponent.definitionHeaderFile, defHeader)
		generatedCPPSourceFiles.put(cppComponent.mainHeaderFile, mainHeader)
		generatedCPPSourceFiles.put(cppComponent.mainBodyFile, mainBody)
		
		trace('''Generated code for «cppComponent.cppName» CPPComponent''')
		trace('''Generating code for subelements of «cppComponent.cppName» CPPComponent''')
		fireAllCurrent(cppClassRule, [it.container == cppComponent])
		fireAllCurrent(cppPackageRule, [it.container == cppComponent])
		
		logGeneratedFiles()
	].build
	
	public val BatchTransformationRule<CppPackageInQualifiedNamedElementMatch, CppPackageInQualifiedNamedElementMatcher> cppPackageRule = 
	  createRule.precondition(cppPackageInQualifiedNamedElement).action[ match |
		val cppPackage = match.cppPackage
		val packageName = cppPackage.cppName
		val mainHeaderName = '''«packageName»_main.hh'''
		val mainBodyName = '''«packageName»_main.cc'''
		
		trace('''Generating code for «packageName» CPPPackage''')
		
		val mainHeader = packageMainHeaderTemplate(cppPackage)
		val mainBody = packageMainBodyTemplate(cppPackage)
		generatedFiles.put(mainHeaderName, mainHeader.toString)
		generatedFiles.put(mainBodyName, mainBody.toString)
		generatedCPPSourceFiles.put(cppPackage.headerFile, mainHeader)
		generatedCPPSourceFiles.put(cppPackage.bodyFile, mainBody)
		
		
		trace('''Generated code for «packageName» CPPPackage''')
		trace('''Generating code for subelements of «packageName» CPPPackage''')
		fireAllCurrent(cppClassRule, [it.container == cppPackage])
		fireAllCurrent(cppPackageRule, [it.container == cppPackage])
	].build
	
	public val cppClassRule = createRule.precondition(cppClassInQualifiedNamedElement).action[ match |
		val cppClass = match.cppClass
		trace('''Generating code for «cppClass.cppName» CPPClass''')
		val header = classHeaderTemplate(cppClass)
		val className = cppClass.cppName + "_statemachine_snippet"
		generatedFiles.put('''«className».hh''', header.toString)
		generatedCPPSourceFiles.put(cppClass.headerFile, header)
		val body = classBodyTemplate(cppClass)
		generatedFiles.put('''«className».cc''', body.toString)
		generatedCPPSourceFiles.put(cppClass.bodyFile, body)
		trace('''Generated code for «cppClass.cppName» CPPClass''')
	].build
	
	def logGeneratedFiles(){
		generatedFiles.forEach[fileName, fileContent|
			debug(
			'''
				«fileName»
				
				«fileContent»
			'''
			)
		]
	}
	
	public def addRules(BatchTransformation transformation) {
		
		val rules = new BatchTransformationRuleGroup(
			cppComponentRule,
			cppPackageRule,
			cppClassRule
		)
		
		transformation.addRules(rules)
	}
}