package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTSignalEvent
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class XTSignalEventMappingTest extends TransformationTest<Signal, XTSignalEvent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createSignalForSignalEvent(umlRoot, createTrigger(umlRoot))
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.topEntities.head as XTClass).events.filter(XTSignalEvent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTSignalEvent xtumlrtObject) {
	}

}
