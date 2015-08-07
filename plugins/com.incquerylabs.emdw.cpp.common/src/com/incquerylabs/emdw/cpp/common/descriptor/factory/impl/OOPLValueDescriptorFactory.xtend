package com.incquerylabs.emdw.cpp.common.descriptor.factory.impl

import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor

abstract class OOPLValueDescriptorFactory {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	protected int index
	protected OOPLValueDescriptorFactory parent
	
	
	
	def int getActualIndex() {
		return index
	}
	
	
	
	/**
	 * @param type Cannot be null
	 * @param localVariableName Cannot be null
	 * 
	 * @return The SingleVariableDescriptor with the <code>type</code>
	 *         and with unique name based on <code>localVariableName</code>
	 */
	def SingleVariableDescriptor prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type, String localVariableName)
	
	def SingleVariableDescriptor prepareSingleVariableDescriptorForNewLocalVariable(OOPLType type) 
	
	def SingleVariableDescriptor prepareSingleVariableDescriptorForExistingVariable(OOPLType type, String localVariableName)
	
	def LiteralDescriptor prepareSingleVariableDescriptorForLiteral(OOPLType type, String literal) 
	
	def SingleVariableDescriptor prepareSingleVariableDescriptorForAttribute(SingleVariableDescriptor attributeOwner, CPPAttribute attribute) 
}