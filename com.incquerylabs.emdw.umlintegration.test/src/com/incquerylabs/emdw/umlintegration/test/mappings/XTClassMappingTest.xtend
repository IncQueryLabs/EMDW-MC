package com.incquerylabs.emdw.umlintegration.test.mappings

import com.incquerylabs.emdw.umlintegration.test.TransformationTest
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.zeligsoft.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Class
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import com.zeligsoft.xtumlrt.xtuml.XTPackage
import com.zeligsoft.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Model

@RunWith(Parameterized)
class XTClassInModelMappingTest extends TransformationTest<Class, XTClass> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}

	override protected createUmlObject(Model umlRoot) {
		val class = createClass("class")
		umlRoot.packagedElements += class
		class
	}
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.filter(XTClass)
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
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.rootPackages.head as XTPackage).entities.filter(XTClass)
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
	
	override protected getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.topEntities.head as XTComponent).ownedClasses.filter(XTClass)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
	}
	
}