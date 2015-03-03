package com.incquerylabs.emdw.umlintegration.test

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.test.wrappers.QueryResultTraceability
import com.incquerylabs.emdw.umlintegration.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.uml2.uml.NamedElement
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.umlintegration.test.TransformationTestUtil.*
import static org.junit.Assert.*

abstract class TransformationTest<UmlObject extends NamedElement, XtumlrtObject extends com.zeligsoft.xtumlrt.common.NamedElement> extends TestWithoutParameters {

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
		val umlObject = createUmlObject(mapping)
		mapping.initializeTransformation
		executeTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}
	
	protected def UmlObject createUmlObject(RootMapping mapping)
	
	protected def assertMapping(RootMapping mapping, UmlObject umlObject) {
		val xtumlrtObjects = mapping.xtumlrtObjects
		assertFalse("Object not transformed", xtumlrtObjects.empty)
		val xtumlrtObject = xtumlrtObjects.head
		val trace = mapping.traces.findFirst[umlElements.contains(umlObject)]
		assertNotNull("Trace not created", trace)
		assertEquals("Trace is not complete (umlElements)", #[umlObject], trace.umlElements)
		assertEquals("Trace is not complete (xtumlrtElements)", #[xtumlrtObject], trace.xtumlrtElements)
		checkState(mapping, umlObject, xtumlrtObject)		
	}
	
	protected def Iterable<XtumlrtObject> getXtumlrtObjects(RootMapping mapping)

	protected def void checkState(RootMapping mapping, UmlObject umlObject, XtumlrtObject xtumlrtObject)

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		val mapping = createRootMapping(testId)
		mapping.initializeTransformation
		executeTransformation
		val umlObject = createUmlObject(mapping)
		executeTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		val mapping = createRootMapping(testId)
		val umlObject = createUmlObject(mapping)
		mapping.initializeTransformation
		executeTransformation
		mapping.assertMapping(umlObject)
		info("Removing object from uml model")
		EcoreUtil.remove(umlObject)
		executeTransformation
		assertTrue("Object not removed from xtumlrt model", mapping.xtumlrtObjects.empty)
		assertFalse("Trace not removed", mapping.traces.exists[umlElements.contains(umlObject)])
		endTest(testId)
	}
   
}
