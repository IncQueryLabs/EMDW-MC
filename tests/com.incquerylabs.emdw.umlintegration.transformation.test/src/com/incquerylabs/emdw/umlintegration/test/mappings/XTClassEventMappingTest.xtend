package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class XTClassEventMappingTest extends TransformationTest<Signal, XTClassEvent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val signal = createClassAndSignal(umlRoot)
		createSignalEvent(umlRoot, signal)
		signal
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTClass).events.filter(XTClassEvent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTClassEvent xtumlrtObject) {
	}

}

@RunWith(Parameterized)
class XTClassEventGeneralizationMappingTest extends TransformationTest<Signal, XTClassEvent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val superSignal = createClassAndSignal(umlRoot) => [name = "superSignal"]
		createSignalEvent(umlRoot, superSignal)
		val signal = createClassAndSignal(umlRoot) => [name = "signal"]
		createSignalEvent(umlRoot, signal)
		createGeneralization(signal, superSignal)
		
		signal
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).map[events].flatten.filter(XTClassEvent).filter[name == "signal"]
	}

	override protected checkXtumlrtObject(RootMapping mapping, Signal umlObject, XTClassEvent xtClassEvent) {
		val superEvents = mapping.xtumlrtRoot.entities.filter(XTClass).map[events].flatten.filter(XTClassEvent).filter[name == "superSignal"]
		assertArrayEquals(superEvents, xtClassEvent.definingEvents)
	}

}
