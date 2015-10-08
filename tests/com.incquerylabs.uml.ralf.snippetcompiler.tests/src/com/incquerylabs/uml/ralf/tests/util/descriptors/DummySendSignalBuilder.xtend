package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory

class DummySendSignalBuilder implements IUmlSendSignalBuilder{
	ValueDescriptor variable
	ValueDescriptor signal
	boolean isContextStatic
	
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descriptor = createOperationCallDescriptor => [
			baseType = variable.baseType
			stringRepresentation = '''«variable.stringRepresentation»->generate_event(«signal.stringRepresentation», «IF isContextStatic»nullptr«ELSE»this«ENDIF»)'''
		]
		descriptor
	}
		
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setSignal(ValueDescriptor signal) {
		this.signal = signal
		this
	}
	
	override setIsContextStatic(boolean isContextStatic) {
		this.isContextStatic = isContextStatic
		this
	}
	
}