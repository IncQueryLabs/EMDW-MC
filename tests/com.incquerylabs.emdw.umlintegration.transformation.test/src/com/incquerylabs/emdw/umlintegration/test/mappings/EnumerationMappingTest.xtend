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
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.uml2.uml.Enumeration
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	EnumerationMappingTest
])
@RunWith(Suite)
class EnumerationMappingTestSuite {}

class EnumerationMappingTest extends TransformationTest<Enumeration, TypeDefinition> {
	
	override protected createUmlObject(org.eclipse.uml2.uml.Model umlModel) {
		val umlPackage = umlModel.createPackageInModel
		val enumeration = umlPackage.createEnumeration => [
			name = "enumeration"
		]
		
		return enumeration
	}
	
	override protected getXtumlrtObjects(Model xtModel) {
		xtModel.packages.head.typeDefinitions
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Enumeration umlObject, TypeDefinition typeDefinition) {
		assertNotNull("TypeDefinition is not created correctly", typeDefinition)
		assertNotNull("Enumeration is not created correctly", typeDefinition.type)
		val xtEnumeration = typeDefinition.type
		assertTrue("Enumeration is not created correctly", xtEnumeration instanceof org.eclipse.papyrusrt.xtumlrt.common.Enumeration)
		assertEquals("Enumeration name is incorrect", umlObject.name, xtEnumeration.name)
	}
	
}