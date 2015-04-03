package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.PrimitiveTypeMatch
import com.zeligsoft.xtumlrt.common.PrimitiveType
import org.eclipse.incquery.runtime.api.IncQueryEngine

class PrimitiveTypeRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new PrimitiveTypeMapping(engine).specification
		}
	}
}

class PrimitiveTypeMapping extends AbstractObjectRule<PrimitiveTypeMatch, org.eclipse.uml2.uml.PrimitiveType, PrimitiveType> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		PrimitiveType
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		primitiveType
	}

	override getUmlObject(PrimitiveTypeMatch match) {
		match.primitiveType
	}

	override createXtumlrtObject() {
		commonFactory.createPrimitiveType
	}

	override updateXtumlrtObject(PrimitiveType xtumlrtObject, PrimitiveTypeMatch match) {
	}

	override protected insertXtumlrtObject(PrimitiveType xtumlrtObject, PrimitiveTypeMatch match) {
		rootMapping.xtumlrtRoot.localScopeTemporaryTypes += xtumlrtObject
	}
	
}