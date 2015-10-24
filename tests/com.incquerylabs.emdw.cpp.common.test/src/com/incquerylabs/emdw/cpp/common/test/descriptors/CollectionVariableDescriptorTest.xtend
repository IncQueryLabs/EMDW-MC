package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.CachedValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*
import org.eclipse.uml2.uml.Signal

@SuiteClasses(#[
	CollectionVariableDescriptorForExistingVariableTest,
	CollectionVariableDescriptorForNewVariableWithPredifinedNameTest,
	CollectionVariableDescriptorForNewVariableWithoutNameTest,
	CollectionVariableDescriptorForExistingSignalVariableTest,
	CollectionVariableDescriptorForNewSignalVariableWithPredifinedNameTest,
	CollectionVariableDescriptorForNewSignalVariableWithoutNameTest
])
@RunWith(Suite)
class CollectionVariableDescriptorTestSuite {}

class CollectionVariableDescriptorForExistingVariableTest extends CachedValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			it.isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForNewVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForNewVariableWithoutNameTest extends CachedValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = '''__std__set_ralf_0'''
	private String VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val svd = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
		]).build
		VARIABLE_NAME = svd.stringRepresentation
		return svd
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForExistingSignalVariableTest extends CachedValueDescriptorBaseTest<Signal, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val VARIABLE_NAME = "signalVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event* >'''
	private static final val EXPECTED_REPRESENTATION = VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		val sig = cl.createClassSignal => [
			it.name = SIGNAL_NAME
		]
		umlModel.createSignalEvent(sig)
		return sig
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			it.isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForNewSignalVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Signal, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val VARIABLE_NAME = "signalVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event* >'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		val sig = cl.createClassSignal => [
			it.name = SIGNAL_NAME
		]
		umlModel.createSignalEvent(sig)
		return sig
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForNewSignalVariableWithoutNameTest extends CachedValueDescriptorBaseTest<Signal, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event* >'''
	private static final val EXPECTED_REPRESENTATION = '''__std__set_ralf_0'''
	private String VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		val sig = cl.createClassSignal => [
			it.name = SIGNAL_NAME
		]
		umlModel.createSignalEvent(sig)
		return sig
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val svd = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
		]).build
		VARIABLE_NAME = svd.stringRepresentation
		return svd
	}
	
	override protected assertResult(Signal object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}