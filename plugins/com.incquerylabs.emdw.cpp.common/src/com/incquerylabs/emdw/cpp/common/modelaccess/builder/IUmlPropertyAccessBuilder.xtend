package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyAccessBuilder extends IModelAccessBuilder {
	override SingleValueDescriptor build()
	
	def IUmlPropertyAccessBuilder setVariable(SingleValueDescriptor variable)
	
	def IUmlPropertyAccessBuilder setProperty(Property property)
}