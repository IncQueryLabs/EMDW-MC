package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	DeleteDescriptorTest
])
@RunWith(Suite)
class DeleteDescriptorTestSuite {}

class DeleteDescriptorTest extends ValueDescriptorBaseTest<Class, OperationCallDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "deletable"
	
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''delete __ralf__0__«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val umlClass = comp.createClass(CLASS_NAME)
		
		return umlClass
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class cl) {
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			it.type = cl
			it.name = VARIABLE_NAME
		]).build
		val descriptor = (factory.createDeleteBuilder => [
			it.variable = svd
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}