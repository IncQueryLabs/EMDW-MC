package com.incquerylabs.emdw.cpp.common.factory

import com.incquerylabs.emdw.cpp.common.builder.impl.UmlCollectionValueDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.builder.impl.UmlSingleValueDescriptorBuilder

interface IUmlDescriptorFactory {
	def UmlSingleValueDescriptorBuilder createSingleValueDescriptorBuilder()
	
	def UmlCollectionValueDescriptorBuilder createCollectionValueDescriptorBuilder()
}