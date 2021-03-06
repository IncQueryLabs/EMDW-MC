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
package com.incquerylabs.emdw.cpp.codegeneration.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.testing.common.utils.CppUtil
import com.incquerylabs.emdw.testing.common.utils.GenerationUtil
import com.incquerylabs.emdw.testing.common.utils.XtumlUtil
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

/**
 * Base class for testing transformation rules.
 */
abstract class TransformationTest<XtumlObject extends EObject, CPPObject extends EObject> {
	protected extension Logger logger = Logger.getLogger(class)
	protected extension GenerationUtil generationUtil
	protected extension XtumlUtil xtumlUtil = new XtumlUtil
	protected extension CppUtil cppUtil = new CppUtil
	
	protected String testId
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
	}
	
	@Before
	public def void init() {
		generationUtil = new GenerationUtil
	}
 	
	@Test
	def test_1() {
		testId = '''«this.class.simpleName»_test_1'''
		startTest(testId)
		//Create xtuml model
		val xtModel = createEmptyXtumlModel(testId)
		//init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModel = createCPPModelWithCommonDirectory(cppResource,xtModel)
		val cppObject = prepareCppModel(cppModel)
		//transform to CPP
		transformCppModel(cppModel)
		//Check result
		assertResult(cppModel, cppObject)
		endTest(testId)
	}
	
	@After
	def cleanup() {
		cleanupGeneration
	}
	
	protected def void transformCppModel(CPPModel cppModel) {
		initializeGeneration(cppModel, null)
		executeCodeGeneration
	}
	
	//Additional alternatives can be added here
	protected def CPPObject prepareCppModel(CPPModel cppModel)

	protected def void assertResult(CPPModel result, CPPObject cppObject)

	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
}
