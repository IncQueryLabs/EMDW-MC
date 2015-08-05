package com.incquerylabs.emdw.cpp.common.factory

import com.incquerylabs.emdw.cpp.common.builder.IUmlCollectionValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.builder.IUmlSingleValueDescriptorBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlSingleValueDescriptorBuilder createSingleValueDescriptorBuilder()
	
	def IUmlCollectionValueDescriptorBuilder createCollectionValueDescriptorBuilder()
}