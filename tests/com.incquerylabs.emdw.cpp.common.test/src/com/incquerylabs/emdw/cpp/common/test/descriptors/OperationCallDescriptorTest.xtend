package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*

@SuiteClasses(#[
	OperationCallDescriptorWithoutParameterAndVoidReturnTypeTest
])
@RunWith(Suite)
class OperationCallDescriptorTestSuite {}

@RunWith(Parameterized)
class OperationCallDescriptorWithoutParameterAndVoidReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
	private Class umlClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = classDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.fullType».''', 
					descriptor.fullType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION» instead of «descriptor.stringRepresentation».''',
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION
		)
	}
	
	@Ignore("There is no caching function in Descriptor API for operation call descriptors.")
	@Test
	override cache() {
		
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(OperationCallDescriptor originalDescriptor, OperationCallDescriptor cachedDescriptor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@RunWith(Parameterized)
class OperationCallDescriptorWithoutParameterAndBoolReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Boolean"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
	private Class umlClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = classDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.fullType».''', 
					descriptor.fullType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION» instead of «descriptor.stringRepresentation».''',
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION
		)
	}
	
	@Ignore("There is no caching function in Descriptor API for operation call descriptors.")
	@Test
	override cache() {
		
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(OperationCallDescriptor originalDescriptor, OperationCallDescriptor cachedDescriptor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@RunWith(Parameterized)
class OperationCallDescriptorWithoutParameterAndBoolListReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Boolean"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
	private Class umlClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, -1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = classDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.fullType».''', 
					descriptor.fullType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION» instead of «descriptor.stringRepresentation».''',
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION
		)
	}
	
	@Ignore("There is no caching function in Descriptor API for operation call descriptors.")
	@Test
	override cache() {
		
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(OperationCallDescriptor originalDescriptor, OperationCallDescriptor cachedDescriptor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}