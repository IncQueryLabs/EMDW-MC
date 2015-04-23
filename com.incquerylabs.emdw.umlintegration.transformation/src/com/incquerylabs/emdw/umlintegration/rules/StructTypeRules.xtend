package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StructTypeMatch
import org.eclipse.papyrusrt.xtumlrt.common.StructType
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
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
class StructTypeMapping extends AbstractObjectMapping<StructTypeMatch, DataType, StructType> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StructType
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
		commonFactory.createStructType
	}

	override updateXtumlrtObject(StructType xtumlrtObject, StructTypeMatch match) {
	}

	override protected insertXtumlrtObject(StructType xtumlrtObject, StructTypeMatch match) {
		rootMapping.xtumlrtRoot.localScopeTemporaryTypes += xtumlrtObject
	}
	
}