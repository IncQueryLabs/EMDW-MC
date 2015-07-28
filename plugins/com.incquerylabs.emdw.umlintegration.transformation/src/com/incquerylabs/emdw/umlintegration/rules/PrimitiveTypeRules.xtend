package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.PrimitiveTypeMatch
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition

class PrimitiveTypeRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new PrimitiveTypeMapping(engine)
		}
	}
}

/**
 * Transforms PrimitiveTypes which are a Package's packaged elements to the Model's local scope temporary types.
 */
class PrimitiveTypeMapping extends AbstractObjectMapping<PrimitiveTypeMatch, org.eclipse.uml2.uml.PrimitiveType, PrimitiveType> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		PrimitiveType
	}
	
	public static val PRIORITY = Math.max(TypeDefinitionInComponentMapping.PRIORITY, TypeDefinitionInPackageMapping.PRIORITY) + 1

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
	
	def getXtumlContainer(PrimitiveTypeMatch match) {
		match.primitiveType.findXtumlrtObject(TypeDefinition)
	}

	override protected insertXtumlrtObject(PrimitiveType xtumlrtObject, PrimitiveTypeMatch match) {
		match.xtumlContainer.type = xtumlrtObject
	}
	
}
