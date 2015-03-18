package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtComponentInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtComponentInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtComponentMatch
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Class

class XTComponentRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTComponentMapping(engine).specification,
			new XTComponentInModelMapping(engine).specification,
			new XTComponentInPackageMapping(engine).specification
		}
	}
}

class XTComponentMapping extends AbstractObjectRule<XtComponentMatch, Class, XTComponent> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTComponent
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtComponent
	}

	override getUmlObject(XtComponentMatch match) {
		match.component
	}

	override createXtumlrtObject(Class umlObject, XtComponentMatch match) {
		xtumlFactory.createXTComponent
	}

	override updateXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
	}

	override protected insertXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
	}
	
}

class XTComponentInModelMapping extends AbstractContainmentRule<XtComponentInModelMatch, Model, XTComponent> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTComponentMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtComponentInModel
	}

	override findParent(XtComponentInModelMatch match) {
		rootMapping.xtumlrtRoot
	}
	
	override findChild(XtComponentInModelMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}
	
	override insertChild(Model parent, XTComponent child) {
		parent.topEntities += child
	}

}

class XTComponentInPackageMapping extends AbstractContainmentRule<XtComponentInPackageMatch, XTPackage, XTComponent> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(XTComponentMapping.PRIORITY, XTPackageMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		xtComponentInPackage
	}

	override findParent(XtComponentInPackageMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlPackage).head as XTPackage
	}
	
	override findChild(XtComponentInPackageMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}
	
	override insertChild(XTPackage parent, XTComponent child) {
		parent.entities += child
	}

}