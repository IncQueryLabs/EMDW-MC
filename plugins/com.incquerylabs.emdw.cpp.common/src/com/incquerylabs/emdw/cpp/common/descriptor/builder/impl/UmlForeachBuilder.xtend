package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplForeachBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlForeachBuilder implements IUmlForeachBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private IOoplForeachBuilder builder
	
	private ValueDescriptor collection
	private ValueDescriptor variable
	
	new(AdvancedIncQueryEngine engine) {
		builder = new CppForeachBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		val ocd = (builder => [
					it.collectionDescriptor = collection
					it.variableDescriptor = variable
				]).build
		trace('''Finished building''')
		return ocd
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