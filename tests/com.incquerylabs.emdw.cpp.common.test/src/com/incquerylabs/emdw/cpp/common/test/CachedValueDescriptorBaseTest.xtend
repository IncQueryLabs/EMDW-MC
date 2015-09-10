package com.incquerylabs.emdw.cpp.common.test

import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Element
import org.junit.Test

abstract class CachedValueDescriptorBaseTest<UmlObject extends Element, IValueDescriptor extends ValueDescriptor> extends ValueDescriptorBaseTest<UmlObject, IValueDescriptor> {
	
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
	
	protected def IValueDescriptor getCachedValueDescriptor(IUmlDescriptorFactory factory, UmlObject object)
	
	protected def void assertResult(IValueDescriptor originalDescriptor, IValueDescriptor cachedDescriptor)
}