package com.incquerylabs.emdw.umlintegration.test

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.test.wrappers.QueryResultTraceability
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

abstract class TransformationTest<UmlObject extends Element, XtumlrtObject extends EObject> extends TestWithoutParameters {

	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
    public static def transformations() {
        val alternatives = ImmutableList.builder
        	.add(new QueryResultTraceability())
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
		val mapping = createRootMapping(testId)
		val umlObject = createUmlObject(mapping.umlRoot)
		mapping.initializeTransformation
		executeTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}
	
	protected def UmlObject createUmlObject(Model umlModel)
	
	protected def assertMapping(RootMapping mapping, UmlObject umlObject) {
		val xtumlrtObjects = mapping.xtumlrtRoot.xtumlrtObjects
		assertFalse("Object not transformed", xtumlrtObjects.empty)
		val xtumlrtObject = xtumlrtObjects.head
		val trace = mapping.traces.findFirst[umlElements.contains(umlObject)]
		assertNotNull("Trace not created", trace)
		assertEquals("Invalid trace umlElements", #[umlObject], trace.umlElements)
		assertEquals("Invalid trace xtumlrtElements", #[xtumlrtObject], trace.xtumlrtElements.filter(xtumlrtObject.class).toList)
		checkXtumlrtObject(mapping, umlObject, xtumlrtObject)		
	}
	
	protected def Iterable<XtumlrtObject> getXtumlrtObjects(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot)

	protected def void checkXtumlrtObject(RootMapping mapping, UmlObject umlObject, XtumlrtObject xtumlrtObject)

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		val mapping = createRootMapping(testId)
		mapping.initializeTransformation
		executeTransformation
		val umlObject = createUmlObject(mapping.umlRoot)
		executeTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		val mapping = createRootMapping(testId)
		val umlObject = createUmlObject(mapping.umlRoot)
		mapping.initializeTransformation
		executeTransformation
		mapping.assertMapping(umlObject)
		val xtumlrtObject = mapping.xtumlrtRoot.xtumlrtObjects.head
		info("Removing object from uml model")
		removeUmlObject(umlObject, mapping)
		executeTransformation
		assertFalse("Object not removed from xtumlrt model", mapping.xtumlrtRoot.xtumlrtObjects.exists[it == xtumlrtObject])
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(umlObject) && xtumlrtElements.contains(xtumlrtObject)])
		endTest(testId)
	}
	
	protected def removeUmlObject(UmlObject umlObject, RootMapping rootMapping) {
		EcoreUtil.remove(umlObject)
	}
   
}
