package com.incquerylabs.emdw.cpp.common.descriptor.factory

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlSingleVariableDescriptorBuilder createSingleVariableDescriptorBuilder()
	
	def IUmlCollectionVariableDescriptorBuilder createCollectionVariableDescriptorBuilder()
}