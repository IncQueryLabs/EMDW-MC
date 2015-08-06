package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

interface IOoplAttributeReadBuilder extends IModelAccessBuilder {
	override PropertyReadDescriptor build()
	
	def IOoplAttributeReadBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAttributeReadBuilder setAttribute(Attribute attribute)
	
}