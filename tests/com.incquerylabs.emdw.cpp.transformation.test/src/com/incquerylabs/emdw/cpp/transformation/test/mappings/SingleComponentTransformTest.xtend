package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder

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
		
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = xtModel
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
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
		
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = xtModel
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
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