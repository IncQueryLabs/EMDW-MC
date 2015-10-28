package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Parameter

class UmlParameterDescriptorBuilder implements IUmlParameterDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)

	UmlToXtumlMapper mapper
	IOoplParameterBuilder parameterBuilder
	
	Parameter parameter
	
	new(AdvancedIncQueryEngine engine) {
		this.mapper = new UmlToXtumlMapper(engine)
		this.parameterBuilder = new CppParameterBuilder(engine)
	}
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	override build() {
		trace('''Started building''')
		val xtumlParameter = mapper.convertParameter(parameter)
		trace('''Resolved parameter: «xtumlParameter.name»''')
		val descriptor = (parameterBuilder => [
			it.parameter = xtumlParameter
 		]).build
 		trace('''Finished building''')
 		return descriptor
	}
	
}