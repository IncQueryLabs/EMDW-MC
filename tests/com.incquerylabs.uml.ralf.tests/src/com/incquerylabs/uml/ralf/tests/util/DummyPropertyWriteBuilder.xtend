package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Property

class DummyPropertyWriteBuilder implements IUmlPropertyWriteBuilder{
	ValueDescriptor variable
	Property property
	ValueDescriptor newValue
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		createPropertyWriteDescriptor => [		
			baseType = property.type.qualifiedName
			fullType = property.type.qualifiedName
			stringRepresentation = variable.stringRepresentation+'''->'''+property.name+''' = '''+newValue.stringRepresentation
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
	
	override setNewValue(ValueDescriptor newValue) {
		this.newValue = newValue
		this
	}
	
}