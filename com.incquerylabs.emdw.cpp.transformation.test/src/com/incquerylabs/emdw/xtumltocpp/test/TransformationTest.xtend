package com.incquerylabs.emdw.xtumltocpp.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.xtumltocpp.test.wrappers.XtumlCPPTransformationWrapper
import org.eclipse.emf.ecore.EObject
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.xtumltocpp.test.TransformationTestUtil.*

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
        	.add(new XtumlCPPTransformationWrapper())
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
		//Create Root mapping
		val xtModel = createEmptyXtumlModel(testId)
		//Init UML model
		//Transform model to XTUML
		val xtObject = prepareXtUmlModel(xtModel)
		//init cpp model
		val cppResource = createCPPResource(xtModel)
		val cppModel = createCPPModel(cppResource,xtModel)
		val cppObject = prepareCppModel(cppModel)
		//transform to CPP
		initializeTransformation(cppModel)
		executeTransformation
		//Check result
		assertResult(xtModel, cppModel, xtObject, cppObject)
		endTest(testId)
	}
	
	//Additional alternatives can be added heres

	protected def XtumlObject prepareXtUmlModel(Model xtModel)

	protected def CPPObject prepareCppModel(CPPModel cppModel)

	protected def void assertResult(Model input, CPPModel result, XtumlObject xtObject, CPPObject cppObject)   
}
