package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Type
import com.google.common.base.Optional

class UmlCollectionOperationCallBuilder implements IUmlCollectionOperationCallBuilder {

	UmlToXtumlMapper mapper

	ValueDescriptor variable
	Operation operation
	List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params
	Type elementType

	IOoplCollectionOperationCallBuilder builder

	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCollectionOperationCallBuilder(engine)
	}

	override build() {
		val returnParameter = Optional::fromNullable(operation.ownedParameters.findFirst[direction == ParameterDirectionKind.RETURN_LITERAL])
		val xtParams = params.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		val xtReturnType = returnParameter.transform[
			// if the return value's type cannot be mapped, it means the return value is an element from the collection
			mapper.convertType(type) ?: mapper.convertType(elementType) 
		]
		return (builder => [
			it.operationName = operation.name
			it.variable = variable
			it.parameters = xtParams
			it.operationReturnType = xtReturnType.or[
				mapper.findXtPrimitiveType("Void")
			]
		]).build
	}

	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}

	override setOperation(Operation operation) {
		this.operation = operation
		this
	}

	override setParameters(UmlTypedValueDescriptor<? extends ValueDescriptor>... params) {
		this.params = params
		this
	}

	override setCollectionElementType(Type elementType) {
		this.elementType = elementType
		this
	}

}