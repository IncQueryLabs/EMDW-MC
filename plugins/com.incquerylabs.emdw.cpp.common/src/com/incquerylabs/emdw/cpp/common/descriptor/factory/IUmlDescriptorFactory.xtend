package com.incquerylabs.emdw.cpp.common.descriptor.factory

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IUmlPropertyWriteBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlSingleVariableDescriptorBuilder createSingleVariableDescriptorBuilder()
	
	def IUmlCollectionVariableDescriptorBuilder createCollectionVariableDescriptorBuilder()
	
	def IUmlPropertyReadBuilder createPropertyReadBuilder()
	
	def IUmlPropertyWriteBuilder createPropertyWriteBuilder()
	
	def IUmlOperationCallBuilder createOperationCallBuilder()
}