package com.incquerylabs.emdw.umlintegration.test

import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.testing.common.utils.UmlUtil
import com.incquerylabs.emdw.testing.common.utils.XtumlUtil
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

import static org.junit.Assert.*

/**
 * Base class for testing transformation rules.
 */
abstract class TransformationTest<UmlObject extends Element, XtumlrtObject extends EObject> {
	protected extension Logger logger = Logger.getLogger(class)
	protected extension ToolchainManager toolchainManager
	protected extension UmlUtil umlUtil = new UmlUtil
	protected extension XtumlUtil xtumlUtil = new XtumlUtil
	protected extension ComplexModelUtil complexUtil = new ComplexModelUtil

	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(AbstractMapping.package.name).level = Level.DEBUG
	}

	@Before
	def void init() {
		val managerBuilder = new ToolchainManagerBuilder => [
			resourceSet = new ResourceSetImpl
		]
		toolchainManager = managerBuilder.buildOrGetManager
	}

	@Test
	def single() {
		val testId = "single"
		startTest(testId)
		val mapping = createBasicRootMapping(testId, toolchainManager.resourceSet)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeXtTransformation
		executeXtTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}

	@Test
	def incremental() {
		val testId = "incremental"
		startTest(testId)
		val mapping = createBasicRootMapping(testId, toolchainManager.resourceSet)
		initializeXtTransformation
		executeXtTransformation
		val umlObject = createUmlObject(mapping.umlRoot)
		executeXtTransformation
		mapping.assertMapping(umlObject)
		endTest(testId)
	}

	@Test
	def remove() {
		val testId = "remove"
		startTest(testId)
		val mapping = createBasicRootMapping(testId, toolchainManager.resourceSet)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeXtTransformation
		executeXtTransformation
		mapping.assertMapping(umlObject)
		val xtumlrtObject = mapping.xtumlrtRoot.xtumlrtObjects.head
		info("Removing object from uml model")
		removeUmlObject(umlObject, mapping)
		executeXtTransformation
		assertFalse("Object not removed from xtumlrt model", mapping.xtumlrtRoot.xtumlrtObjects.exists [
			it == xtumlrtObject
		])
		assertFalse("Trace not removed", mapping.traces.exists [
			umlElements.contains(umlObject) && xtumlrtElements.contains(xtumlrtObject)
		])
		endTest(testId)
	}

	@After
	def cleanup() {
		toolchainManager.dispose
		toolchainManager.disposeEngine
	}

	protected def assertMapping(RootMapping mapping, UmlObject umlObject) {
		val xtumlrtObjects = mapping.xtumlrtRoot.xtumlrtObjects
		assertFalse("Object not transformed", xtumlrtObjects.empty)
		val xtumlrtObject = xtumlrtObjects.head
		val trace = mapping.traces.findFirst[umlElements.contains(umlObject)]
		assertNotNull("Trace not created", trace)
		assertEquals("Invalid trace umlElements", #[umlObject], trace.umlElements)
		assertEquals("Invalid trace xtumlrtElements", #[xtumlrtObject],
			trace.xtumlrtElements.filter(xtumlrtObject.class).toList)
		checkXtumlrtObject(mapping, umlObject, xtumlrtObject)
	}

	protected def removeUmlObject(UmlObject umlObject, RootMapping rootMapping) {
		EcoreUtil.remove(umlObject)
	}

	def startTest(String testId) {
		info('''START TEST: «testId»''')
	}

	def endTest(String testId) {
		info('''END TEST: «testId»''')
	}

	/**
	 * Creates an UML object which will be transformed.
	 */
	protected def UmlObject createUmlObject(Model umlModel)

	/**
	 * Returns the collection which should contain the transformed xtumlrt object.
	 */
	protected def Iterable<XtumlrtObject> getXtumlrtObjects(org.eclipse.papyrusrt.xtumlrt.common.Model xtumlrtRoot)

	/**
	 * Asserts the fields of the transformed xtumlrt object.
	 */
	protected def void checkXtumlrtObject(RootMapping mapping, UmlObject umlObject, XtumlrtObject xtumlrtObject)

}
