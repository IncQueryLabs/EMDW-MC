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
	
	def prepareOperationCallDescriptor(Operation operation) {
		prepareOperationCallDescriptor(operation, true)
	}
	
	def prepareOperationCallDescriptor(Operation operation, boolean calculateTypes) {
		cppOperation = mapper.convertOperation(operation)
		val ocd = factory.createOperationCallDescriptor => [
			if(calculateTypes) {
				val returnValue = cppOperation.subElements.filter(CPPReturnValue).head
				it.baseType = returnValue.convertToBaseType
				it.fullType = returnValue.convertToType
			}
		]
		return ocd
	}
	
	def String getParameterList() {
		val parameterDescriptors = if(params != null) params else #[]
		
		if(cppOperation != null){
			val parameterStrings = newArrayList
			val cppFormalParameters = cppOperation.subElements.filter(CPPFormalParameter)
			Preconditions.checkState(parameterDescriptors.size == cppFormalParameters.size, 
			'''Invalid number of parameters provided when calling operation «cppOperation.cppName»:
					received parameters «FOR p : parameterDescriptors SEPARATOR ','»«p.stringRepresentation» : «p.fullType»«ENDFOR»
					expected parameters «FOR p : cppFormalParameters SEPARATOR ','»«p.cppName» : «p.type.convertToType»«ENDFOR»''')
			for(int i : 0..<parameterDescriptors.size) {
				if(cppFormalParameters.get(i).isReferenceType) {
					parameterStrings += params.get(i).pointerRepresentation
				} else {
					parameterStrings += params.get(i).valueRepresentation
				}
			}
			
			'''«FOR param : parameterStrings SEPARATOR ", "»«param»«ENDFOR»'''
		} else {
			'''«FOR param : parameterDescriptors SEPARATOR ", "»«param.stringRepresentation»«ENDFOR»'''
		}
		
	}
}