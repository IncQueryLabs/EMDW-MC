package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.common.Model
import com.zeligsoft.xtumlrt.xtuml.XTAssociation
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class XTAssociationMappingTest extends TransformationTest<Property, XTAssociation> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	protected static val sourceClassName = "sourceClass"

	protected static val targetClassName = "targetClass"

	override protected createUmlObject(org.eclipse.uml2.uml.Model umlRoot) {
		var sourceClass = createClassInModel(umlRoot) => [
			name = sourceClassName
		]
		var targetClass = createClassInModel(umlRoot) => [
			name = targetClassName
		]
		createAssociation(createComponentInModel(umlRoot), sourceClass, targetClass).memberEnds.head
	}

	override protected getXtumlrtObjects(Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.filter(XTClass).findFirst[name == sourceClassName].relations.filter(XTAssociation)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, XTAssociation xtumlrtObject) {
		assertEquals(findClass(mapping, sourceClassName), xtumlrtObject.source)
		val targetClass = findClass(mapping, targetClassName)
		assertEquals(targetClass, xtumlrtObject.target)
		val opposite = targetClass.relations.filter(XTAssociation).head
		assertEquals(opposite, xtumlrtObject.opposite)
		assertEquals(xtumlrtObject, opposite.opposite)
	}
	
}