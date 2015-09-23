package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

class CppOperationCallBuilder extends AbstractCppOperationCallDescriptorBuilder implements IOoplOperationCallBuilder {
	
	private ValueDescriptor variable
	private Object operation
	
	
	new(AdvancedIncQueryEngine engine) {
		super(engine)
	}
	
	
	override build() {
		if(operation instanceof Operation) {
			val od = prepareOperationCallDescriptor(operation, params)
			if(mapper.isHiddenByChild(operation)) {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppQualifiedName»(«parameterList»)'''
			} else {
				od.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppName»(«parameterList»)'''
			}
			return od
		} else if(operation instanceof Pair<?,?>) {
			val operation = operation as Pair<String, String>
			val sequenceImplementation = mapper.findSequenceCollectionImplementation(operation.key)
			switch(operation.value) {
				case "add": {
					val returnValue = converter.convertToType(mapper.findBasicType("bool"))
					val ocd = factory.createOperationCallDescriptor => [
						it.baseType = returnValue
						it.fullType = it.baseType
						it.stringRepresentation = '''«sequenceImplementation.generateAdd(variable.stringRepresentation, parameterList, "")»'''
					]
					return ocd
				}
			}
			return null
		}
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setOperation(Object operation) {
		this.operation = operation
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}