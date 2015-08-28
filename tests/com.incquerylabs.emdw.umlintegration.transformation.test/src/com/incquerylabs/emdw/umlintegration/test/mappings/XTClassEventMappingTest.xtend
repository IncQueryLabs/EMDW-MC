package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.testing.common.utils.UmlUtil.*

@SuiteClasses(#[
	XTClassEventMappingTest,
	XTClassEventGeneralizationMappingTest
])
@RunWith(Suite)
class XTClassEventMappingTestSuite {}

class XTClassEventMappingTest extends TransformationTest<Signal, XTClassEvent> {

	override protected createUmlObject(Model umlRoot) {
		val signal = umlRoot.createClassAndSignal
		umlRoot.createSignalEvent(signal)
		signal
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTClass).events.filter(XTClassEvent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTClassEvent xtumlrtObject) {
	}

}

class XTClassEventGeneralizationMappingTest extends TransformationTest<Signal, XTClassEvent> {

	override protected createUmlObject(Model umlRoot) {
		val superSignal = umlRoot.createClassAndSignal => [
			name = "superSignal"
		]
		umlRoot.createSignalEvent(superSignal)
		val signal = umlRoot.createClassAndSignal => [
			name = "signal"
		]
		umlRoot.createSignalEvent(signal)
		createGeneralization(signal, superSignal)
		
		signal
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).map[events].flatten.filter(XTClassEvent).filter[name == "signal"]
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTClassEvent xtClassEvent) {
		val superEvents = mapping.xtumlrtRoot.entities.filter(XTClass).map[events].flatten.filter(XTClassEvent).filter[name == "superSignal"]
		assertEquals(superEvents.head, xtClassEvent.redefines)
	}

}
