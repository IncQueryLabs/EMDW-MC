package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.uml2.uml.Enumeration
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class EnumerationMappingTest extends TransformationTest<Enumeration, TypeDefinition> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(org.eclipse.uml2.uml.Model umlModel) {
		val umlPackage = createPackageInModel(umlModel)
		val enumeration = createEnumeration(umlPackage) => [
			name = "enumeration"
		]
		
		return enumeration
	}
	
	override protected getXtumlrtObjects(Model xtModel) {
		xtModel.packages.head.typeDefinitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Enumeration umlObject, TypeDefinition typeDefinition) {
		assertNotNull("TypeDefinition is not created correctly", typeDefinition)
		assertNotNull("Enumeration is not created correctly", typeDefinition.type)
		val xtEnumeration = typeDefinition.type
		assertTrue("Enumeration is not created correctly", xtEnumeration instanceof org.eclipse.papyrusrt.xtumlrt.common.Enumeration)
		assertEquals("Enumeration name is incorrect", umlObject.name, xtEnumeration.name)
	}
	
}