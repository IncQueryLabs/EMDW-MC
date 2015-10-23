package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.CachedValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.PrimitiveType

@SuiteClasses(#[
	SingleVariableDescriptorForExistingVariableTest,
	SingleVariableDescriptorForNewVariableWithPredifinedNameTest,
	SingleVariableDescriptorForNewClassVariableWithPredifinedNameAndInitializationTest,
	SingleVariableDescriptorForNewPrimitiveTypeVariableWithPredifinedNameAndInitializationTest,
	SingleVariableDescriptorForNewVariableWithoutNameTest,
	SingleVariableDescriptorForExistingSignalVariableTest,
	SingleVariableDescriptorForNewSignalVariableWithPredifinedNameTest,
	SingleVariableDescriptorForNewSignalVariableWithoutNameTest
])
@RunWith(Suite)
class SingleVariableDescriptorTestSuite {}

class SingleVariableDescriptorForExistingVariableTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final String VARIABLE_NAME = "classVariable"
	private static final String EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(VARIABLE_NAME, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val chachedDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return chachedDescriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class SingleVariableDescriptorForNewVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class SingleVariableDescriptorForNewClassVariableWithPredifinedNameAndInitializationTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME» = nullptr'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			name = VARIABLE_NAME
			initialize = true
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertNotEquals(originalDescriptor, cachedDescriptor)
		assertEquals(originalDescriptor.baseType, cachedDescriptor.baseType)
		assertEquals(originalDescriptor.pointerRepresentation, cachedDescriptor.stringRepresentation)
	}
	
}

class SingleVariableDescriptorForNewPrimitiveTypeVariableWithPredifinedNameAndInitializationTest extends CachedValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	
	private static final val VARIABLE_NAME = "primitiveTypeVariable"
	private static final val PRIMITIVE_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME» = false'''
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, PRIMITIVE_TYPE)
		return pT
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			name = VARIABLE_NAME
			initialize = true
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertNotEquals(originalDescriptor, cachedDescriptor)
		assertEquals(originalDescriptor.baseType, cachedDescriptor.baseType)
		assertEquals(originalDescriptor.valueRepresentation, cachedDescriptor.stringRepresentation)
	}
	
}

class SingleVariableDescriptorForNewVariableWithoutNameTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''«CLASS_NAME»__ralf__0__'''
	private String VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			type = element
		]).build
		VARIABLE_NAME = svd.stringRepresentation
		return svd
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class SingleVariableDescriptorForExistingSignalVariableTest extends CachedValueDescriptorBaseTest<Signal, SingleVariableDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final String VARIABLE_NAME = "signalVariable"
	private static final String EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event*'''
	private static final String EXPECTED_REPRESENTATION = VARIABLE_NAME
	
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
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val chachedDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return chachedDescriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class SingleVariableDescriptorForNewSignalVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Signal, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val VARIABLE_NAME = "signalVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event*'''
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
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class SingleVariableDescriptorForNewSignalVariableWithoutNameTest extends CachedValueDescriptorBaseTest<Signal, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event*'''
	private static final val EXPECTED_REPRESENTATION = '''«SIGNAL_NAME»__ralf__0__'''
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
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			type = element
		]).build
		VARIABLE_NAME = svd.stringRepresentation
		return svd
	}
	
	override protected assertResult(Signal object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Signal element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}