package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation

abstract class AbstractCppOperationCallDescriptorBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	protected XtumlToOoplMapper mapper
	protected TypeConverter converter
	protected CPPOperation cppOperation
	protected List<ValueDescriptor> params
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	def prepareOperationCallDescriptor(Operation operation, ValueDescriptor... params) {
		cppOperation = mapper.convertOperation(operation)
		val returnValue = cppOperation.subElements.filter(CPPReturnValue).head
		val ocd = factory.createOperationCallDescriptor => [
			it.baseType = converter.convertToBaseType(returnValue)
			it.fullType = converter.convertToType(returnValue)
		]
		return ocd
	}
	
	def String getParameterList() '''«IF params!=null»«FOR param : params SEPARATOR ", "»«param.stringRepresentation»«ENDFOR»«ENDIF»'''
}