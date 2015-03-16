package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtPackageInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.XtPackageInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtPackageMatch
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Package

class XTPackageRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new XTPackageMapping(engine).specification,
			new XTPackageInModelMapping(engine).specification,
			new XTPackageInComponentMapping(engine).specification
			// TODO PackageInPackage
		}
	}
}

class XTPackageMapping extends AbstractObjectRule<XtPackageMatch, Package, XTPackage> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTPackage
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		xtPackage
	}

	override getUmlObject(XtPackageMatch match) {
		match.umlPackage
	}

	override createXtumlrtObject(Package umlObject, XtPackageMatch match) {
		xtumlFactory.createXTPackage
	}

	override updateXtumlrtObject(XTPackage xtumlrtObject, XtPackageMatch match) {
	}
	
	override insertXtumlrtObject(XTPackage xtumlrtObject, XtPackageMatch match) {
	}

}


class XTPackageInModelMapping extends AbstractContainmentRule<XtPackageInModelMatch, Model, XTPackage> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTPackageMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtPackageInModel
	}

	override findParent(XtPackageInModelMatch match) {
		rootMapping.xtumlrtRoot
	}
	
	override findChild(XtPackageInModelMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlPackage).head as XTPackage
	}
	
	override insertChild(Model parent, XTPackage child) {
		parent.rootPackages += child
	}

}

class XTPackageInComponentMapping extends AbstractContainmentRule<XtPackageInComponentMatch, XTComponent, XTPackage> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(XTPackageMapping.PRIORITY, XTComponentMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		xtPackageInComponent
	}

	override findParent(XtPackageInComponentMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}
	
	override findChild(XtPackageInComponentMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlPackage).head as XTPackage
	}
	
	override insertChild(XTComponent parent, XTPackage child) {
		parent.packages += child
	}

}