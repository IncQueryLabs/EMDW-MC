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

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.toolchain.Toolchain
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

abstract class SingleComponentTransformTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override single() {
		val testId = "single"
		startTest(testId)
		// Create xtuml model
		xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtComponent = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		
		val toolchainBuilder = Toolchain.builder => [
			it.xumlrtModel = xtModel
		]
		toolchain = toolchainBuilder.build
		// transform to CPP
		initializeCppComponentTransformation
		executeCppStructureTransformation(xtComponent)
		// Check result
		assertResult(xtModel, cppModel, xtComponent, cppComponent)
		endTest(testId)
	}
	
	override deletion() {
		val testId = "deletion"
		startTest(testId)
		// Create xtuml model
		xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtComponent = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		
		val toolchainBuilder = Toolchain.builder => [
			it.xumlrtModel = xtModel
		]
		toolchain = toolchainBuilder.build
		// transform to CPP
		initializeCppComponentTransformation
		executeCppStructureTransformation(xtComponent)
		// Check if added properly
		assertResult(xtModel, cppModel, xtComponent, cppComponent)
		//remove added xtuml element
		clearXtUmlElement(xtComponent)
		executeCppStructureTransformation(xtComponent)
		//check if removed properly
		assertClear(xtModel, cppModel, xtComponent, cppComponent)
		endTest(testId)
	}
}