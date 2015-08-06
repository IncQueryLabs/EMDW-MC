package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

interface IOoplAttributeWriteBuilder extends IModelAccessBuilder {
	override String build()
	
	def IOoplAttributeWriteBuilder setVariable(SingleValueDescriptor variable)
	
	def IOoplAttributeWriteBuilder setAttribute(Attribute attribute)
	
	def IOoplAttributeWriteBuilder setNewValue(SingleValueDescriptor newValue)
}