package com.incquerylabs.emdw.cpp.codegeneration.test.persistedmodel

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.codegeneration.test.TestWithoutParameters
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.CPPCodeGenerationWrapper
import com.incquerylabs.emdw.cpp.codegeneration.test.wrappers.TransformationWrapper
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameters

@RunWith(Parameterized)
class PersistedModelTest extends TestWithoutParameters {
	
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
		// load cpp model
		val resourceSet = new ResourceSetImpl
		val resourceUri = URI.createPlatformPluginURI(cppResourcePath, true)
		
		val cppResource = resourceSet.getResource(resourceUri, true)
		val cppModel = cppResource.contents.filter(CPPModel).head
		
		// generate CPP code
		initializeTransformation(cppModel)
		executeTransformation

		endTest(testId)
	}
	
	def getCppResourcePath() {
		"/com.incquerylabs.emdw.cpp.transformation.test/model/HandwrittenComplexModel/model.cppmodel"
	}
}