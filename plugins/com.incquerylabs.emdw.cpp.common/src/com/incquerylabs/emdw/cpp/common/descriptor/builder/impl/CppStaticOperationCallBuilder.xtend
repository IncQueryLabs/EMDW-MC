package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppStaticOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplStaticOperationCallBuilder {
	private Operation operation
	private String operationName
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
	}
	
	override build() {
		var OperationCallDescriptor ocd
		if(operation!=null) {
			ocd = prepareOperationCallDescriptor(operation) => [
				it.stringRepresentation = '''«cppOperation.cppQualifiedName»(«parameterString»)'''
			]
		} else {
			switch(operationName) {
				case "println": {
					ocd = createOperationCallDescriptor => [
						it.baseType = "void"
						it.fullType = it.baseType
						it.stringRepresentation = '''::std::cout«FOR param : params BEFORE " << " SEPARATOR " << "»«param.stringRepresentation»«ENDFOR» << ::std::endl'''
						it.pointerRepresentation = "// No pointer representation for println"
						it.valueRepresentation = it.stringRepresentation
					]
				}
				case "toString": {
					Preconditions.checkArgument(params.size==1, '''The toString method has one parameter but «params?.size» was caught.''')
					val stringType = mapper.findBasicType("string")
					ocd = createOperationCallDescriptor => [
						it.baseType = stringType.cppQualifiedName
						it.fullType = stringType.cppQualifiedName
						it.stringRepresentation = '''xumlrt::toString(«params.get(0).stringRepresentation»)'''
						it.pointerRepresentation = it.stringRepresentation.createStringRepresentations(stringType).pointerRepresentation
						it.valueRepresentation = it.stringRepresentation.createStringRepresentations(stringType).valueRepresentation
					]
				}
				default: {
					throw new IllegalArgumentException('''Invalid operationName: «operationName»''')
				}
			}
		}
		return ocd
	}
	
	override setOperation(Operation operation) {
		this.operation = operation
		return this
	}
	
	override setOperationName(String operationName) {
		this.operationName = operationName
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}