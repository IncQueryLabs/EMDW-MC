/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.AttributeMatch
import com.incquerylabs.emdw.umlintegration.queries.SignalAttributeMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Entity
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Property
import org.eclipse.papyrusrt.xtumlrt.common.Type

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
	
	public static val int PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 2

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

	override updateXtumlrtObject(Attribute xtAttribute, AttributeMatch match) {
		val umlProperty = match.umlObject
		val xtType = engine.trace.getAllValuesOfxtumlrtElement(null, null, umlProperty.type).filter(Type).head
		TransformationUtil.updateAttribute(umlProperty, xtAttribute, xtType)
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

	override updateXtumlrtObject(Attribute xtAttribute, SignalAttributeMatch match) {
		val umlProperty = match.umlObject
		val xtType = engine.trace.getAllValuesOfxtumlrtElement(null, null, umlProperty.type).filter(Type).head
		TransformationUtil.updateAttribute(umlProperty, xtAttribute, xtType)
	}
	
	def getXtumlrtContainer(SignalAttributeMatch match) {
		match.umlSignal.findXtumlrtObject(XTClassEvent)
	}

	override protected insertXtumlrtObject(Attribute xtumlrtObject, SignalAttributeMatch match) {
		match.xtumlrtContainer.attributes += xtumlrtObject
	}
}
