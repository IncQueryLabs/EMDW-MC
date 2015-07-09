package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInModelMatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInPackageMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.emf.ecore.util.EcoreUtil

class ModelComponentRules {
	
	static def Set<AbstractObjectMapping<?, ?, ?>> getRules(IncQueryEngine engine) {
		#{
			new ComponentInModelMapping(engine),
			new ComponentInPackageMapping(engine)
		}
	}
}

class ComponentInModelMapping extends AbstractObjectMapping<XtComponentInModelMatch, XTComponent, CPPComponent> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlObject(XtComponentInModelMatch match) {
		match.xtComponent
	}
	
	override protected getCppObject(XTComponent xtComponent) {
		engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
	}
	
	override protected createCppObject(XtComponentInModelMatch match) {
		val componentDir = createCPPDirectory
		
		val mainBodyFile = createCPPBodyFile
		val mainHeaderFile = createCPPHeaderFile
		val declHeaderFile = createCPPHeaderFile
		val defHeaderFile = createCPPHeaderFile
		
		componentDir.files += mainBodyFile
		componentDir.files += mainHeaderFile
		componentDir.files += declHeaderFile
		componentDir.files += defHeaderFile

		createCPPComponent => [
			it.xtComponent = match.xtComponent
			it.ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtComponent]
			
			it.bodyDirectory = componentDir
			it.headerDirectory = componentDir
			
			it.mainHeaderFile = mainHeaderFile
			it.mainBodyFile = mainBodyFile
			
			it.declarationHeaderFile = declHeaderFile
			it.definitionHeaderFile = defHeaderFile
		]
	}
	
	override protected insertCppObject(CPPComponent cppComponent, XtComponentInModelMatch match) {
		val parent = match.cppModel
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
	
	override protected removeCppObject(CPPComponent cppComponent, XtComponentInModelMatch match) {
		val parent = match.cppModel
		parent.subElements.remove(cppComponent)
		
		parent.headerDir.subDirectories.remove(cppComponent.headerDirectory)
		EcoreUtil.remove(cppComponent.headerDirectory)
		
		EcoreUtil.remove(cppComponent)
	}
	
}

class ComponentInPackageMapping extends AbstractObjectMapping<XtComponentInPackageMatch, XTComponent, CPPComponent> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlObject(XtComponentInPackageMatch match) {
		match.xtComponent
	}
		
	override protected getCppObject(XTComponent xtComponent) {
		engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
	}
	
	override protected createCppObject(XtComponentInPackageMatch match) {
		val componentDir = createCPPDirectory
		
		val mainBodyFile = createCPPBodyFile
		val mainHeaderFile = createCPPHeaderFile
		val declHeaderFile = createCPPHeaderFile
		val defHeaderFile = createCPPHeaderFile
		
		componentDir.files += mainBodyFile
		componentDir.files += mainHeaderFile
		componentDir.files += declHeaderFile
		componentDir.files += defHeaderFile

		createCPPComponent => [
			it.xtComponent = match.xtComponent
			it.ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = match.xtComponent]
			
			it.bodyDirectory = componentDir
			it.headerDirectory = componentDir
			
			it.mainHeaderFile = mainHeaderFile
			it.mainBodyFile = mainBodyFile
			
			it.declarationHeaderFile = declHeaderFile
			it.definitionHeaderFile = defHeaderFile
		]
	}
	
	override protected insertCppObject(CPPComponent cppComponent, XtComponentInPackageMatch match) {
		val parent = match.cppParentPackage
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
	
	override protected removeCppObject(CPPComponent cppComponent, XtComponentInPackageMatch match) {
		val parent = match.cppParentPackage
		parent.subElements.remove(cppComponent)
		
		parent.headerDir.subDirectories.remove(cppComponent.headerDirectory)
		EcoreUtil.remove(cppComponent.headerDirectory)
		
		EcoreUtil.remove(cppComponent)
	}

	
}