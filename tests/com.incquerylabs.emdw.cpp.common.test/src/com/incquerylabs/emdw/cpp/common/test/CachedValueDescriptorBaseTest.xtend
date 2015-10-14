package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Element
import org.junit.Test

abstract class CachedValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends ValueDescriptorBaseTest<UmlObject, IValueDescriptor> {
	
	@Test
	def cache() {
		val testId = "cache"
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
		executeAllTransformation
		val factory = new UmlValueDescriptorFactory(transformationEngine)
		val valueDescriptor = factory.prepareValueDescriptor(umlObject)
		val cachedDescriptor = factory.getCachedValueDescriptor(umlObject)
		assertResult(valueDescriptor, cachedDescriptor)
		endTest(testId)
	}
	
	protected def IValueDescriptor getCachedValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
}