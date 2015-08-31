package com.incquerylabs.emdw.cpp.common.test

import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.testing.common.utils.TransformationUtil
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.testing.common.utils.UmlUtil

abstract class ValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> {
	
	protected extension Logger logger = Logger.getLogger(class)
	protected extension TransformationUtil util
	protected extension ComplexModelUtil complexUtil = new ComplexModelUtil
	protected extension UmlUtil umlUtil = new UmlUtil
    
    @BeforeClass
	def static setupRootLogger() {
		Logger.getLogger(AbstractMapping.package.name).level = Level.DEBUG
	}
	
	@Before
	public def void init() {
		util = new TransformationUtil
	}
	
	@Test
	def simple() {
		val testId = "simple"
		startTest(testId)
		val rs = new ResourceSetImpl
		val managedEngine = IncQueryEngine.on(new EMFScope(rs))
		QueryBasedFeatures.instance.prepare(managedEngine)
		
		val mapping = createRootMapping("test",rs)
		val primitiveTypeMapping = createPrimitiveTypeMapping(rs)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeAllTransformation(rs, primitiveTypeMapping)
		executeAllTransformation
		val factory = new UmlValueDescriptorFactory(transformationEngine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		assertResult(umlObject, valueDescriptor)
		endTest(testId)
	}
	
	@Test
	def cache() {
		val testId = "cache"
		startTest(testId)
		val rs = new ResourceSetImpl
		val managedEngine = IncQueryEngine.on(new EMFScope(rs))
		QueryBasedFeatures.instance.prepare(managedEngine)
		
		val mapping = createRootMapping("test",rs)
		val primitiveTypeMapping = createPrimitiveTypeMapping(rs)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeAllTransformation(rs, primitiveTypeMapping)
		executeAllTransformation
		val factory = new UmlValueDescriptorFactory(transformationEngine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		val cachedDescriptor = factory.getCachedValueDescriptor(umlObject)
		assertResult(valueDescriptor, cachedDescriptor)
		endTest(testId)
	}
	
	@After
	def cleanup() {
		cleanupTransformation;
	}
    
    def startTest(String testId){
    	info('''START TEST: «testId»''')
    }
    
    def endTest(String testId){
    	info('''END TEST: «testId»''')
    }
	
	protected def IValueDescriptor getCachedValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def UmlObject createUmlObject(Model umlModel)
	
	protected def IValueDescriptor prepareValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(UmlObject object, IValueDescriptor descriptor)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
	
}