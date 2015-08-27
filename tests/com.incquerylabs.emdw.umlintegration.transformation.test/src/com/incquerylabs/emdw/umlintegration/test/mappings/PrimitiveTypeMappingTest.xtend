package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.uml2.uml.Model

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

class PrimitiveTypeMappingTest extends TransformationTest<org.eclipse.uml2.uml.PrimitiveType, PrimitiveType> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		createPrimitiveType(umlPackage)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(PrimitiveType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.PrimitiveType umlObject, PrimitiveType xtumlrtObject) {
	}
	
}