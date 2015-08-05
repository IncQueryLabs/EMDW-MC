package com.incquerylabs.emdw.cpp.common.modelaccess

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyAccessBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder

interface IModelAccess {
	def IUmlPropertyAccessBuilder createPropertyAccessBuilder()
	
	def IUmlPropertyWriteBuilder createPropertyWriteBuilder()
	
	def IUmlOperationCallBuilder createOperationCallBuilder()
}