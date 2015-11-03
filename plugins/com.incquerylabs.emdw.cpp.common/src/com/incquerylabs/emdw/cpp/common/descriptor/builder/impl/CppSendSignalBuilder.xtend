package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplSendSignalBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger

class CppSendSignalBuilder implements IOoplSendSignalBuilder {
	extension Logger logger = Logger.getLogger(class)
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	ValueDescriptor variable
	ValueDescriptor signal
	boolean isInternal
	
	override build() {
		trace('''Started building''')
		val ocd = factory.createOperationCallDescriptor => [
					it.baseType = "void"
					it.fullType = "void"
					it.stringRepresentation = '''«variable.stringRepresentation»->generate_«IF isInternal»internal«ELSE»external«ENDIF»_event(«signal.stringRepresentation»)'''
				]
		trace('''Finished building''')
		return ocd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setSignal(ValueDescriptor signal) {
		this.signal = signal
		return this
	}
	
	override setIsInternal(boolean isInternal) {
		this.isInternal = isInternal
		this
	}
}