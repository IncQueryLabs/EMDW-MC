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
package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	AttributeMappingTest,
	SignalAttributeMappingTest,
	AttributeWithModifiedMultiplicityMappingTest
])
@RunWith(Suite)
class AttributeMappingTestSuite {}

class AttributeMappingTest extends TransformationTest<Property, Attribute> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createPropertyForAttribute(umlRoot.createComponentInModel)
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.attributes
	}

	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(TransformationUtil.transform(umlObject.visibility), xtumlrtObject.visibility)
		assertEquals("Attribute's (default) lower bound is not set correctly", 1, xtumlrtObject.lowerBound)
		assertEquals("Attribute's (default) upper bound is not set correctly", 1, xtumlrtObject.upperBound)
	}

}

class SignalAttributeMappingTest extends TransformationTest<Property, Attribute> {

	override protected createUmlObject(Model umlRoot) {
		val comp = umlRoot.createComponentInModel
		val signal = createClassAndSignal(umlRoot)
		createSignalEvent(umlRoot, signal)
		val property = createPropertyForSignal(signal) => [
			type = comp
		]
		property
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.events.filter(XTClassEvent).head.attributes
	}

	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals("Attribute's (default) lower bound is not set correctly", 1, xtumlrtObject.lowerBound)
		assertEquals("Attribute's (default) upper bound is not set correctly", 1, xtumlrtObject.upperBound)
	}

}

class AttributeWithModifiedMultiplicityMappingTest extends TransformationTest<Property, Attribute> {

	override protected createUmlObject(Model umlRoot) {
		val attribute = umlRoot.createPropertyForAttribute(umlRoot.createComponentInModel)
		attribute.setMultiplicity(0,-1)
		
		attribute
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.attributes
	}

	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(TransformationUtil.transform(umlObject.visibility), xtumlrtObject.visibility)
		assertEquals("Attribute's (modified) lower bound is not set correctly", 0, xtumlrtObject.lowerBound)
		assertEquals("Attribute's (modified) upper bound is not set correctly", -1, xtumlrtObject.upperBound)
	}

}
