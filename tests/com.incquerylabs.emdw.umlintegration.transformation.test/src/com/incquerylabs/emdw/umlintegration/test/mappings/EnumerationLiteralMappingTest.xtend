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
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration
import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	EnumerationLiteralMappingTest
])
@RunWith(Suite)
class EnumerationLiteralMappingTestSuite {}

class EnumerationLiteralMappingTest extends TransformationTest<org.eclipse.uml2.uml.EnumerationLiteral, EnumerationLiteral> {
	
	override protected createUmlObject(org.eclipse.uml2.uml.Model umlModel) {
		val umlPackage = umlModel.createPackageInModel
		val enumeration = umlPackage.createEnumeration => [
			name = "enumeration"
		]
		val enumerationLiteral = enumeration.createEnumerationLiteral => [
			name = "enum_literal"
		]
		
		return enumerationLiteral
	}
	
	override protected getXtumlrtObjects(Model xtModel) {
		val enumeration = xtModel.packages.head.typeDefinitions.head.type as Enumeration
		enumeration.literals
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, org.eclipse.uml2.uml.EnumerationLiteral umlEnumerationLiteral, EnumerationLiteral xtEnumerationLiteral) {
		assertNotNull("TypeDefinition is not created correctly", xtEnumerationLiteral)
		assertEquals("Enumeration name is incorrect", umlEnumerationLiteral.name, xtEnumerationLiteral.name)
	}
	
}