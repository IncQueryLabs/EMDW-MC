package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation

class UmlOperationCallBuilder implements IUmlOperationCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplOperationCallBuilder builder
	private static final val collections = newArrayList("std::collections::set")
	
	private ValueDescriptor variable
	private Operation operation
	private List<ValueDescriptor> params
	
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppOperationCallBuilder(engine)
	}
	
	
	
	override build() {
		builder => [
			it.variable = variable
			it.parameters = params
		]
		if(collections.contains(operation.class_.qualifiedName)) {
			val collectionOperationPair = new Pair(operation.class_.qualifiedName,operation.name)
			return builder.setOperation(collectionOperationPair).build
		} else {
			val xtOperation = mapper.convertOperation(operation)
			return builder.setOperation(xtOperation).build
		}
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