package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.testing.common.utils.UmlUtil
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

abstract class ValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> {
	
	protected extension Logger logger = Logger.getLogger(class)
	protected extension ToolchainManager toolchainManager
	protected extension ComplexModelUtil complexUtil = new ComplexModelUtil
	protected extension UmlUtil umlUtil = new UmlUtil
	
	protected static final val MODEL_NAME = "test"
	
	protected RootMapping mapping
	
	@BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(AbstractMapping.package.name).level = Level.DEBUG
	}
	
	@Before
	public def void init() { }
	
	@Test
	def simple() {
		val testId = "simple"
		startTest(testId)
		
		val toolchainManagerBuilder = new ToolchainManagerBuilder
		val rs = new ResourceSetImpl
		
		val engine = toolchainManagerBuilder.createDefaultEngine(rs)
		
		val umlModel = MODEL_NAME.prepareUMLResource(rs)
		mapping = umlModel.createRootMapping(engine)
		mapping.xtumlrtRoot.prepareCPPResource
		val xumlrtRS = mapping.eResource.resourceSet
		
		toolchainManagerBuilder => [
			it.engine = engine
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = createPrimitiveTypeMapping(rs, xumlrtRS)
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeTransformations
		executeTransformationsWithoutCodeCompile
		val factory = new UmlValueDescriptorFactory(toolchainManager.engine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		assertResult(umlObject, valueDescriptor)
		endTest(testId)
	}
	
	
	@After
	def cleanup() {
		toolchainManager.dispose
		toolchainManager.disposeEngine
		
		mapping.umlRoot.eResource.resourceSet.cleanUpResourceSet
		mapping.eResource.resourceSet.cleanUpResourceSet
		mapping = null
		
		return
	}
	
	def initializeTransformations() {
		initializeXtTransformation
		initializeCppQrtTransformation
		initializeCppComponentTransformation
	}
	
	def executeTransformationsWithoutCodeCompile() {
		executeXtTransformation
		executeCppQrtTransformation
		executeCppStructureTransformation
	}
	
	def startTest(String testId){
		info('''START TEST: «testId»''')
	}
	
	def endTest(String testId){
		info('''END TEST: «testId»''')
	}
	
	protected def UmlObject createUmlObject(Model umlModel)
	
	protected def IValueDescriptor prepareValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(UmlObject object, IValueDescriptor descriptor)
	
}