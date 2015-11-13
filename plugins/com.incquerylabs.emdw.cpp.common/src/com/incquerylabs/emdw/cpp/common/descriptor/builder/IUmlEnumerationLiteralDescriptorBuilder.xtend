package com.incquerylabs.emdw.cpp.common.descriptor.builder

import org.eclipse.uml2.uml.EnumerationLiteral
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor

interface IUmlEnumerationLiteralDescriptorBuilder extends IValueDescriptorBuilder<LiteralDescriptor> {
	
	def IUmlEnumerationLiteralDescriptorBuilder setEnumerationLiteral(EnumerationLiteral enumLiteral)
	
}