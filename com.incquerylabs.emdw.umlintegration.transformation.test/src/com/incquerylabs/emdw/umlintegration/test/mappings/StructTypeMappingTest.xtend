package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.StructType
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import org.eclipse.uml2.uml.DataType

@RunWith(Parameterized)
class StructTypeMappingTest extends TransformationTest<DataType, StructType> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = createPackageInModel(umlRoot)
		createStructType(umlPackage)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.localScopeTemporaryTypes.filter(StructType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, DataType umlObject, StructType xtumlrtObject) {
	}
	
}