package com.incquerylabs.emdw.cpp.common.modelaccess

import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder

interface IModelAccess {
	def IUmlPropertyReadBuilder createPropertyAccessBuilder()
	
	def IUmlPropertyWriteBuilder createPropertyWriteBuilder()
	
	def IUmlOperationCallBuilder createOperationCallBuilder()
}