package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Component
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import com.zeligsoft.xtumlrt.xtuml.XTPackage

@RunWith(Parameterized)
class XTComponentInModelMappingTest extends TransformationTest<Component, XTComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val component = createComponent("component")
		mapping.umlRoot.packagedElements += component
		component
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		mapping.xtumlrtRoot.topEntities.filter(XTComponent)
	}
	
	override protected checkState(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTComponentInPackageMappingTest extends TransformationTest<Component, XTComponent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(RootMapping mapping) {
		val component = createComponent("component")
		val package = createPackage("package") => [
			packagedElements += component
		]
		mapping.umlRoot.packagedElements += package
		component
	}
	
	override protected getXtumlrtObjects(RootMapping mapping) {
		(mapping.xtumlrtRoot.rootPackages.head as XTPackage).entities.filter(XTComponent)
	}

	override protected checkState(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}