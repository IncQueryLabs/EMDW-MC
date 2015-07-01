package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtPackageInModelMatch
import com.incquerylabs.emdw.cpp.transformation.util.RuleProvider
import java.util.Map
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Package

class ModelPackageRules {
	
	static def Map<Class<?>, AbstractObjectMapping<?,?,?>> getRules(IncQueryEngine engine, RuleProvider provider) {
		val keyMap = <Class<?>, AbstractObjectMapping<?,?,?>>newHashMap()
		keyMap.put(CPPPackage, new ModelPackageMapping(engine, provider))
		keyMap
	}
	
}

class ModelPackageMapping extends AbstractObjectMapping<XtPackageInModelMatch, Package, CPPPackage> {
	
	RuleProvider provider
	
	new(IncQueryEngine engine, RuleProvider provider) {
		super(engine)
		this.provider = provider
	}
		
	override protected getXtumlObject(XtPackageInModelMatch match) {
		match.xtPackage
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
		val parent = provider.findTraces(CPPModel).get(match.xtModel)
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