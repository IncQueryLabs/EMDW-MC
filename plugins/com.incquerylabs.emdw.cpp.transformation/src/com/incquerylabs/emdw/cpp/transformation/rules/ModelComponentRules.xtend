package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.transformation.mappings.AbstractObjectMapping
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInModelMatch
import com.incquerylabs.emdw.cpp.transformation.queries.XtComponentInPackageMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

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

	
}