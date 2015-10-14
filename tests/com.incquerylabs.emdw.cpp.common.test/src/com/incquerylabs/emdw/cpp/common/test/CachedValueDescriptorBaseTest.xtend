package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Element
import org.junit.Test
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder

abstract class CachedValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends ValueDescriptorBaseTest<UmlObject, IValueDescriptor> {
	
	@Test
	def cache() {
		val testId = "cache"
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
			it.resourceSet = xumlrtRS
			it.primitiveTypeMapping = createPrimitiveTypeMapping(rs, xumlrtRS)
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		
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