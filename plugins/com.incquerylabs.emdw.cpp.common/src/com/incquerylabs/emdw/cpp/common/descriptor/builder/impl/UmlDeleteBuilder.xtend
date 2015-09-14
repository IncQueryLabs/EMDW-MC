package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlDeleteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplDeleteBuilder

class UmlDeleteBuilder implements IUmlDeleteBuilder {
	ValueDescriptor variable
	IOoplDeleteBuilder builder
	
	new() {
		builder = new CppDeleteBuilder
	}
	
	override build() {
		return (builder => [
					it.variable = variable
				]).build
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}