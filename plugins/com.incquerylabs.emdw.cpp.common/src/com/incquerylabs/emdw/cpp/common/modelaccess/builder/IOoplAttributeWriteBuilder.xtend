package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

interface IOoplAttributeWriteBuilder extends IModelAccessBuilder {
	override PropertyWriteDescriptor build()
	
	def IOoplAttributeWriteBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAttributeWriteBuilder setAttribute(Attribute attribute)
	
	def IOoplAttributeWriteBuilder setNewValue(ValueDescriptor newValue)
}