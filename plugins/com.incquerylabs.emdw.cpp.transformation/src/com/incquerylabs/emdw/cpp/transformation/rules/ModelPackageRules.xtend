package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtModelPackageInPackageMatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtPackageInModelMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.emf.ecore.util.EcoreUtil

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
	
	override protected getCppObject(XtPackageInModelMatch match) {
		val cppPackages = match.cppModel.subElements.filter(CPPPackage)
		val cppPackage = cppPackages.filter[commonPackage.equals(match.xtPackage)].head
		cppPackage
	}
	
	override protected createCppObject(XtPackageInModelMatch match) {
		createCPPPackage => [
			commonPackage = match.xtPackage
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtPackage]
			it.createPackageFiles
		]
	}
	
	override protected insertCppObject(CPPPackage cppPackage, XtPackageInModelMatch match) {
		val parent = match.cppModel
		cppPackage.createDirectories(parent)
		parent.subElements += cppPackage
		debug(''' CPPPackage parent: «parent»''')
	}
	
	override protected updateCppObject(CPPPackage cppObject, XtPackageInModelMatch match) {
		
	}
	
	override getQuerySpecification() {
		xtPackageInModel
	}
	
	override protected removeCppObject(CPPPackage cppPackage, XtPackageInModelMatch match) {
		val parent = match.cppModel
		parent.subElements.remove(cppPackage)
		cppPackage.removeDirectories(parent)
		EcoreUtil.remove(cppPackage)
	}
	
}

class ModelPackageInPackageMapping extends AbstractObjectMapping<XtModelPackageInPackageMatch, Package, CPPPackage> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlObject(XtModelPackageInPackageMatch match) {
		match.xtChildPackage
	}
	
	override protected getCppObject(XtModelPackageInPackageMatch match) {
		val cppPackages = match.cppParentPackage.subElements.filter(CPPPackage)
		val cppPackage = cppPackages.filter[commonPackage == match.xtChildPackage].head
		return cppPackage
	}
	
	override protected createCppObject(XtModelPackageInPackageMatch match) {
		createCPPPackage => [
			commonPackage = match.xtChildPackage
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtChildPackage]
			it.createPackageFiles
		]
	}
	
	override protected insertCppObject(CPPPackage cppPackage, XtModelPackageInPackageMatch match) {
		val parent = match.cppParentPackage
		cppPackage.createDirectories(parent)
		parent.subElements += cppPackage
		debug(''' CPPPackage parent: «parent»''')
	}
	
	override protected updateCppObject(CPPPackage cppObject, XtModelPackageInPackageMatch match) {
		
	}
	
	override getQuerySpecification() {
		xtModelPackageInPackage
	}
	
	override protected removeCppObject(CPPPackage cppPackage, XtModelPackageInPackageMatch match) {
		val parent = match.cppParentPackage
		parent.subElements.remove(cppPackage)
		cppPackage.removeDirectories(parent)
		EcoreUtil.remove(cppPackage)
	}
	
}