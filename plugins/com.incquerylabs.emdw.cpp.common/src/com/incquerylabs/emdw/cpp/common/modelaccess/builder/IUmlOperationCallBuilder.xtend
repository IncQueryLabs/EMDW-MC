package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.uml2.uml.Operation

interface IUmlOperationCallBuilder extends IModelAccessBuilder {
	override OperationCallDescriptor build()
	
	def IUmlOperationCallBuilder setVariable(ValueDescriptor variable)
	
	def IUmlOperationCallBuilder setOperation(Operation operation)
	
	def IUmlOperationCallBuilder setParameters(ValueDescriptor... params)
	
}