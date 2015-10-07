package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CopyConstructorCallTest
])
@RunWith(Suite)
class CopyConstructorCallDescriptorTestSuite {}

class CopyConstructorCallTest extends ValueDescriptorBaseTest<Signal, OperationCallDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val SIGNAL_VARIABLE_NAME = "casted_const_event"
	
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event*'''
	private static final val EXPECTED_REPRESENTATION = '''«SIGNAL_VARIABLE_NAME»->clone()'''
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
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal signal) {
		val sigDescriptor = (factory.createSigdataDescriptorBuilder => [
			it.type = signal
		]).build
		val descriptor = (factory.createCopyConstructorCallBuilder => [
			it.type = signal
			it.parameter = sigDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}