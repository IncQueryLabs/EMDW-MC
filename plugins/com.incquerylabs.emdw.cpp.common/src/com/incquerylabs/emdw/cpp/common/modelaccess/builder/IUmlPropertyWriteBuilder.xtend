package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyWriteBuilder extends IModelAccessBuilder {
	override String build()
	
	def IUmlPropertyWriteBuilder setVariable(SingleValueDescriptor variable)
	
	def IUmlPropertyWriteBuilder setProperty(Property property)
	
	def IUmlPropertyWriteBuilder setNewValue(SingleValueDescriptor newValue)
}