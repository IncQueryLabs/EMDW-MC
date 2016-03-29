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
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.DataType
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	StructTypeMappingTest
])
@RunWith(Suite)
class StructTypeMappingTestSuite {}

class StructTypeMappingTest extends TransformationTest<DataType, StructuredType> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		umlPackage.createStructType
	}
	
	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(StructuredType)
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, DataType umlObject, StructuredType xtumlrtObject) {
	}
	
}