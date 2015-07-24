package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.AttributeMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Entity
import org.eclipse.papyrusrt.xtumlrt.common.Type
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.umlintegration.queries.SignalAttributeMatch
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class AttributeRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ClassAttributeMapping(engine),
			new SignalAttributeMapping(engine)
		}
	}
}

/**
 * Transforms Properties which are a Class's owned attributes to the transformed XTClass's attributes.
 */
class ClassAttributeMapping extends AbstractObjectMapping<AttributeMatch, Property, Attribute> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Attribute
	}
	
	public static val int PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 1

	override int getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		attribute
	}

	override getUmlObject(AttributeMatch match) {
		match.property
	}

	override createXtumlrtObject() {
		commonFactory.createAttribute
	}

	override updateXtumlrtObject(Attribute xtumlrtObject, AttributeMatch match) {
		val umlObject = match.umlObject
		if(umlObject.type != null){
			switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).filter(Type).head {
				Type: xtumlrtObject.type = type
			}
		}
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
		
		xtumlrtObject.lowerBound = match.property.lower
		xtumlrtObject.upperBound = match.property.upper
		xtumlrtObject.ordered = match.property.isOrdered
		xtumlrtObject.unique = match.property.isUnique
		
	}
	
	def getXtumlrtContainer(AttributeMatch match) {
		match.umlClass.findXtumlrtObject(Entity)
	}

	override protected insertXtumlrtObject(Attribute xtumlrtObject, AttributeMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}

}

/**
 * Transforms Properties which are a Signal's owned attributes to the transformed XTClassEvent's attributes.
 */
class SignalAttributeMapping extends AbstractObjectMapping<SignalAttributeMatch, Property, Attribute> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Attribute
	}
	
	public static val PRIORITY = CommonPriorities.EVENT_MAPPING_PRIORITY + 1
	
	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		signalAttribute
	}

	override getUmlObject(SignalAttributeMatch match) {
		match.property
	}

	override createXtumlrtObject() {
		commonFactory.createAttribute
	}

	override updateXtumlrtObject(Attribute xtumlrtObject, SignalAttributeMatch match) {
		val umlObject = match.umlObject
		if(umlObject.type != null){
			switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).head {
				Type: xtumlrtObject.type = type
			}
		}
		xtumlrtObject.static = umlObject.static
		xtumlrtObject.visibility = TransformationUtil.transform(umlObject.visibility)
		
		xtumlrtObject.lowerBound = match.property.lower
		xtumlrtObject.upperBound = match.property.upper
		xtumlrtObject.ordered = match.property.isOrdered
		xtumlrtObject.unique = match.property.isUnique
		
	}
	
	def getXtumlrtContainer(SignalAttributeMatch match) {
		match.umlSignal.findXtumlrtObject(XTClassEvent)
	}

	override protected insertXtumlrtObject(Attribute xtumlrtObject, SignalAttributeMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}
}
