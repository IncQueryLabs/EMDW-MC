package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.VariableDescriptor
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Type
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	ClassCastDescriptorTest,
	PrimitiveTypeCastDescriptorTest
])
@RunWith(Suite)
class CastDescriptorTestSuite {}

class ClassCastDescriptorTest extends ValueDescriptorBaseTest<Type, VariableDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''dynamic_cast<«EXPECTED_TYPE»>(«VARIABLE_NAME»)'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Type type) {
		val variableDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.type = type
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
		]).build
		val castDescriptor = (factory.createCastDescriptorBuilder => [
			it.descriptor = variableDescriptor
			it.castingType = type
		]).build
		return castDescriptor
	}
	
	override protected assertResult(Type object, VariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
}

class PrimitiveTypeCastDescriptorTest extends ValueDescriptorBaseTest<Type, VariableDescriptor> {
	private static final val VARIABLE_NAME = "classVariable"
	private static final val VARIABLE_TYPE = "Real"
	private static final val EXPECTED_TYPE = '''double'''
	private static final val EXPECTED_REPRESENTATION = '''(«EXPECTED_TYPE»)«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val pT = umlModel.findPrimitiveType(VARIABLE_TYPE)
		return pT
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Type type) {
		val variableDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.type = type
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
		]).build
		val castDescriptor = (factory.createCastDescriptorBuilder => [
			it.descriptor = variableDescriptor
			it.castingType = type
		]).build
		return castDescriptor
	}
	
	override protected assertResult(Type object, VariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
}