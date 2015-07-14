package com.incquerylabs.emdw.cpp.codegeneration.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import org.eclipse.emf.ecore.EObject
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.codegeneration.test.TransformationTestUtil.*
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper

/**
 * Base class for testing transformation rules.
 */
abstract class TransformationTest<XtumlObject extends EObject, CPPObject extends EObject> extends TestWithoutParameters {

	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        val alternatives = ImmutableList.builder
//        	.add(new DummyWrapper())
        	.add(new CPPCodeGenerationWrapper())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
 	
	@Test
	def single() {
		
		val testId = "single"
		startTest(testId)
		//Create xtuml model
		val xtModel = createEmptyXtumlModel(this.class.simpleName+"_"+testId)
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
	
	protected def void transformCppModel(CPPModel cppModel) {
		initializeTransformation(cppModel)
		executeTransformation
	}
	
	//Additional alternatives can be added here
	protected def CPPObject prepareCppModel(CPPModel cppModel)

	protected def void assertResult(CPPModel result, CPPObject cppObject)   
}
