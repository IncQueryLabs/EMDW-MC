package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.CapsulePart
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class CapsulePartMappingTest extends TransformationTest<Property, CapsulePart> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		createProperty(mapping)
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtRoot.topEntities.head as XTComponent).parts
	}

	override protected checkState(RootMapping mapping, Property umlObject, CapsulePart xtumlrtObject) {
	}

}
