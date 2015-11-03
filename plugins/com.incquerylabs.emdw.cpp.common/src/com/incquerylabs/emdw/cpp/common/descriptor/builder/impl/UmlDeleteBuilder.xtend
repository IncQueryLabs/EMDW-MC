package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplDeleteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlDeleteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger

class UmlDeleteBuilder implements IUmlDeleteBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	ValueDescriptor variable
	IOoplDeleteBuilder builder
	
	new() {
		builder = new CppDeleteBuilder
	}
	
	override build() {
		trace('''Started building''')
		val ocd = (builder => [
					it.variable = variable
				]).build
		trace('''Finished building''')
		return ocd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}