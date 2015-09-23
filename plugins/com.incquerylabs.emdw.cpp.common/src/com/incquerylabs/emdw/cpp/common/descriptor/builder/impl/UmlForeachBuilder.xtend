package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplForeachBuilder

class UmlForeachBuilder implements IUmlForeachBuilder {
	private IOoplForeachBuilder builder
	
	private ValueDescriptor collection
	private ValueDescriptor variable
	
	new(AdvancedIncQueryEngine engine) {
		builder = new CppForeachBuilder(engine)
	}
	
	override build() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setCollectionDescriptor(ValueDescriptor collection) {
		this.collection = collection
		return this
	}
	
	override setVariableDescriptor(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}