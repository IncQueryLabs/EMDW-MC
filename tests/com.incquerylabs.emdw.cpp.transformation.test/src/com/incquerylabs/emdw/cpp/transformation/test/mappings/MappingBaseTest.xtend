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
import com.incquerylabs.emdw.cpp.transformation.test.TransformationTest
import com.incquerylabs.emdw.toolchain.Toolchain
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test

abstract class MappingBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	
	@Test
	def deletion() {

		val testId = "deletion"
		startTest(testId)
		// Create xtuml model
		xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtObject = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppObject = prepareCppModel(cppModel)
		
		val toolchainBuilder = Toolchain.builder => [
			it.xumlrtModel = xtModel
		]
		toolchain = toolchainBuilder.build
		// transform to CPP
		initializeCppComponentTransformation
		executeCppStructureTransformation
		
		// Check if added properly
		assertResult(xtModel, cppModel, xtObject, cppObject)
		//remove added xtuml element
		clearXtUmlElement(xtObject)
		executeCppStructureTransformation
		//check if removed properly
		assertClear(xtModel, cppModel, xtObject, cppObject)
		endTest(testId)
	}
	
	
	protected def void clearXtUmlElement(XtumlObject xtObject)

	protected def void assertClear(Model input, CPPModel result, XtumlObject xtObject, CPPObject cppObject)
	
	
}