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
		val ooplType = cppFormalParameter.type		
		val type = ooplType.convertToType
		val name = cppFormalParameter.cppName
		
		var String valueRepresentation
		var String pointerRepresentation
		
		if(ooplType.isReferenceType) {
			valueRepresentation = '''*«name»'''
			pointerRepresentation = name
		} else {
			valueRepresentation = name
			pointerRepresentation = '''&«name»'''
		}
		
		val finalValueRepresentation = valueRepresentation
		val finalPointerRepresentation = pointerRepresentation
		
		factory.createSingleVariableDescriptor => [
			it.stringRepresentation = name
			it.baseType = type 
			it.fullType = type
			it.valueRepresentation = finalValueRepresentation
			it.pointerRepresentation = finalPointerRepresentation
		]
	}
	
}