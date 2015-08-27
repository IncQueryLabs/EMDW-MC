package com.incquerylabs.emdw.cpp.codegeneration.test.persistedmodel

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.testing.common.utils.GenerationUtil
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

class PersistedModelTest {

	protected extension Logger logger = Logger.getLogger(class)
	protected extension GenerationUtil util
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
	}
	
	@Before
	public def void init() {
		util = new GenerationUtil
	}
 	
	@Test
	def single() {
		
		val testId = "single"
		startTest(testId)
		// load cpp model
		val resourceSet = new ResourceSetImpl
		val resourceUri = URI.createPlatformPluginURI(cppResourcePath, true)
		
		val cppResource = resourceSet.getResource(resourceUri, true)
		val cppModel = cppResource.contents.filter(CPPModel).head
		
		// generate CPP code
		initializeGeneration(cppModel, null)
		executeCodeGeneration

		endTest(testId)
	}
	
	@After
	def cleanup() {
		cleanupGeneration
	}
	
	def getCppResourcePath() {
		"/com.incquerylabs.emdw.cpp.transformation.test/model/HandwrittenComplexModel/model.cppmodel"
	}
	
	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
}