package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration
import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class EnumerationLiteralMappingTest extends TransformationTest<org.eclipse.uml2.uml.EnumerationLiteral, EnumerationLiteral> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(org.eclipse.uml2.uml.Model umlModel) {
		val umlPackage = createPackageInModel(umlModel)
		val enumeration = createEnumeration(umlPackage) => [
			name = "enumeration"
		]
		val enumerationLiteral = createEnumerationLiteral(enumeration) => [
			name = "enum_literal"
		]
		
		return enumerationLiteral
	}
	
	override protected getXtumlrtObjects(Model xtModel) {
		val enumeration = xtModel.packages.head.typeDefinitions.head.type as Enumeration
		enumeration.literals
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.EnumerationLiteral umlEnumerationLiteral, EnumerationLiteral xtEnumerationLiteral) {
		assertNotNull("TypeDefinition is not created correctly", xtEnumerationLiteral)
		assertEquals("Enumeration name is incorrect", umlEnumerationLiteral.name, xtEnumerationLiteral.name)
	}
	
}