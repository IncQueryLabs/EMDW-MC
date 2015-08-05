package com.incquerylabs.emdw.cpp.common.descriptor

import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Type

interface IDescriptorCacheManager {
	
	def boolean isSingleVariableInCache(String variableName)
	def SingleValueDescriptor getSingleVariableFromCache(String variableName)
	def void putSingleVariableIntoCache(String variableName, SingleValueDescriptor descriptor)
	
	def boolean isLiteralInCache(Type type, String literal)
	def SingleValueDescriptor getLiteralFromCache(Type type, String literal)
	def void putLiteralIntoCache(Type type, String literal, SingleValueDescriptor descriptor)
}