package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.google.common.base.Preconditions
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Parameter

class DummyParameterBuilder implements IUmlParameterDescriptorBuilder {
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	Parameter parameter
	DummyUmlValueDescriptorFactory descFactory
	
	override setParameter(Parameter parameter) {
		this.parameter = parameter
		this
	}
	
	def setDescFactory(DummyUmlValueDescriptorFactory descFactory) {
		this.descFactory = descFactory
		this
	}
	
	override build() {
		Preconditions.checkArgument(parameter != null, "Parameter cannot be null.")
		
		val desc = factory.createParameterDescriptor => [
			it.stringRepresentation = parameter.name
			it.baseType = parameter.type.qualifiedName
			it.fullType= parameter.type.qualifiedName
		]
		descFactory.cache.add(desc)
		desc
	}
	
}