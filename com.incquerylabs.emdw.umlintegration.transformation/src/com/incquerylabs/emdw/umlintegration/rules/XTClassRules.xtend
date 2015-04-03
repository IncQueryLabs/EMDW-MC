package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassMatch
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Class

class XTClassRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTClassMapping(engine).specification,
			new XTClassInModelMapping(engine).specification,
			new XTClassInPackageMapping(engine).specification,
			new XTClassInComponentMapping(engine).specification
		}
	}
}

class XTClassMapping extends AbstractObjectRule<XtClassMatch, Class, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTClass
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtClass
	}

	override getUmlObject(XtClassMatch match) {
		match.umlClass
	}

	override createXtumlrtObject() {
		xtumlFactory.createXTClass
	}

	override updateXtumlrtObject(XTClass xtumlrtObject, XtClassMatch match) {
	}

	override protected insertXtumlrtObject(XTClass xtumlrtObject, XtClassMatch match) {
	}
	
}

class XTClassInModelMapping extends AbstractContainmentRule<XtClassInModelMatch, Model, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTClassMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtClassInModel
	}

	override findParent(XtClassInModelMatch match) {
		rootMapping.xtumlrtRoot
	}
	
	override findChild(XtClassInModelMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as XTClass
	}
	
	override insertChild(Model parent, XTClass child) {
		parent.topEntities += child
	}

}

class XTClassInPackageMapping extends AbstractContainmentRule<XtClassInPackageMatch, XTPackage, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(XTClassMapping.PRIORITY, XTPackageMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		xtClassInPackage
	}

	override findParent(XtClassInPackageMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlPackage).head as XTPackage
	}
	
	override findChild(XtClassInPackageMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as XTClass
	}
	
	override insertChild(XTPackage parent, XTClass child) {
		parent.entities += child
	}

}

class XTClassInComponentMapping extends AbstractContainmentRule<XtClassInComponentMatch, XTComponent, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(XTClassMapping.PRIORITY, XTComponentMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		xtClassInComponent
	}

	override findParent(XtClassInComponentMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}
	
	override findChild(XtClassInComponentMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as XTClass
	}
	
	override insertChild(XTComponent parent, XTClass child) {
		parent.ownedClasses += child
	}

}