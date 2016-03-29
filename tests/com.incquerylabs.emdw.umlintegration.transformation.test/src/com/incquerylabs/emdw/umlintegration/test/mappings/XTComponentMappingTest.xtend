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
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	XTComponentInModelMappingTest,
	XTComponentInPackageMappingTest
])
@RunWith(Suite)
class XTComponentMappingTestSuite {}

class XTComponentInModelMappingTest extends TransformationTest<Component, XTComponent> {

	override protected createUmlObject(Model umlRoot) {
		umlRoot.createComponentInModel
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.entities.filter(XTComponent)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}

class XTComponentInPackageMappingTest extends TransformationTest<Component, XTComponent> {

	override protected createUmlObject(Model umlRoot) {
		val component = createComponent("component")
		umlRoot.packagedElements += createPackage("package") => [
			packagedElements += component
		]
		component
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		(xtumlrtRoot.packages.head as Package).entities.filter(XTComponent)
	}

	override protected checkXtumlrtObject(RootMapping mapping, Component umlObject, XTComponent xtumlrtObject) {
	}
	
}