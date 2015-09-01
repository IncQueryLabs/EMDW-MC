package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

abstract class SingleComponentTransformTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	override single() {
		val testId = "single"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtComponent = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		// transform to CPP
		initializeCppComponentTransformation(cppModel.eResource.resourceSet)
		executeCppComponentTransformation(xtComponent)
		// Check result
		assertResult(xtModel, cppModel, xtComponent, cppComponent)
		endTest(testId)
	}
	
	override deletion() {
		val testId = "deletion"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtComponent = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		// transform to CPP
		initializeCppComponentTransformation(cppModel.eResource.resourceSet)
		executeCppComponentTransformation(xtComponent)
		// Check if added properly
		assertResult(xtModel, cppModel, xtComponent, cppComponent)
		//remove added xtuml element
		clearXtUmlElement(xtComponent)
		executeCppComponentTransformation(xtComponent)
		//check if removed properly
		assertClear(xtModel, cppModel, xtComponent, cppComponent)
		endTest(testId)
	}
}