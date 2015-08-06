package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyAccessDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

interface IOoplAttributeAccessBuilder extends IModelAccessBuilder {
	override PropertyAccessDescriptor build()
	
	def IOoplAttributeAccessBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAttributeAccessBuilder setAttribute(Attribute attribute)
	
}