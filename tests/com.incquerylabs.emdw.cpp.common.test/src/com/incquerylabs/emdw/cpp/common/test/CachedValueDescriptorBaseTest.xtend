package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Element
import org.junit.Test

abstract class CachedValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends ValueDescriptorBaseTest<UmlObject, IValueDescriptor> {
	
	@Test
	def cache() {
		val testId = "cache"
		startTest(testId)
		
		val mapping = createRootMapping("test",toolchainManager.resourceSet)
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeTransformations
		executeTransformationsWithoutCodeCompile
		val factory = new UmlValueDescriptorFactory(toolchainManager.engine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		val cachedDescriptor = factory.getCachedValueDescriptor(umlObject)
		assertResult(valueDescriptor, cachedDescriptor)
		endTest(testId)
	}
	
	protected def IValueDescriptor getCachedValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
}