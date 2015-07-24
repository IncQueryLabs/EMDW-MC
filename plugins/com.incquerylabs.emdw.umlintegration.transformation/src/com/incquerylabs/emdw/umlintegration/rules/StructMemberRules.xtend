package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.StructMemberMatch
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil

class StructMemberRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new StructMemberMapping(engine)
		}
	}
}

/**
 * Transforms Properties which are a DataType owned attribute to the transformed StructType's struct members.
 */
class StructMemberMapping extends AbstractObjectMapping<StructMemberMatch, Property, Attribute> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Attribute
	}
	
	public static val PRIORITY = StructTypeMapping.PRIORITY + 1

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
		commonFactory.createAttribute
	}

	override updateXtumlrtObject(Attribute xtumlrtObject, StructMemberMatch match) {
		val umlObject = match.umlObject
		if(umlObject.type != null){
			switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).filter(Type).head {
				Type: xtumlrtObject.type = type
			}
		}
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
		
		xtumlrtObject.lowerBound = umlObject.lower
		xtumlrtObject.upperBound = umlObject.upper
		xtumlrtObject.ordered = umlObject.isOrdered
		xtumlrtObject.unique = umlObject.isUnique
	}

	def getXtumlrtContainer(StructMemberMatch match) {
		match.structType.findXtumlrtObject(StructuredType)
	}
	
	override protected insertXtumlrtObject(Attribute xtumlrtObject, StructMemberMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}
	
}
