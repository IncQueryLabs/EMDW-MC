package com.incquerylabs.emdw.cpp.transformation.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.testing.common.utils.CppUtil
import com.incquerylabs.emdw.testing.common.utils.XtumlUtil
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.After
import org.junit.BeforeClass
import org.junit.Test
import org.junit.Before

/**
 * Base class for testing transformation rules.
 */
abstract class TransformationTest<XtumlObject extends EObject, CPPObject extends EObject> {

	protected extension Logger logger = Logger.getLogger(class)
	protected extension ToolchainManager toolchainManager
	protected extension XtumlUtil xtumlUtil = new XtumlUtil
	protected extension CppUtil cppUtil = new CppUtil
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.TRACE
	}

	@Before
	def void init() {}
	
	@Test
	def single() {

		val testId = "single"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtObject = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppObject = prepareCppModel(cppModel)
		
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.resourceSet = cppModel.eResource.resourceSet
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		// transform to CPP
		initializeCppComponentTransformation
		executeCppStructureTransformation
		// Check result
		assertResult(xtModel, cppModel, xtObject, cppObject)
		endTest(testId)
	}
	
	@After
	def cleanup() {
		toolchainManager.dispose
		toolchainManager.disposeEngine
	}

	// Additional alternatives can be added here
	protected def XtumlObject prepareXtUmlModel(Model xtModel)

	protected def CPPObject prepareCppModel(CPPModel cppModel)

	protected def void assertResult(Model input, CPPModel result, XtumlObject xtObject, CPPObject cppObject)

	protected def int countCppDirs(CPPDirectory dir) {
		var int temp = 0
		for (directory : dir.subDirectories) {
			temp += directory.countCppDirs
		}
		temp += 1
	}

	protected def int countCppHeaderFiles(CPPDirectory dir) {
		var int temp = 0
		for (directory : dir.subDirectories) {
			temp += directory.countCppHeaderFiles
		}
		temp += dir.files.filter(CPPHeaderFile).size
	}

	protected def int countCppBodyFiles(CPPDirectory dir) {
		var int temp = 0
		for (directory : dir.subDirectories) {
			temp += directory.countCppBodyFiles
		}
		temp += dir.files.filter(CPPBodyFile).size
	}
	
	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
}
