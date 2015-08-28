package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	XTClassInModelMappingTest,
	XTClassInPackageMappingTest,
	XTClassInComponentAsNestedClassifierMappingTest,
	XTClassInComponentAsPackagedElementMappingTest
])
@RunWith(Suite)
class XTClassMappingTestSuite {}

class XTClassInModelMappingTest extends TransformationTest<Class, XTClass> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createClassInModel
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}

}

class XTClassInPackageMappingTest extends TransformationTest<Class, XTClass> {

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

class XTClassInComponentAsNestedClassifierMappingTest extends TransformationTest<Class, XTClass> {

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

class XTClassInComponentAsPackagedElementMappingTest extends TransformationTest<Class, XTClass> {

	override protected createUmlObject(Model umlRoot) {
		val class = createClass("class")
		umlRoot.packagedElements += createComponent("component") => [
			packagedElements += class
		]
		class
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.entities.head as XTComponent).entities.filter(XTClass)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}
	
}