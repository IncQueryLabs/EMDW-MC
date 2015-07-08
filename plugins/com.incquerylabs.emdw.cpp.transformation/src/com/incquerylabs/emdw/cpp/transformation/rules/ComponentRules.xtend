package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ComponentRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val BatchTransformationStatements statements
	
	val PackageRules packageRules
	val ClassRules classRules
	val EntityRules entityRules
	
	new(BatchTransformationStatements statements, PackageRules packageRules, ClassRules classRules, EntityRules entityRules) {
		this.statements = statements
		this.packageRules = packageRules
		this.classRules = classRules
		this.entityRules = entityRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			cleanComponentsRule,
			componentRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val cleanComponentsRule = createRule.precondition(cppComponents).action[ match |
		val cppComponent = match.cppComponent
		cppComponent.subElements.clear
		val bodyDirectory = cppComponent.bodyDirectory
		if(bodyDirectory != null){
			bodyDirectory.files.clear
			bodyDirectory.subDirectories.clear
		}
		val headerDirectory = cppComponent.headerDirectory
		if(headerDirectory != null){
			headerDirectory.files.clear
			headerDirectory.subDirectories.clear
		}
		if(cppComponent.mainBodyFile != null){
			bodyDirectory.files += cppComponent.mainBodyFile
		}
		if(cppComponent.mainHeaderFile != null){
			headerDirectory.files += cppComponent.mainHeaderFile
		}
		if(cppComponent.declarationHeaderFile != null){
			headerDirectory.files += cppComponent.declarationHeaderFile
		}
		if(cppComponent.definitionHeaderFile != null){
			headerDirectory.files += cppComponent.definitionHeaderFile
		}
		
		trace('''Cleaned Component «cppComponent.xtComponent.name»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val componentRule = createRule.precondition(cppComponents).action[match |
		val cppComponent = match.cppComponent
		cppComponent.addIncludesBetweenOwnFiles
		trace('''Transforming subelements of Component «cppComponent.xtComponent.name»''')
		fireAllCurrent(classRules.classRule, [it.cppComponent == cppComponent])
		fireAllCurrent(entityRules.entityAttributeRule, [it.cppElement == cppComponent])
		fireAllCurrent(entityRules.entityOperationRule, [it.cppElement == cppComponent])
		fireAllCurrent(packageRules.packageInComponentRule, [it.cppComponent == cppComponent])
	].build
	
	def addIncludesBetweenOwnFiles(CPPComponent cppComponent){
		val mainHeader = cppComponent.mainHeaderFile
		val mainBody = cppComponent.mainBodyFile
		val declHeader = cppComponent.declarationHeaderFile
		val defHeader = cppComponent.definitionHeaderFile
		mainHeader.addInclude(declHeader)
		mainBody.addInclude(mainHeader)
		mainBody.addInclude(defHeader)
		defHeader.addInclude(mainHeader)
	}
	
	def addInclude(CPPSourceFile cppFile, CPPHeaderFile cppHeader){
		if(!cppFile.includedHeaders.contains(cppHeader)){
			cppFile.includedHeaders += cppHeader
		}
	}
}