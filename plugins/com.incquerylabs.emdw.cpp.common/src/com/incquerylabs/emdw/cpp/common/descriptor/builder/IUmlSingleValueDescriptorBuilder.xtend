package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Type

interface IUmlSingleValueDescriptorBuilder  extends IUmlValueDescriptorBuilder<SingleValueDescriptor>{
	def IUmlSingleValueDescriptorBuilder setName(String name) 
	
	def IUmlSingleValueDescriptorBuilder setLiteral(String literal) 
	
	def IUmlSingleValueDescriptorBuilder setType(Type type)
	
	def IUmlSingleValueDescriptorBuilder setIsExistingVariable(boolean isExistingVariable) 
}