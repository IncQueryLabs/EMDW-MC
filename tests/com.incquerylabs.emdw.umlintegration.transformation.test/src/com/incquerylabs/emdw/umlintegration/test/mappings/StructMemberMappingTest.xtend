package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

class StructMemberMappingTest extends TransformationTest<Property, Attribute> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		umlPackage.createStructType.ownedAttributes.head
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(StructuredType).head.attributes
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(getTypeOfStructMember(mapping), xtumlrtObject.type)
	}
	
	protected def getTypeOfStructMember(RootMapping mapping) {
		mapping.xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(PrimitiveType).head
	}
}
