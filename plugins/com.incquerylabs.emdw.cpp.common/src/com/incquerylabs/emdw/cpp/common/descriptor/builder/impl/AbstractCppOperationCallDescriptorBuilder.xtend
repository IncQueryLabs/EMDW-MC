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
import com.google.common.base.Preconditions
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter

abstract class AbstractCppOperationCallDescriptorBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	protected XtumlToOoplMapper mapper
	protected extension TypeConverter converter
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
			it.baseType = returnValue.convertToBaseType
			it.fullType = returnValue.convertToType
		]
		return ocd
	}
	
	def getParameterList() {
		val parameters = newArrayList
		val cppFormalParameters = cppOperation.subElements.filter(CPPFormalParameter)
		
		Preconditions.checkState(params.size == cppFormalParameters.size, 
		'''Invalid number of parameters provided when calling operation «cppOperation.cppName»:
				received parameters «FOR p : params SEPARATOR ','»«p.stringRepresentation»«ENDFOR»
				expected parameters «FOR p : cppFormalParameters SEPARATOR ','»«p.cppName»«ENDFOR»''')
		
		for(int i : 0..<params.size) {
			if(cppFormalParameters.get(i).isReferenceType) {
				parameters += params.get(i).pointerRepresentation
			} else {
				parameters += params.get(i).valueRepresentation
			}
		}
		
		'''«IF params!=null»«FOR param : parameters SEPARATOR ", "»«param»«ENDFOR»«ENDIF»'''
	}
}