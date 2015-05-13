package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*

@RunWith(Parameterized)
class XTClassInModelMappingTest extends TransformationTest<Class, XTClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		createClassInModel(umlRoot)
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}

}

@RunWith(Parameterized)
class XTClassInPackageMappingTest extends TransformationTest<Class, XTClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val class = createClass("class")
		umlRoot.packagedElements += createPackage("package") => [
			packagedElements += class
		]
		class
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.packages.head as Package).entities.filter(XTClass)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}
	
}

@RunWith(Parameterized)
class XTClassInComponentMappingTest extends TransformationTest<Class, XTClass> {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val class = createClass("class")
		umlRoot.packagedElements += createComponent("component") => [
			nestedClassifiers += class
		]
		class
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).entities.filter(XTClass)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}
	
}