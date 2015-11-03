package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class UmlSigdataDescriptorBuilder implements IUmlSigdataDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private static final String name = "casted_const_event"
	private Type type
	private UmlValueDescriptorFactory factory
	
	new(UmlValueDescriptorFactory factory) {
		this.factory = factory
	}
	
	override build() {
		checkArgument(type!=null, "Type cannot be null")
		trace('''Started building''')
		val svd = factory.prepareSingleVariableDescriptorForExistingVariable(type, name)
		trace('''Finished building''')
		return svd
	}
	
	override IUmlSigdataDescriptorBuilder setType(Type type) {
		this.type = type
		return this
	}
}