package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.AttributeMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import com.zeligsoft.xtumlrt.common.Attribute
import com.zeligsoft.xtumlrt.common.Type
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property
import com.zeligsoft.xtumlrt.common.Entity

class AttributeRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new AttributeMapping(engine).specification
		}
	}
}

class AttributeMapping extends AbstractObjectRule<AttributeMatch, Property, Attribute> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Attribute
	}
	
	public static val PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		attribute
	}

	override getUmlObject(AttributeMatch match) {
		match.property
	}

	override createXtumlrtObject(Property umlObject, AttributeMatch match) {
		commonFactory.createAttribute
	}

	override updateXtumlrtObject(Attribute xtumlrtObject, AttributeMatch match) {
		val umlObject = match.umlObject
		switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).head {
			Type: xtumlrtObject.type = type
		}
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
	}
	
	def getXtumlrtContainer(AttributeMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.umlClass).head as Entity
	}

	override protected insertXtumlrtObject(Attribute xtumlrtObject, AttributeMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}

}
