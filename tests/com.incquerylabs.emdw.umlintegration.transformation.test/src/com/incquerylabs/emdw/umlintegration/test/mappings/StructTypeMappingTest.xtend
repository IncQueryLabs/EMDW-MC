package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.DataType
import org.eclipse.uml2.uml.Model

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

class StructTypeMappingTest extends TransformationTest<DataType, StructuredType> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		umlPackage.createStructType
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(StructuredType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, DataType umlObject, StructuredType xtumlrtObject) {
	}
	
}