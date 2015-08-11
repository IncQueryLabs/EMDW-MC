package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Property

class DummyPropertyAccessBuilder implements IUmlPropertyReadBuilder{
	ValueDescriptor variable
	Property property
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		createPropertyReadDescriptor => [		
			baseType = property.type.qualifiedName
			fullType = property.type.qualifiedName
			stringRepresentation = variable.stringRepresentation+'''->'''+property.name
		]
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setProperty(Property property) {
		this.property = property
		this
	}
	
}