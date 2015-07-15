package com.incquerylabs.emdw.cpp.transformation.test.mappings

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.test.TransformationTest
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*

abstract class MappingBaseTest<XtumlObject extends EObject, CPPObject extends EObject> extends TransformationTest<XtumlObject, CPPObject> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
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
		createCPPExternalLibrary(cppResource)
		val cppModel = createCPPModel(cppResource, xtModel)
		val cppObject = prepareCppModel(cppModel)
		// transform to CPP
		initializeTransformation(cppModel)
		executeTransformation
		// Check if added properly
		assertResult(xtModel, cppModel, xtObject, cppObject)
		//remove added xtuml element
		clearXtUmlElement(xtObject)
		executeTransformation
		//check if removed properly
		assertClear(xtModel, cppModel, xtObject, cppObject)
		endTest(testId)
	}
	
	
	protected def void clearXtUmlElement(XtumlObject xtObject)

	protected def void assertClear(Model input, CPPModel result, XtumlObject xtObject, CPPObject cppObject)
	
	
}