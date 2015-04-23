package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtClassInComponentMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtClassMatch
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
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
		rootMapping.xtumlrtRoot
	}
	
	override findChild(XtClassInModelMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}
	
	override insertChild(Model parent, XTClass child) {
		parent.topEntities += child
	}

}

/**
 * Inserts XTClasses in their parent XTPackage.
 */
class XTClassInPackageMapping extends AbstractContainmentMapping<XtClassInPackageMatch, XTPackage, XTClass> {

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
		match.umlPackage.findXtumlrtObject(XTPackage)
	}
	
	override findChild(XtClassInPackageMatch match) {
		match.umlClass.findXtumlrtObject(XTClass)
	}
	
	override insertChild(XTPackage parent, XTClass child) {
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
	
	override insertChild(XTComponent parent, XTClass child) {
		parent.ownedClasses += child
	}

}