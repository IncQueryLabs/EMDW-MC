package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtPackageInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.XtPackageInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtPackageInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtPackageMatch
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Package

class XTPackageRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTPackageMapping(engine),
			new XTPackageInModelMapping(engine),
			new XTPackageInComponentMapping(engine),
			new XTPackageInPackageMapping(engine)
		}
	}
}

/**
 * Transforms Packages whose type is exactly Package to XTPackages.
 */
class XTPackageMapping extends AbstractObjectMapping<XtPackageMatch, Package, org.eclipse.papyrusrt.xtumlrt.common.Package> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		org.eclipse.papyrusrt.xtumlrt.common.Package
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

	override createXtumlrtObject() {
		commonFactory.createPackage
	}

	override updateXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package xtumlrtObject, XtPackageMatch match) {
	}
	
	override insertXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package xtumlrtObject, XtPackageMatch match) {
	}

}

/**
 * Inserts XTPackages in their parent Model.
 */
class XTPackageInModelMapping extends AbstractContainmentMapping<XtPackageInModelMatch, Model, org.eclipse.papyrusrt.xtumlrt.common.Package> {

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
		if(rootMapping.umlRoot == match.model){
			rootMapping.xtumlrtRoot
		} else {
			// XXX known null return since this class is out of scope
			null
		}
	}
	
	override findChild(XtPackageInModelMatch match) {
		match.umlPackage.findXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}
	
	override insertChild(Model parent, org.eclipse.papyrusrt.xtumlrt.common.Package child) {
		parent.packages += child
	}

}

/**
 * Inserts XTPackages in their parent XTComponent.
 */
class XTPackageInComponentMapping extends AbstractContainmentMapping<XtPackageInComponentMatch, XTComponent, org.eclipse.papyrusrt.xtumlrt.common.Package> {

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
		match.component.findXtumlrtObject(XTComponent)
	}
	
	override findChild(XtPackageInComponentMatch match) {
		match.umlPackage.findXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}
	
	override insertChild(XTComponent parent, org.eclipse.papyrusrt.xtumlrt.common.Package child) {
		parent.packages += child
	}

}

/**
 * Inserts XTPackages in their parent XTPackage.
 */
class XTPackageInPackageMapping extends AbstractContainmentMapping<XtPackageInPackageMatch, org.eclipse.papyrusrt.xtumlrt.common.Package, org.eclipse.papyrusrt.xtumlrt.common.Package> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		XTPackageMapping.PRIORITY + 1
	}

	override getQuerySpecification() {
		xtPackageInPackage
	}

	override findParent(XtPackageInPackageMatch match) {
		match.parent.findXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}
	
	override findChild(XtPackageInPackageMatch match) {
		match.child.findXtumlrtObject(org.eclipse.papyrusrt.xtumlrt.common.Package)
	}
	
	override insertChild(org.eclipse.papyrusrt.xtumlrt.common.Package parent, org.eclipse.papyrusrt.xtumlrt.common.Package child) {
		parent.packages += child
	}

}