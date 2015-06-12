package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class PrimitiveTypeMappingTest extends TransformationTest<org.eclipse.uml2.uml.PrimitiveType, PrimitiveType> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = createPackageInModel(umlRoot)
		createPrimitiveType(umlPackage)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(PrimitiveType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.PrimitiveType umlObject, PrimitiveType xtumlrtObject) {
	}
	
}