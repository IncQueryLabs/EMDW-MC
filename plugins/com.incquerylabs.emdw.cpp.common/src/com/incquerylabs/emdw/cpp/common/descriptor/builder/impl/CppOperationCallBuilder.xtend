package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplOperationCallBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import java.util.List
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence

class CppOperationCallBuilder implements IOoplOperationCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor variable
	private Operation operation
	private List<ValueDescriptor> params
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	
	override build() {
		val cppOperation = mapper.convertOperation(operation)
		val retType = cppOperation.subElements.filter(CPPReturnValue).head
		var baseType = retType.type
		if(baseType instanceof CPPSequence) {
			baseType = baseType.elementType
		}
		val baseTypeFinal = baseType
		val ocd = factory.createOperationCallDescriptor => [
			it.baseType = converter.convertType(baseTypeFinal)
			it.fullType = converter.convertType(retType)
			it.stringRepresentation = '''«variable.stringRepresentation»->«cppOperation.cppName»(«IF params!=null»«FOR param : params SEPARATOR ", "»«param.stringRepresentation»«ENDFOR»«ENDIF»)'''
		]
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
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}