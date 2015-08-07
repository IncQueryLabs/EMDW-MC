package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplOperationCallBuilder
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlOperationCallBuilder implements IUmlOperationCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplOperationCallBuilder builder
	
	private ValueDescriptor variable
	private Operation operation
	private List<ValueDescriptor> params
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppOperationCallBuilder(engine)
	}
	
	
	
	override build() {
		val xtOperation = mapper.convertOperation(operation)
		return (builder => [
					it.variable = variable
					it.operation = xtOperation
					it.parameters = params
				]).build
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