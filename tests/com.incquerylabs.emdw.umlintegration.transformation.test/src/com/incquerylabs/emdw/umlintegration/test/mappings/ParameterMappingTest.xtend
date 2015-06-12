package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class ParameterInOperationMappingTest extends TransformationTest<org.eclipse.uml2.uml.Parameter, Parameter> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val type = umlRoot.createComponentInModel
		val parameter = UMLFactory.eINSTANCE.createParameter => [
			it.type = type 
			direction = ParameterDirectionKind.IN_LITERAL
		]
		umlRoot.createOperation(TEST_SIDE_EFFECT_1, type).ownedParameters += parameter
		parameter
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations.head.parameters
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Parameter umlObject, Parameter xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(TransformationUtil.transform(umlObject.direction), xtumlrtObject.direction)
		
		assertEquals("Parameter's (default) lower bound is not set correctly", 1, xtumlrtObject.lowerBound)
		assertEquals("Parameter's (default) upper bound is not set correctly", 1, xtumlrtObject.upperBound)
	}

}

@RunWith(Parameterized)
class ParameterInOperationWithModifiedMultiplicityMappingTest extends TransformationTest<org.eclipse.uml2.uml.Parameter, Parameter> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val type = umlRoot.createComponentInModel
		val parameter = UMLFactory.eINSTANCE.createParameter => [
			it.type = type 
			direction = ParameterDirectionKind.IN_LITERAL
		]
		umlRoot.createOperation(TEST_SIDE_EFFECT_1, type).ownedParameters += parameter
		parameter.setMultiplicity(0,-1)
		
		parameter
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).head.operations.head.parameters
	}

	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.Parameter umlObject, Parameter xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.entities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(TransformationUtil.transform(umlObject.direction), xtumlrtObject.direction)
		
		assertEquals("Parameter's (default) lower bound is not set correctly", 0, xtumlrtObject.lowerBound)
		assertEquals("Parameter's (default) upper bound is not set correctly", -1, xtumlrtObject.upperBound)
	}

}
