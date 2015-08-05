package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.valuedescriptor.AbstractValueDescriptor
import org.eclipse.uml2.uml.Element
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import org.junit.runners.Parameterized.Parameters
import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.cpp.common.test.wrappers.UmlCppTransformationWrapper
import org.junit.Test

import static com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*
import org.eclipse.uml2.uml.Model
import com.incquerylabs.emdw.cpp.common.factory.impl.UmlValueDescriptorFactory
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl

abstract class ValueDescriptorBaseTest<UmlObject extends Element, ValueDescriptor extends AbstractValueDescriptor> extends TestWithoutParameters {
	
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
	
	protected def ValueDescriptor getCachedSingleValueDescriptor(UmlValueDescriptorFactory factory, UmlObject object)
	
	protected def UmlObject createUmlObject(Model umlModel)
	
	protected def ValueDescriptor prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(UmlObject object, ValueDescriptor descriptor)
	
	protected def void assertResult(ValueDescriptor originalDescriptor, ValueDescriptor cachedDescriptor)
	
}