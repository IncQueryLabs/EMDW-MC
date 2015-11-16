package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral

interface IOoplEnumerationLiteralBuilder extends IValueDescriptorBuilder<LiteralDescriptor>{
	
	def IOoplEnumerationLiteralBuilder setEnumerationLiteral(EnumerationLiteral enumLiteral)
	
}