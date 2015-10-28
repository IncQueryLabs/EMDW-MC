package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Parameter

class CppParameterBuilder implements IOoplParameterBuilder {
	extension Logger logger = Logger.getLogger(class)
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
		trace('''Started building''')
		val cppFormalParameter = mapper.convertParameter(parameter)
		trace('''Resolved parameter: «cppFormalParameter.cppQualifiedName»''')
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
		
		trace('''Finished building''')
		parameterDescriptor
	}
	
}