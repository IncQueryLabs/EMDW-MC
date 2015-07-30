package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static extension com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*
import static org.junit.Assert.*
import org.junit.runners.Suite.SuiteClasses
import org.junit.runners.Suite

@SuiteClasses(#[
	SingleValueDescriptorForNewVariableWithPredifinedNameTest,
	SingleValueDescriptorForNewVariableWithoutNameTest
])
@RunWith(Suite)
class SingleValueDescriptorForNewVariableTestSuite {}

@RunWith(Parameterized)
class SingleValueDescriptorForNewVariableWithPredifinedNameTest extends ValueDescriptorBaseTest<Class, SingleValueDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»'''
	private static final val EXPECTED_REPRESENTATION = '''__ralf__0__«VARIABLE_NAME»'''
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Class element) {
		return factory.prepareSingleValueDescriptorForNewLocalVariable(element, VARIABLE_NAME)
	}
	
	override protected assertResult(Class object, SingleValueDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.valueType».''', 
					descriptor.valueType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION».''', 
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION)
	}
	
}

@RunWith(Parameterized)
class SingleValueDescriptorForNewVariableWithoutNameTest extends ValueDescriptorBaseTest<Class, SingleValueDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»'''
	private static final val EXPECTED_REPRESENTATION = '''__ralf__0__«CLASS_NAME»'''
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Class element) {
		return factory.prepareSingleValueDescriptorForNewLocalVariable(element)
	}
	
	override protected assertResult(Class object, SingleValueDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.valueType».''', 
					descriptor.valueType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION».''', 
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION)
	}
	
}