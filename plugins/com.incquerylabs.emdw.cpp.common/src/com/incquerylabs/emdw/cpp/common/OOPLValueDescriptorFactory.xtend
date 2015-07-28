package com.incquerylabs.emdw.cpp.common

import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute

abstract class OOPLValueDescriptorFactory {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	protected int index
	protected OOPLValueDescriptorFactory parent
	
	
	
	def int getActualIndex() {
		return index
	}
	
	
	
	def SingleValueDescriptor prepareSingleValueDescriptor4NewLocalVariable(OOPLType type, String localVariableName)
	
	def SingleValueDescriptor prepareSingleValueDescriptor4NewLocalVariable(OOPLType type) 
	
	def SingleValueDescriptor prepareSingleValueDescriptor4ExistingVariable(OOPLType type, String localVariableName)
	
	def SingleValueDescriptor prepareSingleValueDescriptor4Literal(OOPLType type, String literal) 
	
	def SingleValueDescriptor prepareSingleValueDescriptor4Attribute(SingleValueDescriptor attributeOwner, CPPAttribute attribute) 
}