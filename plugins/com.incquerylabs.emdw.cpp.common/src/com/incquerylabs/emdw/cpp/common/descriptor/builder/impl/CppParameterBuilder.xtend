package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Parameter

class CppParameterBuilder implements IOoplParameterBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	extension TypeConverter typeConverter
	
	Parameter parameter
	XtumlToOoplMapper mapper
	
	new(AdvancedIncQueryEngine engine) {
		this.mapper = new XtumlToOoplMapper(engine)
		this.typeConverter = new TypeConverter
	}
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	override build() {
		val cppFormalParameter = mapper.convertParameter(parameter)
		val type = cppFormalParameter.type
		val name = cppFormalParameter.cppName
		
		val variableRepresentations = name.createStringRepresentations(type)
		
		factory.createParameterDescriptor => [
			it.stringRepresentation = name
			it.baseType = type.convertToType 
			it.fullType = it.baseType
			it.valueRepresentation = variableRepresentations.valueRepresentation
			it.pointerRepresentation = variableRepresentations.pointerRepresentation
		]
	}
	
}