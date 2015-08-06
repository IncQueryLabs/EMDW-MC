package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyAccessDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyAccessBuilder extends IModelAccessBuilder {
	override PropertyAccessDescriptor build()
	
	def IUmlPropertyAccessBuilder setVariable(ValueDescriptor variable)
	
	def IUmlPropertyAccessBuilder setProperty(Property property)
}