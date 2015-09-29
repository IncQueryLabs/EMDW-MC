package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence

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
		
		val variableRepresentations = name.createStringRepresentations(cppFormalParameter)
		
		val parameterDescriptor = factory.createParameterDescriptor => [
			it.stringRepresentation = name
			it.baseType = type.convertToBaseType
			it.fullType = type.convertToType
			it.valueRepresentation = variableRepresentations.valueRepresentation
			it.pointerRepresentation = variableRepresentations.pointerRepresentation
		]
		
		if(type instanceof OOPLClassReferenceCollection) {
			parameterDescriptor.templateTypes.add(type.ooplClass.convertToType)
		}
		else if(type instanceof CPPSequence) {
			parameterDescriptor.templateTypes.add(type.elementType.convertToType)
		}
		
		parameterDescriptor
	}
	
}