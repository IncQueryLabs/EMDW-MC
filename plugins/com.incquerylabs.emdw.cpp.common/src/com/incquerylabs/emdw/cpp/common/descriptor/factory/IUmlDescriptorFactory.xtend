package com.incquerylabs.emdw.cpp.common.descriptor.factory

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleValueDescriptorBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlSingleValueDescriptorBuilder createSingleValueDescriptorBuilder()
	
	def IUmlCollectionValueDescriptorBuilder createCollectionValueDescriptorBuilder()
}