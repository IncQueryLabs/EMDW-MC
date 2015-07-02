package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.google.common.collect.LinkedListMultimap
import com.google.common.collect.Multimap
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInModelMatch
import com.incquerylabs.emdw.cpp.transformation.util.RuleProvider
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInPackageMatch
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage

class ModelComponentRules {
	
	static Multimap<Class<?>, AbstractObjectMapping<?,?,?>> keyMap;
	
	static def Multimap<Class<?>, AbstractObjectMapping<?,?,?>> getRules(IncQueryEngine engine, RuleProvider provider) {
		keyMap = LinkedListMultimap.create()
		keyMap.put(CPPComponent, new ComponentInModelMapping(engine, provider))
		keyMap.put(CPPComponent, new ComponentInPackageMapping(engine, provider))
		keyMap
	}
}

class ComponentInModelMapping extends AbstractObjectMapping<XtComponentInModelMatch, XTComponent, CPPComponent> {
	
	RuleProvider provider
	
	new(IncQueryEngine engine, RuleProvider provider) {
		super(engine)
		this.provider = provider
	}
	
	override protected getXtumlObject(XtComponentInModelMatch match) {
		match.xtComponent
	}
	
	override protected createCppObject(XtComponentInModelMatch match) {
		createCPPComponent => [
			xtComponent = match.xtComponent
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtComponent]
			
			bodyDirectory = createCPPDirectory
			headerDirectory = createCPPDirectory
			
			mainHeaderFile = createCPPHeaderFile
			headerDirectory.files += mainHeaderFile
			
			mainBodyFile = createCPPBodyFile
			bodyDirectory.files += mainHeaderFile
		]
	}
	
	override protected insertCppObject(CPPComponent cppComponent, XtComponentInModelMatch match) {
		val parent = provider.findTraces(CPPModel).get(match.xtModel)
		parent.headerDir.subDirectories += cppComponent.headerDirectory
		parent.bodyDir.subDirectories += cppComponent.bodyDirectory
		parent.subElements += cppComponent
		debug(''' CPPComponent parent: «parent»''')
	}
	
	override protected updateCppObject(CPPComponent cppObject, XtComponentInModelMatch match) {
	}
	
	override getQuerySpecification() {
		xtComponentInModel
	}
	
}

class ComponentInPackageMapping extends AbstractObjectMapping<XtComponentInPackageMatch, XTComponent, CPPComponent> {
	
	RuleProvider provider
	
	new(IncQueryEngine engine, RuleProvider provider) {
		super(engine)
		this.provider = provider
	}
	
	override protected getXtumlObject(XtComponentInPackageMatch match) {
		match.xtComponent
	}
	
	override protected createCppObject(XtComponentInPackageMatch match) {
		createCPPComponent => [
			xtComponent = match.xtComponent
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtComponent]
			
			bodyDirectory = createCPPDirectory
			headerDirectory = createCPPDirectory
			
			mainHeaderFile = createCPPHeaderFile
			headerDirectory.files += mainHeaderFile
			
			mainBodyFile = createCPPBodyFile
			bodyDirectory.files += mainHeaderFile
		]
	}
	
	override protected insertCppObject(CPPComponent cppComponent, XtComponentInPackageMatch match) {
		val parent = provider.findTraces(CPPPackage).get(match.xtParentPackage)
		parent.headerDir.subDirectories += cppComponent.headerDirectory
		parent.bodyDir.subDirectories += cppComponent.bodyDirectory
		parent.subElements += cppComponent
		debug(''' CPPComponent parent: «parent»''')
	}
	
	override protected updateCppObject(CPPComponent cppObject, XtComponentInPackageMatch match) {
	}
	
	override getQuerySpecification() {
		xtComponentInPackage
	}
	
}