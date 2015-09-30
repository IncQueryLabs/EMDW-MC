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

@SuiteClasses(#[
	SingleVariableDescriptorForExistingVariableTest,
	SingleVariableDescriptorForNewVariableWithPredifinedNameTest,
	SingleVariableDescriptorForNewVariableWithoutNameTest
])
@RunWith(Suite)
class SingleVariableDescriptorTestSuite {}

class SingleVariableDescriptorForExistingVariableTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	private static final String VARIABLE_NAME = "classVariable"
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent("TestComponent")
		val cl = comp.createClass("TestClass")
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
		assertTrue('''Descriptor's value type should be ::test::TestComponent::TestClass* instead of «descriptor.baseType».''', 
					descriptor.baseType=="::test::TestComponent::TestClass*")
		assertTrue('''Descriptor's string representation should be classVariable.''', 
					descriptor.stringRepresentation=="classVariable")
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
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

class SingleVariableDescriptorForNewVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''__ralf__0__«VARIABLE_NAME»'''
	
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
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.baseType».''', 
					descriptor.baseType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION».''', 
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION)
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
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

class SingleVariableDescriptorForNewVariableWithoutNameTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''__ralf__0__«CLASS_NAME»'''
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
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.baseType».''', 
					descriptor.baseType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION».''', 
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION)
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
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}