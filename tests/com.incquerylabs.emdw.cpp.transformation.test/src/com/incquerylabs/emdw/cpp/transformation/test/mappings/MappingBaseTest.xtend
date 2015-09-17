package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.TransformationTest
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test

abstract class MappingBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	
	@Test
	def deletion() {

		val testId = "deletion"
		startTest(testId)
		// Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName + "_" + testId)
		val xtObject = prepareXtUmlModel(xtModel)
		// init cpp model
		val cppResource = createCPPResource(xtModel)
		loadDefaultContainerImplementations(cppResource)
		val cppModel = prepareCPPModel(cppResource, xtModel)
		val cppObject = prepareCppModel(cppModel)
		// transform to CPP
		initializeCppComponentTransformation(cppModel.eResource.resourceSet)
		executeCppComponentTransformationWithoutCodeCompile
		// Check if added properly
		assertResult(xtModel, cppModel, xtObject, cppObject)
		//remove added xtuml element
		clearXtUmlElement(xtObject)
		executeCppComponentTransformationWithoutCodeCompile
		//check if removed properly
		assertClear(xtModel, cppModel, xtObject, cppObject)
		endTest(testId)
	}
	
	
	protected def void clearXtUmlElement(XtumlObject xtObject)

	protected def void assertClear(Model input, CPPModel result, XtumlObject xtObject, CPPObject cppObject)
	
	
}