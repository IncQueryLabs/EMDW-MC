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
	
	
	
	def SingleValueDescriptor prepareSingleValueDescriptorForNewLocalVariable(OOPLType type, String localVariableName)
	
	def SingleValueDescriptor prepareSingleValueDescriptorForNewLocalVariable(OOPLType type) 
	
	def SingleValueDescriptor prepareSingleValueDescriptorForExistingVariable(OOPLType type, String localVariableName)
	
	def SingleValueDescriptor prepareSingleValueDescriptorForLiteral(OOPLType type, String literal) 
	
	def SingleValueDescriptor prepareSingleValueDescriptorForAttribute(SingleValueDescriptor attributeOwner, CPPAttribute attribute) 
}