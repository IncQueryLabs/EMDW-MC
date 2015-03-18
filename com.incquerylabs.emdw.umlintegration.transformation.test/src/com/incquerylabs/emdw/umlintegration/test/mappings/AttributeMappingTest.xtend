package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import com.zeligsoft.xtumlrt.common.Attribute
import com.zeligsoft.xtumlrt.xtuml.XTClass
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

@RunWith(Parameterized)
class AttributeMappingTest extends TransformationTest<Property, Attribute> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createPropertyForAttribute(umlRoot, createComponentInModel(umlRoot))
	}

	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.filter(XTClass).head.attributes
	}

	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(mapping.xtumlrtRoot.topEntities.filter(XTComponent).head, xtumlrtObject.type)
		assertEquals(umlObject.static, xtumlrtObject.static) 
		assertEquals(TransformationUtil.transform(umlObject.visibility), xtumlrtObject.visibility)
	}

}
