package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.DataType

class UmlOperationCallBuilder implements IUmlOperationCallBuilder {
	private UmlToXtumlMapper mapper
	private IOoplOperationCallBuilder builder
	private static final val collections = newArrayList(
		"std::collections::Set",
		"std::collections::Sequence",
		"std::collections::Bag",
		"std::collections::Collection")
	
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
		val dataType = operation.eContainer
		if(dataType instanceof DataType) {
			if(collections.contains(dataType.qualifiedName)) {
				return builder.setOperationName(operation.name).setCollectionType(mapper.decodeCollectionType(dataType)).build
			}
		}
		
		val xtOperation = mapper.convertOperation(operation)
		return builder.setOperation(xtOperation).build
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