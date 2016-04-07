/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
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

import static org.junit.Assert.*

@SuiteClasses(#[
	XTClassInModelMappingTest,
	XTClassInPackageMappingTest,
	XTClassInComponentAsNestedClassifierMappingTest,
	XTClassInComponentAsPackagedElementMappingTest,
	AbstractXTClassMappingTest
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
		assertFalse("XTClass is set to abstract by default", xtumlrtObject.isAbstract)
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

class AbstractXTClassMappingTest extends TransformationTest<Class, XTClass> {
	override protected createUmlObject(Model umlRoot) {
		val umlClass = umlRoot.createClassInModel => [
			isAbstract = true
		]
		umlClass
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTClass)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Class umlObject, XTClass xtumlrtObject) {
		assertTrue("XTClass is not set to abstract", xtumlrtObject.isAbstract)
	}
}
