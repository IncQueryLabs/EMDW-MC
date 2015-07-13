package com.incquerylabs.emdw.cpp.transformation.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.XtumlCPPTransformationQrtWrapper
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import static org.junit.Assert.*

abstract class EventDrivenTransformationTest<XtumlObject extends EObject, CppObject extends EObject> extends TestWithoutParameters {

	protected extension XtumlQueries xtumlQueries = XtumlQueries.instance
	
	protected extension XtumlCPPTransformationQrtWrapper xtumlCPPWrapper
	
	new(XtumlCPPTransformationQrtWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		this.xtumlCPPWrapper = wrapper
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        val alternatives = ImmutableList.builder
        	.add(new XtumlCPPTransformationQrtWrapper())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
    }
 	
	@Test
	def incremental_creation_test() {
		val testId = "create_test"
		startTest(testId)
		val xtResource = createEmptyXtumlResource(testId)
		val xtModel = createEmptyXtumlModel(xtResource, testId)
		val cppResource = createCPPResource(xtModel)
		val cppModel = prepareCppModel(cppResource, xtModel)
		
		cppModel.initializeTransformation
		executeTransformation
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObjectCreated(xtObject, engine)
		
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
		
		cppModel.initializeTransformation
		executeTransformation
		
		xtModel.name = "updated_name"
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObjectCreated(xtObject, engine)
		
		xtObject?.removeXtumlObject;
		checkCppObjectRemoved(xtObject, engine)
		
		xtResource.contents.clear
		
		endTest(testId)
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
	
	protected def void checkCppObjectRemoved(XtumlObject xtObject, IncQueryEngine engine)
	
	protected def XtumlObject createXtumlObject(Model modelRoot)
	
	protected def removeXtumlObject(XtumlObject xtObject) {
		EcoreUtil.remove(xtObject)
	}
	
}