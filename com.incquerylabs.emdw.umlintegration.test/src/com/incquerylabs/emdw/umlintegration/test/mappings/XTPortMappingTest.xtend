package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import com.zeligsoft.xtumlrt.xtuml.XTPort
import org.eclipse.uml2.uml.Port
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class XTPortMappingTest extends TransformationTest<Port, XTPort> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		createPort(mapping)
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtRoot.topEntities.head as XTComponent).ports.filter(XTPort)
	}

	override protected checkState(RootMapping mapping, Port umlObject, XTPort xtumlrtObject) {
		assertEquals(umlObject.conjugated, xtumlrtObject.conjugate) 
	}

}
