package com.incquerylabs.emdw.cpp.common.test

import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.cpp.common.test.wrappers.UmlCppTransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*

abstract class ValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends TestWithoutParameters {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	@Parameters(name = "{index}: {1}")
	public static def transformations() {
		val alternatives = ImmutableList.builder
        	.add(new UmlCppTransformationWrapper())
			.build
		
		alternatives.map[
			val simpleName = it.class.simpleName
			#[it, simpleName].toArray
		]
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
		initializeTransformation(rs, primitiveTypeMapping)
		executeTransformation
		val factory = new UmlValueDescriptorFactory(engine)
		val valueDescriptor = factory.prepareSingleValueDescriptor(umlObject)
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
		initializeTransformation(rs, primitiveTypeMapping)
		executeTransformation
		val factory = new UmlValueDescriptorFactory(engine)
		val valueDescriptor = factory.prepareSingleValueDescriptor(umlObject)
		val cachedDescriptor = factory.getCachedSingleValueDescriptor(umlObject)
		assertResult(valueDescriptor, cachedDescriptor)
		endTest(testId)
	}
	
	protected def IValueDescriptor getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def UmlObject createUmlObject(Model umlModel)
	
	protected def IValueDescriptor prepareSingleValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(UmlObject object, IValueDescriptor descriptor)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
	
}