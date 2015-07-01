package com.incquerylabs.emdw.cpp.transformation.test

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.transformation.test.wrappers.XtumlCPPTransformationQrtWrapper
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.transformation.test.TransformationTestUtil.*
import static org.junit.Assert.*

abstract class EventDrivenTransformationTest<XtumlObject extends EObject, CppObject extends EObject> extends TestWithoutParameters {
	
	protected extension XtumlCPPTransformationQrtWrapper xtCppwrapper
	protected extension XtumlQueries xtumlQueries = XtumlQueries.instance
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
		xtCppwrapper = wrapper as XtumlCPPTransformationQrtWrapper
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
		xtResource.initializeTransformation
		executeTransformation
		val xtModel = createEmptyXtumlModel(xtResource, testId)
		assertCppModelCreation(xtModel, incQueryEngine)
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObject(xtObject, incQueryEngine)
		
		removeXtumlObject(xtModel as XtumlObject)
		assertCppModelDeletion(incQueryEngine)
		endTest(testId)
	}
	
	@Test
	def incremental_removal_test() {
		val testId = "remove_test"
		startTest(testId)
		val xtResource = createEmptyXtumlResource(testId)
		xtResource.initializeTransformation
		executeTransformation
		val xtModel = createEmptyXtumlModel(xtResource, testId)
		assertCppModelCreation(xtModel, incQueryEngine)
		
		xtModel.name = "updated_name"
		
		val xtObject = createXtumlObject(xtModel)
		checkCppObject(xtObject, incQueryEngine)
		
		xtObject?.removeXtumlObject;
		
		(xtModel as XtumlObject)?.removeXtumlObject
		assertCppModelDeletion(incQueryEngine)

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
		assertEquals(cppModel.countMatches, 0)
	}
	
	protected def void checkCppObject(XtumlObject xtObject, IncQueryEngine engine)
	
	protected def XtumlObject createXtumlObject(Model modelRoot)
	

	
	protected def removeXtumlObject(XtumlObject xtObject) {
		EcoreUtil.remove(xtObject)
	}
	
}