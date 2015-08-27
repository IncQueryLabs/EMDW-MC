package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Type

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

class TypeDefinitionMappingTest extends TransformationTest<Type, TypeDefinition> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		umlPackage.createPrimitiveType
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Type umlObject, TypeDefinition xtumlrtObject) {
		assertNotNull(xtumlrtObject.type)
	}
	
}