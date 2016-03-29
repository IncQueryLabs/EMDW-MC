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
import com.incquerylabs.emdw.cpp.transformation.test.EventDrivenTransformationTest
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CPPModelMappingTest
])
@RunWith(Suite)
class CPPModelMappingTestSuite {}

class CPPModelMappingTest extends EventDrivenTransformationTest<Model, CPPModel> {
	
	override protected createXtumlObject(Model modelRoot) {
		modelRoot
	}
	
	override protected checkCppObjectCreated(Model xtObject, IncQueryEngine engine) {
		val cppModelMatches = engine.cppModel.allMatches
		assertNotNull(cppModelMatches.head)
		assertTrue(cppModelMatches.exists[xtObject == it.cppModel.commonModel])
	}
	
	override protected checkCppObjectRemoved(CPPModel cppModel, Model xtObject) {
		
	}
	
}