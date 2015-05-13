package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTComponentInModelMappingTest extends TransformationTest<Component, XTComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createComponentInModel(umlRoot)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTComponent)
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
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.packages.head as org.eclipse.papyrusrt.xtumlrt.common.Package).entities.filter(XTComponent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}