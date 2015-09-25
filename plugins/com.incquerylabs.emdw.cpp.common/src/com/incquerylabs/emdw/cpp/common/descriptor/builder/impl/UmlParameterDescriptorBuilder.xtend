package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplParameterBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Parameter

class UmlParameterDescriptorBuilder implements IUmlParameterDescriptorBuilder {
	
	IOoplParameterBuilder parameterBuilder
	Parameter parameter
	
	new(AdvancedIncQueryEngine engine) {
		this.parameterBuilder = new CppParameterBuilder(engine)
	}
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	override build() {
		
	}
	
}