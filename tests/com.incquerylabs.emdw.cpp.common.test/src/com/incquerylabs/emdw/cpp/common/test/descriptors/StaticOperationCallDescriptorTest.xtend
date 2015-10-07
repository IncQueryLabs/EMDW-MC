package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Type
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*
import org.eclipse.uml2.uml.PrimitiveType

@SuiteClasses(#[
	BuiltInPrintlnTest,
	BuiltInToStringTest,
	StaticOperationCallDescriptorWithoutParameterAndVoidReturnTypeTest,
	StaticOperationCallDescriptorWithoutParameterAndBoolReturnTypeTest,
	StaticOperationCallDescriptorWithoutParameterAndBoolListReturnTypeTest,
	StaticOperationCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest,
	StaticOperationCallDescriptorWithMultpileSimpleParameterAndVoidReturnTypeTest
])
@RunWith(Suite)
class StaticOperationCallDescriptorTestSuite {}

class BuiltInPrintlnTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val OPERATION_FQN = "std::out::println"
	private static final val STRING_TYPE = "String"
	private static final val STRING_LITERAL = "Hello world!"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''::std::cout << «STRING_LITERAL» << ::std::endl'''
	private PrimitiveType stringType
	
	override protected createUmlObject(Model umlModel) {
		val op = umlModel.findOperation(OPERATION_FQN)
		stringType = umlModel.findPrimitiveType(STRING_TYPE)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val param = (factory.createLiteralDescriptorBuilder=> [
			it.literal = STRING_LITERAL
			it.type = stringType
		]).build
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
			it.parameters = param
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class BuiltInToStringTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val OPERATION_FQN = "std::boolean::toString"
	private static final val BOOLEAN_TYPE = "Boolean"
	private static final val BOOLEAN_LITERAL = "true"
	private static final val EXPECTED_TYPE = '''::std::string'''
	private static final val EXPECTED_REPRESENTATION = '''::xumlrt::to_string(«BOOLEAN_LITERAL»)'''
	private PrimitiveType boolType
	
	override protected createUmlObject(Model umlModel) {
		val op = umlModel.findOperation(OPERATION_FQN)
		boolType = umlModel.findPrimitiveType(BOOLEAN_TYPE)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val param = (factory.createLiteralDescriptorBuilder=> [
			it.literal = BOOLEAN_LITERAL
			it.type = boolType
		]).build
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
			it.parameters = param
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

abstract class AbstractStaticOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	protected static final val COMPONENT_NAME = "TestComponent"
	protected static final val CLASS_NAME = "TestClass"
	protected static final val OPERATION_NAME = "testMethod"
	
	protected static final val EXPECTED_REPRESENTATION_PREFIX = '''::«MODEL_NAME»::«COMPONENT_NAME»::«CLASS_NAME»::«OPERATION_NAME»'''
}

class StaticOperationCallDescriptorWithoutParameterAndVoidReturnTypeTest extends AbstractStaticOperationCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«EXPECTED_REPRESENTATION_PREFIX»()'''
	private Class umlClass
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation
		)
	}
}

class StaticOperationCallDescriptorWithoutParameterAndBoolReturnTypeTest extends AbstractStaticOperationCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«EXPECTED_REPRESENTATION_PREFIX»()'''
	private Class umlClass
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation
		)
	}
}

class StaticOperationCallDescriptorWithoutParameterAndBoolListReturnTypeTest extends AbstractStaticOperationCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''::std::set< bool >'''
	private static final val EXPECTED_REPRESENTATION = '''«EXPECTED_REPRESENTATION_PREFIX»()'''
	private Class umlClass
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, -1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation
		)
	}
}

class StaticOperationCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest extends AbstractStaticOperationCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER_NAME = "param"
	private static final val PARAMETER_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«EXPECTED_REPRESENTATION_PREFIX»(«PARAMETER_NAME»)'''
	private Class umlClass
	private Type parameterType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val voidPT = findPrimitiveType(umlModel, OPERATION_TYPE)
		parameterType = findPrimitiveType(umlModel, PARAMETER_TYPE)
		val returnParam = voidPT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val parameter = parameterType.createParameter(PARAMETER_NAME, ParameterDirectionKind.IN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam, parameter)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val paramDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER_NAME
			it.type = parameterType
		]).build
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
			it.parameters = paramDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation
		)
	}
}

class StaticOperationCallDescriptorWithMultpileSimpleParameterAndVoidReturnTypeTest extends AbstractStaticOperationCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER1_NAME = "param1"
	private static final val PARAMETER2_NAME = "param2"
	private static final val PARAMETER_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«EXPECTED_REPRESENTATION_PREFIX»(«PARAMETER1_NAME», «PARAMETER2_NAME»)'''
	private Class umlClass
	private Type parameterType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val voidPT = findPrimitiveType(umlModel, OPERATION_TYPE)
		parameterType = findPrimitiveType(umlModel, PARAMETER_TYPE)
		val returnParam = voidPT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val parameter1 = parameterType.createParameter(PARAMETER1_NAME, ParameterDirectionKind.IN_LITERAL, 1, 1)
		val parameter2 = parameterType.createParameter(PARAMETER2_NAME, ParameterDirectionKind.IN_LITERAL, 1, 1)
		val op = umlClass.createOperation(OPERATION_NAME, returnParam, parameter1, parameter2)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val param1Descriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER1_NAME
			it.type = parameterType
		]).build
		val param2Descriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER2_NAME
			it.type = parameterType
		]).build
		val descriptor = (factory.createStaticOperationCallBuilder => [
			it.operation = object
			it.parameters = newArrayList(param1Descriptor, param2Descriptor)
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation
		)
	}
}