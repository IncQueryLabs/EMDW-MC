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
package com.incquerylabs.emdw.cpp.common.descriptor.factory

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlDeleteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlForeachBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlParameterDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlEnumerationLiteralDescriptorBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlLiteralDescriptorBuilder createLiteralDescriptorBuilder()
	
	def IUmlSingleVariableDescriptorBuilder createSingleVariableDescriptorBuilder()
	
	def IUmlParameterDescriptorBuilder createParameterDescriptorBuilder()
	
	def IUmlEnumerationLiteralDescriptorBuilder createEnumerationLiteralDescriptorBuilder();
	
	def IUmlCollectionVariableDescriptorBuilder createCollectionVariableDescriptorBuilder()
	
	def IUmlCastDescriptorBuilder createCastDescriptorBuilder()
	
	def IUmlPropertyReadBuilder createPropertyReadBuilder()
	
	def IUmlPropertyWriteBuilder createPropertyWriteBuilder()
	
	def IUmlOperationCallBuilder createOperationCallBuilder()
	
	def IUmlCollectionOperationCallBuilder createCollectionOperationCallBuilder()
	
	def IUmlForeachBuilder createForeachBuilder()
	
	def IUmlConstructorCallBuilder createConstructorCallBuilder()

	def IUmlCollectionLiteralBuilder createCollectionLiteralBuilder()
	
	def IUmlCopyConstructorCallBuilder createCopyConstructorCallBuilder()
	
	def IUmlStaticOperationCallBuilder createStaticOperationCallBuilder()
	
	def IUmlInstancesBuilder createInstancesBuilder()
	
	def IUmlLinkUnlinkBuilder createLinkUnlinkBuilder()
	
	def IUmlDeleteBuilder createDeleteBuilder()
	
	def IUmlSigdataDescriptorBuilder createSigdataDescriptorBuilder()
	
	def IUmlSendSignalBuilder createSendSignalBuilder()
}
