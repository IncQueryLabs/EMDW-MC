package com.incquerylabs.emdw.cpp.common.descriptor

import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.LiteralDescriptor
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Type

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
	
}