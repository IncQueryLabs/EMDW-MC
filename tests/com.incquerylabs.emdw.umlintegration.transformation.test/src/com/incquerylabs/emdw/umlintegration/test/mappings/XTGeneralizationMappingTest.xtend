package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTGeneralization
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Generalization
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class XTGeneralizationMappingTest extends TransformationTest<Generalization, XTGeneralization> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	protected static val superClassName = "superClass"

	protected static val subClassName = "subClass"

	override protected createUmlObject(org.eclipse.uml2.uml.Model umlRoot) {
		var superClass = createClassInModel(umlRoot) => [
			name = superClassName
		]
		var subClass = createClassInModel(umlRoot) => [
			name = subClassName
		]
		createGeneralization(subClass, superClass)
	}

	override protected getXtumlrtObjects(Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).findFirst[name == subClassName].relations.filter(XTGeneralization)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Generalization umlObject, XTGeneralization xtumlrtObject) {
		assertEquals(findClass(mapping, superClassName), xtumlrtObject.^super)
		assertEquals(findClass(mapping, subClassName), xtumlrtObject.sub)
	}
	
}