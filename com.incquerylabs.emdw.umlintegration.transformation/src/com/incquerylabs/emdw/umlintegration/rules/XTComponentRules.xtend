package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.XtComponentInModelMatch
import com.incquerylabs.emdw.umlintegration.queries.XtComponentInPackageMatch
import com.incquerylabs.emdw.umlintegration.queries.XtComponentMatch
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Class

class XTComponentRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new XTComponentMapping(engine),
			new XTComponentInModelMapping(engine),
			new XTComponentInPackageMapping(engine)
		}
	}
}

/**
 * Transform Components into XTComponents.
 */
class XTComponentMapping extends AbstractObjectMapping<XtComponentMatch, Class, XTComponent> {

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

	override createXtumlrtObject() {
		xtumlFactory.createXTComponent
	}

	override updateXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
	}

	override protected insertXtumlrtObject(XTComponent xtumlrtObject, XtComponentMatch match) {
	}
	
}

/**
 * Inserts XTComponents in their parent Model.
 */
class XTComponentInModelMapping extends AbstractContainmentMapping<XtComponentInModelMatch, Model, XTComponent> {

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
		match.component.findXtumlrtObject(XTComponent)
	}
	
	override insertChild(Model parent, XTComponent child) {
		parent.topEntities += child
	}

}

/**
 * Inserts XTComponents in their parent XTPackage.
 */
class XTComponentInPackageMapping extends AbstractContainmentMapping<XtComponentInPackageMatch, XTPackage, XTComponent> {

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
		match.umlPackage.findXtumlrtObject(XTPackage)
	}
	
	override findChild(XtComponentInPackageMatch match) {
		match.component.findXtumlrtObject(XTComponent)
	}
	
	override insertChild(XTPackage parent, XTComponent child) {
		parent.entities += child
	}

}