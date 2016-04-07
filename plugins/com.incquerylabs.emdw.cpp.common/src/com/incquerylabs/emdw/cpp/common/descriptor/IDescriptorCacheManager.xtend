/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
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