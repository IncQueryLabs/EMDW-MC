package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyWriteBuilder extends IModelAccessBuilder {
	override PropertyWriteDescriptor build()
	
	def IUmlPropertyWriteBuilder setVariable(ValueDescriptor variable)
	
	def IUmlPropertyWriteBuilder setProperty(Property property)
	
	def IUmlPropertyWriteBuilder setNewValue(ValueDescriptor newValue)
}