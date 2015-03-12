package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Class
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTClassMappingTest extends TransformationTest<Class, XTClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		createClass(mapping.umlRoot, "class")
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtRoot.topEntities.filter(XTClass)
	}
	
	override protected checkState(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}

}