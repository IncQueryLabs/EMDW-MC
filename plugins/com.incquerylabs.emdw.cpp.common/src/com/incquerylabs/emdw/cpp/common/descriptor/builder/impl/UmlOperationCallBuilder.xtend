package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.DataType
import org.eclipse.uml2.uml.Operation

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
	private List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	
	
	
	new(UmlValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppOperationCallBuilder(factory.factory.factory, engine)
	}
	
	
	
	override build() {
		val xtParams = params.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		builder => [
			it.variable = variable
			it.parameters = xtParams
		]
		val dataType = operation.eContainer
		if(dataType instanceof DataType) {
			if(collections.contains(dataType.qualifiedName)) {
				return builder.setOperationName(operation.name).setCollectionType(mapper.decodeCollectionType(dataType)).build
			}
		}
		
		val xtOperation = mapper.convertOperation(operation)
		val ocd = builder.setOperation(xtOperation).build
		return ocd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		return this
	}
	
}