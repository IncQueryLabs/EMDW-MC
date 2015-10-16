package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	OperationCallDescriptorWithoutParameterAndVoidReturnTypeTest,
	OperationCallDescriptorWithoutParameterAndBoolReturnTypeTest,
	OperationCallDescriptorWithoutParameterAndBoolListReturnTypeTest,
	OperationCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest,
	OperationCallDescriptorWithMultipleSimpleParameterAndVoidReturnTypeTest,
	HiddenOperationCallDescriptorTest,
	CollectionAddOperationCallDescriptorTest,
	CollectionAddAllOperationCallDescriptorTest,
	CollectionGetOperationCallDescriptorTest,
	CollectionIsEmptyOperationCallDescriptorTest,
	CollectionSizeOperationCallDescriptorTest
])
@RunWith(Suite)
class OperationCallDescriptorTestSuite {}

class OperationCallDescriptorWithoutParameterAndVoidReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
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
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class OperationCallDescriptorWithoutParameterAndBoolReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Boolean"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
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
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class OperationCallDescriptorWithoutParameterAndBoolListReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Boolean"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::std::set< bool >'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»()'''
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
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class OperationCallDescriptorWithSingleSimpleParameterAndVoidReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val PARAMETER_NAME = "param"
	private static final val PARAMETER_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»(«PARAMETER_NAME»)'''
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
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val paramDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER_NAME
			it.type = parameterType
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = classDescriptor
			it.parameters = new UmlTypedValueDescriptor(parameterType, paramDescriptor)
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class OperationCallDescriptorWithMultipleSimpleParameterAndVoidReturnTypeTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val PARAMETER1_NAME = "param1"
	private static final val PARAMETER2_NAME = "param2"
	private static final val PARAMETER_TYPE = "Boolean"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«OPERATION_NAME»(«PARAMETER1_NAME», «PARAMETER2_NAME»)'''
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
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
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
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = classDescriptor
			it.parameters = newArrayList(param1Descriptor, param2Descriptor).map[new UmlTypedValueDescriptor(parameterType, it)]
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class HiddenOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val SUPER_NAME = "SuperClass"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER_NAME = "param"
	private static final val PARAMETER_TYPE = "Boolean"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->::test::«COMPONENT_NAME»::«SUPER_NAME»::«OPERATION_NAME»()'''
	private Class umlClass
	private Type parameterType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val superClass = comp.createClass(SUPER_NAME)
		val pT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val returnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val op = superClass.createOperation(OPERATION_NAME, returnParam)
		umlClass = comp.createClass(CLASS_NAME)
		umlClass.createGeneralization(superClass)
		val subReturnParam = pT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		parameterType = findPrimitiveType(umlModel, PARAMETER_TYPE)
		val parameter = parameterType.createParameter(PARAMETER_NAME, ParameterDirectionKind.IN_LITERAL, 1, 1)
		umlClass.createOperation(OPERATION_NAME, subReturnParam, parameter)
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
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class CollectionAddOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val OPERATION_NAME = '''add'''
	private static final val OPERATION_FQN = '''«COLLECTION_TYPE»::«OPERATION_NAME»'''
	private static final val VARIABLE_NAME = "collectionVariable"
	private static final val PARAMETER1_NAME = "param1"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = 
		'''
		::std::pair< ::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»*>::iterator, bool> result = «VARIABLE_NAME».insert(«PARAMETER1_NAME»);
		result.second'''
	private Class umlClass
	private Type collectionType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		collectionType = umlModel.findCollectionType(COLLECTION_TYPE)
		val op = umlModel.findOperation(OPERATION_FQN)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val collectionDescriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val param1Descriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER1_NAME
			it.type = umlClass
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = collectionDescriptor
			it.parameters = new UmlTypedValueDescriptor(umlClass, param1Descriptor)
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class CollectionAddAllOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val OPERATION_NAME = '''addAll'''
	private static final val OPERATION_FQN = '''«COLLECTION_TYPE»::«OPERATION_NAME»'''
	private static final val VARIABLE_NAME = "collectionVariable"
	private static final val PARAMETER_NAME = "param1"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = 
		'''
		«VARIABLE_NAME».insert(«PARAMETER_NAME».begin(), «PARAMETER_NAME».end())'''
	private Class umlClass
	private Type collectionType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		collectionType = umlModel.findCollectionType(COLLECTION_TYPE)
		val op = umlModel.findOperation(OPERATION_FQN)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val collectionDescriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val param1Descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = PARAMETER_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = collectionDescriptor
			it.parameters = new UmlTypedValueDescriptor(collectionType, param1Descriptor) 
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class CollectionGetOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val INTEGER_TYPE = "Integer"
	private static final val INTEGER_LITERAL = "0"
	private static final val COLLECTION_TYPE = "std::collections::Sequence"
	private static final val OPERATION_NAME = '''get'''
	private static final val OPERATION_FQN = '''«COLLECTION_TYPE»::«OPERATION_NAME»'''
	private static final val VARIABLE_NAME = "collectionVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = 
		'''
		collectionVariable[0]'''
	private Class umlClass
	private Type collectionType
	private PrimitiveType intType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		collectionType = umlModel.findCollectionType(COLLECTION_TYPE)
		intType = umlModel.findPrimitiveType(INTEGER_TYPE)
		val op = umlModel.findOperation(OPERATION_FQN)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val collectionDescriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val paramDescriptor = (factory.createLiteralDescriptorBuilder => [
			it.type = intType
			it.literal = INTEGER_LITERAL
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = collectionDescriptor
			it.parameters = new UmlTypedValueDescriptor(intType, paramDescriptor)
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class CollectionIsEmptyOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val OPERATION_NAME = '''isEmpty'''
	private static final val OPERATION_FQN = '''std::collections::Collection::«OPERATION_NAME»'''
	private static final val VARIABLE_NAME = "collectionVariable"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = 
		'''
		«VARIABLE_NAME».empty()'''
	private Class umlClass
	private Type collectionType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		collectionType = umlModel.findCollectionType(COLLECTION_TYPE)
		val op = umlModel.findOperation(OPERATION_FQN)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val collectionDescriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = collectionDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class CollectionSizeOperationCallDescriptorTest extends ValueDescriptorBaseTest<Operation, OperationCallDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val OPERATION_NAME = '''size'''
	private static final val OPERATION_FQN = '''std::collections::Collection::«OPERATION_NAME»'''
	private static final val VARIABLE_NAME = "collectionVariable"
	private static final val EXPECTED_TYPE = '''long'''
	private static final val EXPECTED_REPRESENTATION = 
		'''
		«VARIABLE_NAME».size()'''
	private Class umlClass
	private Type collectionType
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		collectionType = umlModel.findCollectionType(COLLECTION_TYPE)
		val op = umlModel.findOperation(OPERATION_FQN)
		return op
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Operation object) {
		val collectionDescriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.elementType = umlClass
			it.collectionType = collectionType
		]).build
		val descriptor = (factory.createOperationCallBuilder => [
			it.operation = object
			it.variable = collectionDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Operation object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}