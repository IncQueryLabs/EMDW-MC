package com.incquerylabs.emdw.cpp.transformation.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.testing.common.utils.CppUtil
import com.incquerylabs.emdw.testing.common.utils.XtumlUtil
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.After
import org.junit.BeforeClass
import org.junit.Test

import static org.junit.Assert.*

abstract class EventDrivenTransformationTest<XtumlObject extends EObject, CppObject extends EObject> {

	protected extension Logger logger = Logger.getLogger(class)
	protected extension XtumlQueries xtumlQueries = XtumlQueries.instance
	protected extension ToolchainManager toolchainManager
	protected extension XtumlUtil xtumlUtil = new XtumlUtil
	protected extension CppUtil cppUtil = new CppUtil
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.TRACE
	}
	
	@Test
	def incremental_creation_test() {
		val testId = "create_test"
		startTest(testId)
		val xtResource = createEmptyXtumlResource(testId)
		val xtModel = createEmptyXtumlModel(xtResource, testId)
		val cppResource = createCPPResource(xtModel)
		val cppModel = prepareCppModel(cppResource, xtModel)
		
		val resourceSet = cppModel.eResource.resourceSet
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = xtModel
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		
		initializeCppQrtTransformation
		executeCppQrtTransformation
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObjectCreated(xtObject, toolchainManager.engine)
		
		xtResource.contents.clear
		
		endTest(testId)
	}
	
	@Test
	def incremental_removal_test() {
		val testId = "remove_test"
		startTest(testId)
		val xtResource = createEmptyXtumlResource(testId)
		val xtModel = createEmptyXtumlModel(xtResource, testId)
		val cppResource = createCPPResource(xtModel)
		val cppModel = prepareCppModel(cppResource, xtModel)
		
		val resourceSet = cppModel.eResource.resourceSet
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = xtModel
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		
		initializeCppQrtTransformation
		executeCppQrtTransformation
		
		xtModel.name = "updated_name"
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObjectCreated(xtObject, toolchainManager.engine)
		
		xtObject?.removeXtumlObject;
		checkCppObjectRemoved(cppModel, xtObject)
		
		xtResource.contents.clear
		
		endTest(testId)
	}
	
	@After
	def cleanup() {
		toolchainManager.dispose
		toolchainManager.disposeEngine
	}
	
	/**
	 * Assertions
	 */
	protected def void assertCppModelCreation(Model xtModel, IncQueryEngine engine) {
		assertNotNull("Model is null!", xtModel)
		assertNotNull("Model name is null", xtModel.name)
		val xtModel2cppModel = getXtModelToCppModel(engine)
		assertEquals(xtModel2cppModel.countMatches, 1)
		//TODO: add further assertions if needed
	}
	
	protected def void assertCppModelDeletion(IncQueryEngine engine) {
		val cppModel = getCppModel(engine)
		assertEquals(0, cppModel.countMatches)
	}
	
	protected def CPPModel prepareCppModel(Resource resource, Model xtModel) {
		val cppModel = createCPPModel(resource, xtModel)
		val modelDir = createCPPDirectory(cppModel.eResource)
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		cppModel
	}
	
	protected def void checkCppObjectCreated(XtumlObject xtObject, IncQueryEngine engine)
	
	protected def void checkCppObjectRemoved(CPPModel cppModel, XtumlObject xtObject)
	
	protected def XtumlObject createXtumlObject(Model modelRoot)
	
	protected def removeXtumlObject(XtumlObject xtObject) {
		EcoreUtil.remove(xtObject)
	}
	
	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
	
}