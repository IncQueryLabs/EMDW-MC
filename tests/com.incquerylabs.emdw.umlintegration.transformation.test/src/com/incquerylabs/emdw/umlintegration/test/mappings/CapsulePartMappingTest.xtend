package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.CapsulePart
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	CapsulePartMappingTest
])
@RunWith(Suite)
class CapsulePartMappingTestSuite {}

class CapsulePartMappingTest extends TransformationTest<Property, CapsulePart> {

	override protected createUmlObject(Model umlRoot) {
		val component = umlRoot.createComponentInModel
		component.createPropertyForPart
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).parts
	}

	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, CapsulePart xtumlrtObject) {
	}

}
