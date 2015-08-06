package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Property

interface IUmlPropertyReadBuilder extends IModelAccessBuilder {
	override PropertyReadDescriptor build()
	
	def IUmlPropertyReadBuilder setVariable(ValueDescriptor variable)
	
	def IUmlPropertyReadBuilder setProperty(Property property)
}