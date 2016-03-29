/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPModelPackageMappingTest,
	CPPModelPackageInPackageMappingTest
])
@RunWith(Suite)
class CPPModelPackageMappingTestSuite {}

class CPPModelPackageMappingTest extends EventDrivenTransformationTest<Package, CPPPackage> {
	
	override protected createXtumlObject(Model modelRoot) {
		createPackage(modelRoot, "test_package1")
	}
		
	override protected checkCppObjectCreated(Package xtObject, IncQueryEngine engine) {
		assertTrue("CPP package not exists" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(CPPModel cppModel, Package xtObject) {
		val allCppPackages = cppModel.subElements.filter(CPPPackage)
		val cppPackages = allCppPackages.filter[commonPackage.equals(xtObject)]
		assertTrue("CPP package not exists" , cppPackages.isEmpty)
	}
	
}

class CPPModelPackageInPackageMappingTest extends EventDrivenTransformationTest<Package, CPPPackage> {
	
	override protected createXtumlObject(Model modelRoot) {
		val l1_package = createPackage(modelRoot, "test_package1")
		val l2_package = createPackage(l1_package, "test_package2")
		val l3_package = createPackage(l2_package, "test_package3")
		createPackage(l3_package, "test_package4")
	}
	
	override protected checkCppObjectCreated(Package xtObject, IncQueryEngine engine) {
		assertTrue("CPP package not created" , engine.cppPackages.allValuesOfxtPackage.contains(xtObject))
	}
	
	override protected checkCppObjectRemoved(CPPModel cppModel, Package xtObject) {
		val cppPackage1 = cppModel.subElements.filter(CPPPackage).head
		val cppPackage2 = cppPackage1.subElements.filter(CPPPackage).head
		val cppPackage3 = cppPackage2.subElements.filter(CPPPackage).head
		val cppPackages = cppPackage3.subElements.filter(CPPPackage)
		assertTrue("CPP package not removed" , cppPackages.isEmpty)
	}
	
}