package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Generalization
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	XTGeneralizationMappingTest
])
@RunWith(Suite)
class XTGeneralizationMappingTestSuite {}

class XTGeneralizationMappingTest extends TransformationTest<Generalization, org.eclipse.papyrusrt.xtumlrt.common.Generalization> {
	
	protected static val superClassName = "superClass"

	protected static val subClassName = "subClass"

	override protected createUmlObject(org.eclipse.uml2.uml.Model umlRoot) {
		var superClass = umlRoot.createClassInModel => [
			name = superClassName
		]
		var subClass = umlRoot.createClassInModel => [
			name = subClassName
		]
		createGeneralization(subClass, superClass)
	}

	override protected getXtumlrtObjects(Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).findFirst[name == subClassName].generalizations
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Generalization umlObject, org.eclipse.papyrusrt.xtumlrt.common.Generalization xtumlrtObject) {
		assertEquals(findClass(mapping, superClassName), xtumlrtObject.^super)
		assertEquals(findClass(mapping, subClassName), xtumlrtObject.sub)
	}
	
}