package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

abstract class SingleComponentTransformTest extends MappingBaseTest<XTComponent, CPPComponent> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override single() {
		val testId = "single"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtComponent = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModel = createCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		// transform to CPP
		initializeTransformation(cppModel)
		executeTransformation(xtComponent)
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
		val cppModel = createCPPModel(cppResource, xtModel)
		val cppComponent = prepareCppModel(cppModel)
		// transform to CPP
		initializeTransformation(cppModel)
		executeTransformation(xtComponent)
		// Check if added properly
		assertResult(xtModel, cppModel, xtComponent, cppComponent)
		//remove added xtuml element
		clearXtUmlElement(xtComponent)
		executeTransformation(xtComponent)
		//check if removed properly
		assertClear(xtModel, cppModel, xtComponent, cppComponent)
		endTest(testId)
	}
}