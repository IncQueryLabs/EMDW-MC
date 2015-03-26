package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.PrimitiveType
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

@RunWith(Parameterized)
class PrimitiveTypeMappingTest extends TransformationTest<org.eclipse.uml2.uml.PrimitiveType, PrimitiveType> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val primitiveType = UMLFactory.eINSTANCE.createPrimitiveType
		umlRoot.packagedElements += primitiveType
		primitiveType
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.localScopeTemporaryTypes.filter(PrimitiveType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.PrimitiveType umlObject, PrimitiveType xtumlrtObject) {
	}
	
}