package com.incquerylabs.emdw.cpp.common.descriptor

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type

interface IDescriptorCacheManager {
	
	def boolean isSingleVariableInCache(String variableName)
	def SingleVariableDescriptor getSingleVariableFromCache(String variableName)
	def void putSingleVariableIntoCache(String variableName, SingleVariableDescriptor descriptor)
	
	def boolean isLiteralInCache(Type type, String literal)
	def SingleVariableDescriptor getLiteralFromCache(Type type, String literal)
	def void putLiteralIntoCache(Type type, String literal, SingleVariableDescriptor descriptor)
}