package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.UMLFactory
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class TriggerMappingTest extends TransformationTest<Trigger, com.zeligsoft.xtumlrt.common.Trigger> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val transition = createTransition(mapping)
		val trigger = UMLFactory.eINSTANCE.createTrigger
		transition.triggers += trigger
		trigger
	}

	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtTopState.transitions.head.triggers
	}
	
	override protected checkState(RootMapping mapping, Trigger umlObject, com.zeligsoft.xtumlrt.common.Trigger xtumlrtObject) {
	}

}