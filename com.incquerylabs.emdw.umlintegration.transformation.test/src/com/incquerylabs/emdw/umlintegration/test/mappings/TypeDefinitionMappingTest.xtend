package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.TypeDefinition
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Type
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class TypeDefinitionMappingTest extends TransformationTest<Type, TypeDefinition> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = createPackageInModel(umlRoot)
		createPrimitiveType(umlPackage)
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.rootPackages.head.typedefinitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Type umlObject, TypeDefinition xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.localScopeTemporaryTypes.head, xtumlrtObject.type)
	}
	
}