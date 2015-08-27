package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.TypedMultiplicityElement
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

@SuiteClasses(#[
	SingleReturnTypeMappingTest,
	CollectionReturnTypeMappingTest
])
@RunWith(Suite)
class ReturnTypeMappingTestSuite {}

class SingleReturnTypeMappingTest extends TransformationTest<Parameter, TypedMultiplicityElement> {
	
	override protected createUmlObject(Model umlModel) {
		val umlClassType = umlModel.createClassInModel => [it.name = "classType"]
		
		val umlOperation = umlModel.createOperation("// Operation body", umlClassType);
		val umlReturnValue = umlOperation.ownedParameters.filter[it.direction == ParameterDirectionKind.RETURN_LITERAL].head
		umlReturnValue.lower = 1
		umlReturnValue.upper = 1
		
		return umlReturnValue
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlModel) {
		val xtClass = xtumlModel.entities.filter(XTClass).filter[name == "class"].head
		xtClass.operations.map[returnType]
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Parameter umlReturnType, TypedMultiplicityElement xtReturnType) {
		val xtClassType = mapping.xtumlrtRoot.entities.filter(XTClass).filter[name == "classType"].head
		assertEquals("Operation return type is incorrect", xtClassType, xtReturnType.type)
		assertEquals("Operation return type multiplicity is incorrect", 1, xtReturnType.lowerBound)
		assertEquals("Operation return type multiplicity is incorrect", 1, xtReturnType.upperBound)
	}
}

class CollectionReturnTypeMappingTest extends TransformationTest<Parameter, TypedMultiplicityElement> {
	
	override protected createUmlObject(Model umlModel) {
		val umlClassType = umlModel.createClassInModel => [it.name = "classType"]
		
		val umlOperation = umlModel.createOperation("// Operation body", umlClassType);
		val umlReturnValue = umlOperation.ownedParameters.filter[it.direction == ParameterDirectionKind.RETURN_LITERAL].head
		umlReturnValue.lower = 0
		umlReturnValue.upper = -1
		
		return umlReturnValue
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlModel) {
		val xtClass = xtumlModel.entities.filter(XTClass).filter[name == "class"].head
		xtClass.operations.map[returnType]
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Parameter umlReturnType, TypedMultiplicityElement xtReturnType) {
		val xtClassType = mapping.xtumlrtRoot.entities.filter(XTClass).filter[name == "classType"].head
		assertEquals("Operation return type is incorrect", xtClassType, xtReturnType.type)
		assertEquals("Operation return type multiplicity is incorrect", 0, xtReturnType.lowerBound)
		assertEquals("Operation return type multiplicity is incorrect", -1, xtReturnType.upperBound)
	}
}