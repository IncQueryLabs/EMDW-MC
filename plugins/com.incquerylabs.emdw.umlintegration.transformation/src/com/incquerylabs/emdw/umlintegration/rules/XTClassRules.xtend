package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Class

class XTClassRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTClassMapping(engine),
			new XTClassInModelMapping(engine),
			new XTClassInPackageMapping(engine),
			new XTClassInComponentMapping(engine)
		}
	}
}

/**
 * Transforms Classes whose type is exactly Class to XTClasses.
 */
class XTClassMapping extends AbstractObjectMapping<XtClassMatch, Class, XTClass> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		XTClass
	}
	
	public static val PRIORITY = CommonPriorities.CLASS_MAPPING_PRIORITY

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

/**
 * Inserts XTClasses in their parent Model.
 */
class XTClassInModelMapping extends AbstractContainmentMapping<XtClassInModelMatch, Model, XTClass> {

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
		if(rootMapping.umlRoot == match.model){
			rootMapping.xtumlrtRoot
		} else {
			// XXX known null return since this class is out of scope
			null
		}
	}
	
	override findChild(XtClassInModelMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}
	
	override insertChild(Model parent, XTClass child, XtClassInModelMatch match) {
		parent.entities += child
	}

}

/**
 * Inserts XTClasses in their parent XTPackage.
 */
class XTClassInPackageMapping extends AbstractContainmentMapping<XtClassInPackageMatch, Package, XTClass> {

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
		match.umlPackage.findXtumlrtObject(Package)
	}
	
	override findChild(XtClassInPackageMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}
	
	override insertChild(Package parent, XTClass child, XtClassInPackageMatch match) {
		parent.entities += child
	}

}

/**
 * Inserts XTClasses in their parent XTComponent.
 */
class XTClassInComponentMapping extends AbstractContainmentMapping<XtClassInComponentMatch, XTComponent, XTClass> {

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
		match.component.findXtumlrtObject(XTComponent)
	}
	
	override findChild(XtClassInComponentMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}
	
	override insertChild(XTComponent parent, XTClass child, XtClassInComponentMatch match) {
		parent.entities += child
	}

}