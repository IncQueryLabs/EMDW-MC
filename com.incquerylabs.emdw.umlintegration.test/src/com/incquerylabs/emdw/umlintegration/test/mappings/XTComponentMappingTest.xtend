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
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class XTComponentInModelMappingTest extends TransformationTest<Component, XTComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createComponentInModel(umlRoot)
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.filter(XTComponent)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTComponentInPackageMappingTest extends TransformationTest<Component, XTComponent> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val component = createComponent("component")
		umlRoot.packagedElements += createPackage("package") => [
			packagedElements += component
		]
		component
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.rootPackages.head as XTPackage).entities.filter(XTComponent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}