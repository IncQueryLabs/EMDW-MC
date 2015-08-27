package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.EnumerationMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition

class EnumerationRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new EnumerationMapping(engine)
		}
	}
}

/**
 * Transforms Enumerations which are a Package's or a Component's packaged elements to Enumerations in the xtUML model
 */
class EnumerationMapping extends AbstractObjectMapping<EnumerationMatch, org.eclipse.uml2.uml.Enumeration, Enumeration> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Enumeration
	}
	
	public static val PRIORITY = TypeDefinitionMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		enumeration
	}

	override getUmlObject(EnumerationMatch match) {
		match.enumeration
	}

	override createXtumlrtObject() {
		commonFactory.createEnumeration
	}

	override updateXtumlrtObject(Enumeration xtEnumeration, EnumerationMatch match) {
	}
	
	def getXtumlContainer(EnumerationMatch match) {
		match.enumeration.findXtumlrtObject(TypeDefinition)
	}

	override protected void insertXtumlrtObject(Enumeration xtumlrtObject, EnumerationMatch match) {
		match.xtumlContainer.type = xtumlrtObject
	}
}