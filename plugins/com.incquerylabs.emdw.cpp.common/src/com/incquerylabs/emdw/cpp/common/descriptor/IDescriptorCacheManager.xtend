package com.incquerylabs.emdw.cpp.common.descriptor

import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ParameterDescriptor

interface IDescriptorCacheManager {
	
	def boolean isSingleVariableInCache(String variableName)
	def SingleVariableDescriptor getSingleVariableFromCache(String variableName)
	def void putSingleVariableIntoCache(String variableName, SingleVariableDescriptor descriptor)
	
	def boolean isLiteralInCache(Type type, String literal)
	def LiteralDescriptor getLiteralFromCache(Type type, String literal)
	def void putLiteralIntoCache(Type type, String literal, LiteralDescriptor descriptor)
	
	def boolean isCollectionVariableInCache(String variableName)
	def CollectionVariableDescriptor getCollectionVariableFromCache(String variableName)
	def void putCollectionVariableIntoCache(String variableName, CollectionVariableDescriptor descriptor)
	
	def boolean isParameterInCache(String parameterName)
	def ParameterDescriptor getParameterFromCache(String parameterName)
	def void putParameterIntoCache(ParameterDescriptor descriptor)
}