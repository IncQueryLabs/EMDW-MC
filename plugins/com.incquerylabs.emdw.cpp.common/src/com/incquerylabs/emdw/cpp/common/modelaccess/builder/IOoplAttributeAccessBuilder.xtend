package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor

interface IOoplAttributeAccessBuilder extends IModelAccessBuilder {
	override SingleValueDescriptor build()
	
	def IOoplAttributeAccessBuilder setVariable(SingleValueDescriptor variable)
	
	def IOoplAttributeAccessBuilder setAttribute(Attribute attribute)
	
}