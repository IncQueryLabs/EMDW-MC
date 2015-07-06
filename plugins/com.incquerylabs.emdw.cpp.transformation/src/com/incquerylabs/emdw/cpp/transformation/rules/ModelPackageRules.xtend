package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtModelPackageInPackageMatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtPackageInModelMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Package

class ModelPackageRules {
	
	static def Set<AbstractObjectMapping<?, ?, ?>> getRules(IncQueryEngine engine) {
		#{
			new ModelPackageMapping(engine),
			new ModelPackageInPackageMapping(engine)
		}
	}
	
}

class ModelPackageMapping extends AbstractObjectMapping<XtPackageInModelMatch, Package, CPPPackage> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlObject(XtPackageInModelMatch match) {
		match.xtPackage
	}
	
	override protected getCppObject(Package xtPackage) {
		engine.cppPackages.getAllValuesOfcppPackage(xtPackage).head
	}
	
	override protected createCppObject(XtPackageInModelMatch match) {
		createCPPPackage => [
			commonPackage = match.xtPackage
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtPackage]

			// Creating package directories
			bodyDir = createCPPDirectory
			headerDir = createCPPDirectory

			// Creating package files
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
		]
	}
	
	override protected insertCppObject(CPPPackage cppPackage, XtPackageInModelMatch match) {
		val parent = match.cppModel
		parent.headerDir.subDirectories += cppPackage.headerDir
		parent.bodyDir.subDirectories += cppPackage.bodyDir
		parent.subElements += cppPackage
		debug(''' CPPPackage parent: «parent»''')
	}
	
	override protected updateCppObject(CPPPackage cppObject, XtPackageInModelMatch match) {
		
	}
	
	override getQuerySpecification() {
		xtPackageInModel
	}

	
}

class ModelPackageInPackageMapping extends AbstractObjectMapping<XtModelPackageInPackageMatch, Package, CPPPackage> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlObject(XtModelPackageInPackageMatch match) {
		match.xtChildPackage
	}
	
	override protected getCppObject(Package xtPackage) {
		engine.cppPackages.getAllValuesOfcppPackage(xtPackage).head
	}
	
	override protected createCppObject(XtModelPackageInPackageMatch match) {
		createCPPPackage => [
			commonPackage = match.xtChildPackage
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtChildPackage]

			// Creating package directories
			bodyDir = createCPPDirectory
			headerDir = createCPPDirectory

			// Creating package files
			bodyFile = createCPPBodyFile
			bodyDir.files += bodyFile
			headerFile = createCPPHeaderFile
			headerDir.files += headerFile
		]
	}
	
	override protected insertCppObject(CPPPackage cppPackage, XtModelPackageInPackageMatch match) {
		val parent = match.cppParentPackage
		parent.headerDir.subDirectories += cppPackage.headerDir
		parent.bodyDir.subDirectories += cppPackage.bodyDir
		parent.subElements += cppPackage
		debug(''' CPPPackage parent: «parent»''')
	}
	
	override protected updateCppObject(CPPPackage cppObject, XtModelPackageInPackageMatch match) {
		
	}
	
	override getQuerySpecification() {
		xtModelPackageInPackage
	}
	
}