package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlLiteralDescriptorBuilder extends IValueDescriptorBuilder<LiteralDescriptor> {
	
	def IUmlLiteralDescriptorBuilder setType(Type type)
	
	def IUmlLiteralDescriptorBuilder setLiteral(String literal)
	
}