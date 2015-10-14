package com.incquerylabs.emdw.cpp.common.test

import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.testing.common.utils.TransformationUtil
import com.incquerylabs.emdw.testing.common.utils.UmlUtil
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.After
import org.junit.Before
import org.junit.BeforeClass
import org.junit.Test

abstract class ValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> {
	
	protected extension Logger logger = Logger.getLogger(class)
	protected extension TransformationUtil util
	protected extension ComplexModelUtil complexUtil = new ComplexModelUtil
	protected extension UmlUtil umlUtil = new UmlUtil
	
	protected static final val MODEL_NAME = "test"
	
	protected RootMapping mapping
    
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
		
		val engine = initializeEngine(rs)
		val umlModel = MODEL_NAME.prepareUMLResource(rs)
		mapping = umlModel.createRootMapping(rs, engine)
		mapping.xtumlrtRoot.prepareCPPResource
		val xumlrtRS = mapping.eResource.resourceSet
		val primitiveTypeMapping = createPrimitiveTypeMapping(rs, xumlrtRS)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeAllTransformation(xumlrtRS, primitiveTypeMapping)
		executeAllTransformationWithoutCodeCompile
		val factory = new UmlValueDescriptorFactory(transformationEngine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		assertResult(umlObject, valueDescriptor)
		endTest(testId)
	}
	
	
	@After
	def cleanup() {
		cleanupTransformation;
		
		mapping.umlRoot.eResource.resourceSet.cleanUpResourceSet
		mapping.eResource.resourceSet.cleanUpResourceSet
		mapping = null
		
		return
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