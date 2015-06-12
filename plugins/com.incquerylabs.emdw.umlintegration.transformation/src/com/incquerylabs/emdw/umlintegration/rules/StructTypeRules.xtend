package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StructTypeMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.DataType

class StructTypeRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StructTypeMapping(engine)
		}
	}
}

/**
 * Transforms DataTypes with at least one member which are a Package's packaged elements to the Model's local scope temporary types
 */
class StructTypeMapping extends AbstractObjectMapping<StructTypeMatch, DataType, StructuredType> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StructuredType
	}
	
	public static val PRIORITY = 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		structType
	}

	override getUmlObject(StructTypeMatch match) {
		match.structType
	}

	override createXtumlrtObject() {
		commonFactory.createStructuredType
	}

	override updateXtumlrtObject(StructuredType xtumlrtObject, StructTypeMatch match) {
	}

	override protected insertXtumlrtObject(StructuredType xtumlrtObject, StructTypeMatch match) {
		rootMapping.xtumlrtRoot.eResource.contents += xtumlrtObject
	}
	
}