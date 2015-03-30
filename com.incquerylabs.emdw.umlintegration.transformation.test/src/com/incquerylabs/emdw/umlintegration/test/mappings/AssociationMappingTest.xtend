package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTAssociation
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class AssociationMappingTest extends TransformationTest<Association, XTAssociation> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createAssociation(createComponentInModel(umlRoot), createClassInModel(umlRoot), createClassInModel(umlRoot))
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.filter(XTComponent).head.relations.filter(XTAssociation)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Association umlObject, XTAssociation xtumlrtObject) {
		val source = getEnd(mapping, umlObject, 0)
		val target = getEnd(mapping, umlObject, 1)
		assertEquals("Associaton source class", source, xtumlrtObject.source)
		assertEquals("Associaton target class", target, xtumlrtObject.target)
	}
	
	protected def getEnd(RootMapping mapping, Association umlObject, int index) {
		mapping.traces.findFirst[umlElements.contains(umlObject.ownedEnds.get(index).type)].xtumlrtElements.head
	}
	
}