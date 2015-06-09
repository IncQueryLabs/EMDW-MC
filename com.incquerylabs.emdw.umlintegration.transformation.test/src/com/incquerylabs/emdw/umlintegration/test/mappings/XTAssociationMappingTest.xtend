package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class XTAssociationMappingTest extends TransformationTest<Property, XTAssociation> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	protected static val sourceClassName = "sourceClass"

	protected static val targetClassName = "targetClass"

	override protected createUmlObject(org.eclipse.uml2.uml.Model umlRoot) {
		val sourceClass = umlRoot.createClassInModel => [
			name = sourceClassName
		]
		val targetClass = umlRoot.createClassInModel => [
			name = targetClassName
		]
		val model = umlRoot.createComponentInModel
		val association = model.createAssociation(sourceClass, targetClass)
		
		val associationSourceEnd = association.memberEnds.filter[it.type == sourceClass].head
		val associationTargetEnd = association.memberEnds.filter[it.type == targetClass].head
		associationSourceEnd.setMultiplicity(0, -1)
		
		associationTargetEnd
	}

	override protected getXtumlrtObjects(Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass).findFirst[name == sourceClassName].relations.filter(XTAssociation)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Property umlAssociationSourceEnd, XTAssociation xtAssociation) {
		// Assert transformation of association
		assertEquals("Association's source is not set correctly", mapping.findClass(sourceClassName), xtAssociation.source)
		val targetXtClass = mapping.findClass(targetClassName)
		assertEquals("Association's target is not set correctly", targetXtClass, xtAssociation.target)

		// Assert opposites
		val oppositeXtAssociation = targetXtClass.relations.filter(XTAssociation).head
		assertEquals("Association's opposite is not set correctly", oppositeXtAssociation, xtAssociation.opposite)
		assertEquals("Association's opposite is not set correctly", xtAssociation, oppositeXtAssociation.opposite)

		// Assert multiplicity
		assertEquals("Association's (default) lower bound is not set correctly", 1, xtAssociation.lowerBound)
		assertEquals("Association's (default) upper bound is not set correctly", 1, xtAssociation.upperBound)
		assertEquals("The opposite association's (modified) lower bound is not set correctly", 0, oppositeXtAssociation.lowerBound)
		assertEquals("The opposite association's (modified) upper bound is not set correctly", -1, oppositeXtAssociation.upperBound)
	}
	
}