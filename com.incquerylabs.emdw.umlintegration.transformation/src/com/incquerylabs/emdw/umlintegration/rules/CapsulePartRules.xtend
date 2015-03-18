package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.CapsulePartMatch
import com.zeligsoft.xtumlrt.common.CapsulePart
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property

class CapsulePartRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new CapsulePartMapping(engine).specification
		}
	}
}

class CapsulePartMapping extends AbstractObjectRule<CapsulePartMatch, Property, CapsulePart> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		CapsulePart
	}
	
	public static val PRIORITY = XTComponentMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		capsulePart
	}

	override getUmlObject(CapsulePartMatch match) {
		match.property
	}

	override createXtumlrtObject(Property umlObject, CapsulePartMatch match) {
		commonFactory.createCapsulePart
	}

	override updateXtumlrtObject(CapsulePart xtumlrtObject, CapsulePartMatch match) {
	}

	def getXtumlrtContainer(CapsulePartMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.component).head as XTComponent
	}

	override insertXtumlrtObject(CapsulePart xtumlrtObject, CapsulePartMatch match) {
		match.xtumlrtContainer.parts += xtumlrtObject
	}
	
}
