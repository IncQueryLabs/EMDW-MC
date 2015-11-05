package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.toolchain.Toolchain
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Element
import org.junit.Test

abstract class CachedValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends ValueDescriptorBaseTest<UmlObject, IValueDescriptor> {
	
	@Test
	def cache() {
		val testId = "cache"
		startTest(testId)
		val toolchainBuilder = Toolchain.builder
		val rs = new ResourceSetImpl
		
		val engine = toolchainBuilder.createDefaultEngine(rs)
		
		val umlModel = MODEL_NAME.prepareUMLResource(rs)
		mapping = umlModel.createRootMapping(engine)
		mapping.xtumlrtRoot.prepareCPPResource
		val xumlrtRS = mapping.eResource.resourceSet
		
		toolchainBuilder => [
			it.engine = engine
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = createPrimitiveTypeMapping(rs, xumlrtRS)
		]
		toolchain = toolchainBuilder.build
		
		val umlObject = createUmlObject(mapping.umlRoot)
		initializeTransformations
		executeTransformationsWithoutCodeCompile
		val factory = new UmlValueDescriptorFactory(toolchain.engine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		val cachedDescriptor = factory.getCachedValueDescriptor(umlObject)
		assertResult(valueDescriptor, cachedDescriptor)
		endTest(testId)
	}
	
	protected def IValueDescriptor getCachedValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
}