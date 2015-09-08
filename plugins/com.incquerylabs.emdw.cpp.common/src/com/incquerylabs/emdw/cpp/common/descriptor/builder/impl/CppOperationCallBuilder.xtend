package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppOperationCallBuilder implements IOoplOperationCallBuilder {
	private CppOperationDescriptorUtil util
	
	private ValueDescriptor variable
	private Operation operation
	private List<ValueDescriptor> params
	
	
	new(AdvancedIncQueryEngine engine) {
		util = new CppOperationDescriptorUtil(engine)
	}
	
	
	override build() {
		return util.build('''«variable.stringRepresentation»->''', operation, params)
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}