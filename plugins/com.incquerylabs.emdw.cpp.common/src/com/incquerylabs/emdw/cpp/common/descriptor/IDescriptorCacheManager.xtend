package com.incquerylabs.emdw.cpp.common.descriptor

import com.google.common.collect.Table
import java.util.Map
import org.eclipse.uml2.uml.Element
import com.incquerylabs.emdw.valuedescriptor.AbstractValueDescriptor

interface IDescriptorCacheManager {
	
	def Map<String, ? extends AbstractValueDescriptor> getVariableCache()
	def Table<String, Element, ? extends AbstractValueDescriptor> getLiteralCache()
}