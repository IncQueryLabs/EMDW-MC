package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplSendSignalBuilder

class UmlSendSignalBuilder implements IUmlSendSignalBuilder {
	ValueDescriptor variable
	ValueDescriptor signal
	boolean isContextStatic
	IOoplSendSignalBuilder builder
	
	new() {
		builder = new CppSendSignalBuilder
	}
	
	override build() {
		return (builder => [
					it.variable = variable
					it.signal = signal
					it.isContextStatic = isContextStatic
				]).build
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setSignal(ValueDescriptor signal) {
		this.signal = signal
		return this
	}
	
	override setIsContextStatic(boolean isContextStatic) {
		this.isContextStatic = isContextStatic
		this
	}
	
}