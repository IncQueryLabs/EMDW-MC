package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.TypeDefinitionMatch
import com.zeligsoft.xtumlrt.common.TypeDefinition
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Type
import com.zeligsoft.xtumlrt.xtuml.XTPackage

class TypeDefinitionRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new TypeDefinitionMapping(engine).specification
		}
	}
}

class TypeDefinitionMapping extends AbstractObjectRule<TypeDefinitionMatch, Type, TypeDefinition> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		TypeDefinition
	}

	public static val PRIORITY = Math.max(PrimitiveTypeMapping.PRIORITY, StructTypeMapping.PRIORITY) + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		typeDefinition
	}

	override getUmlObject(TypeDefinitionMatch match) {
		match.type
	}

	override createXtumlrtObject() {
		commonFactory.createTypeDefinition
	}

	override updateXtumlrtObject(TypeDefinition xtumlrtObject, TypeDefinitionMatch match) {
		xtumlrtObject.type = match.type.findXtumlrtObject(com.zeligsoft.xtumlrt.common.Type) // There might be > 1 traces
	}

	def getXtumlrtContainer(TypeDefinitionMatch match) {
		match.umlPackage.findXtumlrtObject(XTPackage)
	}

	override protected insertXtumlrtObject(TypeDefinition xtumlrtObject, TypeDefinitionMatch match) {
		match.xtumlrtContainer.typedefinitions += xtumlrtObject
	}

}
