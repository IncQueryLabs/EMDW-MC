package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StructMemberMatch
import com.zeligsoft.xtumlrt.common.StructMember
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property
import com.zeligsoft.xtumlrt.common.StructType

class StructMemberRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new StructMemberMapping(engine).specification
		}
	}
}

class StructMemberMapping extends AbstractObjectRule<StructMemberMatch, Property, StructMember> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		StructMember
	}
	
	public static val PRIORITY = TypeDefinitionMapping.PRIORITY

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		structMember
	}

	override getUmlObject(StructMemberMatch match) {
		match.member
	}

	override createXtumlrtObject() {
		commonFactory.createStructMember
	}

	override updateXtumlrtObject(StructMember xtumlrtObject, StructMemberMatch match) {
		xtumlrtObject.type = engine.trace.getAllValuesOfxtumlrtElement(null, null, match.member.type).filter(StructType).head
	}

	def getXtumlrtContainer(StructMemberMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.structType).filter(StructType).head
	}
	
	override protected insertXtumlrtObject(StructMember xtumlrtObject, StructMemberMatch match) {
		match.xtumlrtContainer.structMembers += xtumlrtObject
	}
	
}