package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class PackageRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			packageInComponentRule,
			packageInPackageRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val packageInComponentRule = createRule.precondition(cppComponentPackages).action[ match |
		val xtPackage = match.xtPackage
		val parentHeaderDir = match.cppComponent.headerDirectory
		val parentBodyDir = match.cppComponent.bodyDirectory
		val cppPackage = createCppPackage(xtPackage, parentHeaderDir, parentBodyDir)
		match.cppComponent.subElements += cppPackage
		trace('''Mapped Package «xtPackage.name» in component «match.xtComponent.name» to CPPPackage''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val packageInPackageRule = createRule.precondition(cppPackagesInPackages).action[ match |
		val xtPackage = match.xtPackage
		val parentHeaderDir = match.cppParentPackage.headerDir
		val parentBodyDir = match.cppParentPackage.bodyDir
		val cppPackage = createCppPackage(xtPackage, parentHeaderDir, parentBodyDir)
		match.cppParentPackage.subElements += cppPackage
		trace('''Mapped Package «xtPackage.name» in package «match.xtParentPackage.name» to CPPPackage''')
	].build
	
	protected def createCppPackage(Package xtPackage, CPPDirectory parentHeaderDir, CPPDirectory parentBodyDir){
		val cppPackage = createCPPPackage => [
			// Setting name and common package
			commonPackage = xtPackage
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = xtPackage]

			// Creating package directories
			bodyDir = createCPPDirectory
			parentBodyDir.subDirectories += bodyDir
			headerDir = createCPPDirectory
			parentHeaderDir.subDirectories += headerDir

			// Creating package files
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
		]
		
		return cppPackage
	}
}