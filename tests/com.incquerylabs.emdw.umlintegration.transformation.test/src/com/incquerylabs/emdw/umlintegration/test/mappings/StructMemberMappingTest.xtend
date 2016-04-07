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
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	StructMemberMappingTest
])
@RunWith(Suite)
class StructMemberMappingTestSuite {}

class StructMemberMappingTest extends TransformationTest<Property, Attribute> {

	override protected createUmlObject(Model umlRoot) {
		val umlPackage = umlRoot.createPackageInModel
		umlPackage.createStructType.ownedAttributes.head
	}

	override protected getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(StructuredType).head.attributes
	}
	
	override protected checkXtumlrtObject(RootMapping mapping, Property umlObject, Attribute xtumlrtObject) {
		assertEquals(getTypeOfStructMember(mapping), xtumlrtObject.type)
	}
	
	protected def getTypeOfStructMember(RootMapping mapping) {
		mapping.xtumlrtRoot.packages.head.typeDefinitions.map[type].filter(PrimitiveType).head
	}
}
