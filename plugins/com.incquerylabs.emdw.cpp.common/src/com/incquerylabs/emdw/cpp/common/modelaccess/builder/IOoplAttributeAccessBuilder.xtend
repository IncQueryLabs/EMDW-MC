package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

interface IOoplAttributeAccessBuilder extends IModelAccessBuilder {
	override PropertyReadDescriptor build()
	
	def IOoplAttributeAccessBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAttributeAccessBuilder setAttribute(Attribute attribute)
	
}