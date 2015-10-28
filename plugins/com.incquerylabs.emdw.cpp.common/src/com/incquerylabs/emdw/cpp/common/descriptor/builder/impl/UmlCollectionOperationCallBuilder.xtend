package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.google.common.base.Optional
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.util.UmlTypedValueDescriptor
import com.incquerylabs.emdw.cpp.common.util.XtTypedValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Type

class UmlCollectionOperationCallBuilder implements IUmlCollectionOperationCallBuilder {
	extension Logger logger = Logger.getLogger(class)

	UmlToXtumlMapper mapper

	ValueDescriptor variable
	Operation operation
	List<UmlTypedValueDescriptor<? extends ValueDescriptor>> params  = #[]
	Type elementType

	IOoplCollectionOperationCallBuilder builder

	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppCollectionOperationCallBuilder(engine)
	}

	override build() {
		trace('''Started building''')
		val returnParameter = Optional::fromNullable(operation.ownedParameters.findFirst[direction == ParameterDirectionKind.RETURN_LITERAL])
		val xtParams = params.map[new XtTypedValueDescriptor(mapper.convertType(type), descriptor)]
		val xtReturnType = returnParameter.transform[
			// if the return value's type cannot be mapped, it means the return value is an element from the collection
			mapper.convertType(type) ?: mapper.convertType(elementType) 
		]
		val ocd = (builder => [
			it.operationName = operation.name
			it.variable = variable
			it.parameters = xtParams
			it.operationReturnType = xtReturnType.or[
				mapper.findXtPrimitiveType("Void")
			]
		]).build
		trace('''Finished building''')
		return ocd
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