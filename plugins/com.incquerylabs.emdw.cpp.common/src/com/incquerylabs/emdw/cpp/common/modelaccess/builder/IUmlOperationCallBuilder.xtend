package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.AbstractValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Operation

interface IUmlOperationCallBuilder extends IModelAccessBuilder {
	override AbstractValueDescriptor build()
	
	def IUmlOperationCallBuilder setVariable(SingleValueDescriptor variable)
	
	def IUmlOperationCallBuilder setOperation(Operation operation)
	
	def IUmlOperationCallBuilder setParameters(AbstractValueDescriptor params)
	
}