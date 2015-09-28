package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppStaticOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplStaticOperationCallBuilder {
	private Operation operation
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
	}
	
	override build() {
		return prepareOperationCallDescriptor(operation) => [
			it.stringRepresentation = '''«cppOperation.cppQualifiedName»(«parameterString»)'''
		]
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