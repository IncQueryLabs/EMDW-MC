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
import org.eclipse.uml2.uml.Signal
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor

@SuiteClasses(#[
	ConstructorCallDescriptorForEventTest,
	ConstructorCallDescriptorWithoutParameterAndVoidReturnTypeTest,
	ConstructorCallDescriptorWithoutParameterAndBoolReturnTypeTest,
	ConstructorCallDescriptorWithoutParameterAndBoolListReturnTypeTest,
	ConstructorCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest,
	ConstructorCallDescriptorWithMultpileSimpleParameterAndVoidReturnTypeTest
])
@RunWith(Suite)
class ConstructorCallDescriptorTestSuite {}

class ConstructorCallDescriptorForEventTest extends ValueDescriptorBaseTest<Signal, OperationCallDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	
	private static final val CPP_SIGNAL_FQN = '''::«MODEL_NAME»::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event'''
	private static final val EXPECTED_TYPE = '''«CPP_SIGNAL_FQN»*'''
	private static final val EXPECTED_REPRESENTATION = '''new «CPP_SIGNAL_FQN»()'''
	private Class umlClass
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		val sig = umlClass.createClassSignal => [
			it.name = SIGNAL_NAME
		]
		umlModel.createSignalEvent(sig)
		return sig
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal object) {
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

abstract class AbstractConstructorCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	protected static final val COMPONENT_NAME = "TestComponent"
	protected static final val CLASS_NAME = "TestClass"
	protected static final val OPERATION_NAME = "TestClass"
	
	protected static final val EXPECTED_TYPE = '''::«MODEL_NAME»::«COMPONENT_NAME»::«CLASS_NAME»*'''
	protected static final val EXPECTED_REPRESENTATION_PREFIX = '''new ::«MODEL_NAME»::«COMPONENT_NAME»::«CLASS_NAME»'''
}

class ConstructorCallDescriptorWithoutParameterAndVoidReturnTypeTest extends AbstractConstructorCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
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
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object.owner as Type
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
}

class ConstructorCallDescriptorWithoutParameterAndBoolReturnTypeTest extends AbstractConstructorCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
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
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object.owner as Type
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
}

class ConstructorCallDescriptorWithoutParameterAndBoolListReturnTypeTest extends AbstractConstructorCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
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
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object.owner as Type
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
}

class ConstructorCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest extends AbstractConstructorCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER_NAME = "param"
	private static final val PARAMETER_TYPE = "Boolean"
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
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object.owner as Type
			it.parameters = new UmlTypedValueDescriptor(parameterType, paramDescriptor)
			it.operation = object
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
}

class ConstructorCallDescriptorWithMultpileSimpleParameterAndVoidReturnTypeTest extends AbstractConstructorCallDescriptorTest {
	
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER1_NAME = "param1"
	private static final val PARAMETER2_NAME = "param2"
	private static final val PARAMETER_TYPE = "Boolean"
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
		val descriptor = (factory.createConstructorCallBuilder => [
			it.type = object.owner as Type
			it.setParameters(new UmlTypedValueDescriptor(parameterType, param1Descriptor), new UmlTypedValueDescriptor(parameterType, param2Descriptor))
			it.operation = object
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
}