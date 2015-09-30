package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Signal
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	SigdataDescriptorTest
])
@RunWith(Suite)
class SigdataDescriptorTestSuite {}

class SigdataDescriptorTest extends ValueDescriptorBaseTest<Signal, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SIGNAL_NAME = "TestSignal"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»::«SIGNAL_NAME»_event*'''
	private static final val EXPECTED_REPRESENTATION = '''casted_const_event'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		val sig = cl.createClassSignal => [
			it.name = SIGNAL_NAME
		]
		umlModel.createSignalEvent(sig)
		return sig
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Signal signal) {
		val descriptor = (factory.createSigdataDescriptorBuilder => [
			it.type = signal
		]).build
		return descriptor
	}
	
	override protected assertResult(Signal object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
}