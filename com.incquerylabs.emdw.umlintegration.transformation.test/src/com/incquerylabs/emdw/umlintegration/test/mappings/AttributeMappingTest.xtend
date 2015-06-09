package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class AttributeMappingTest extends TransformationTest<Property, Attribute> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

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

@RunWith(Parameterized)
class AttributeWithModifiedMultiplicityMappingTest extends TransformationTest<Property, Attribute> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

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
