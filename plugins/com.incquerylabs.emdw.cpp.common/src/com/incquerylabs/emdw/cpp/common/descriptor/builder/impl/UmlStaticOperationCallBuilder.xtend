package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Operation

class UmlStaticOperationCallBuilder implements IUmlStaticOperationCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
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
		if(operation.qualifiedName.contains("std::out::println")) {
			return factory.createOperationCallDescriptor => [
						it.baseType = "void"
						it.fullType = "void"
						it.stringRepresentation = '''::std::cout«FOR param : params BEFORE " << " SEPARATOR " << "»«param.stringRepresentation»«ENDFOR» << ::std::endl'''
					]
		}
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