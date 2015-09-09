package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.uml2.uml.Operation
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlStaticOperationCallBuilder implements IUmlStaticOperationCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplStaticOperationCallBuilder builder
	
	private Operation operation
	private List<ValueDescriptor> params
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppStaticOperationCallBuilder(engine)
	}
	
	override build() {
		val xtOperation = mapper.convertOperation(operation)
		return (builder => [
					it.operation = xtOperation
					it.parameters = params
				]).build
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