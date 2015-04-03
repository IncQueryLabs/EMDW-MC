package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTClassEventMappingTest extends TransformationTest<Signal, XTClassEvent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createSignalForClassEvent(umlRoot)
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.topEntities.head as XTClass).events.filter(XTClassEvent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTClassEvent xtumlrtObject) {
	}

}