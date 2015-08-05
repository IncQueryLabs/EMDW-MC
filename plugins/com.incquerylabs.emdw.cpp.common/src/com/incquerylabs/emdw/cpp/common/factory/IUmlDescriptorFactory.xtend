package com.incquerylabs.emdw.cpp.common.factory

import com.incquerylabs.emdw.cpp.common.builder.IUmlSingleValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.builder.impl.UmlCollectionValueDescriptorBuilder

interface IUmlDescriptorFactory {
	def IUmlSingleValueDescriptorBuilder createSingleValueDescriptorBuilder()
	
	def UmlCollectionValueDescriptorBuilder createCollectionValueDescriptorBuilder()
}