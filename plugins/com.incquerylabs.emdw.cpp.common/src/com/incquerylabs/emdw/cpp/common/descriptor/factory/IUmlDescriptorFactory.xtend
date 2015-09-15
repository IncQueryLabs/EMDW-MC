package com.incquerylabs.emdw.cpp.common.descriptor.factory

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlDeleteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlOperationCallBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSendSignalBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSigdataDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlSingleVariableDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlStaticOperationCallBuilder

interface IUmlDescriptorFactory {
	def IUmlDescriptorFactory createChild()
	
	def IUmlLiteralDescriptorBuilder createLiteralDescriptorBuilder()
	
	def IUmlSingleVariableDescriptorBuilder createSingleVariableDescriptorBuilder()
	
	def IUmlCollectionVariableDescriptorBuilder createCollectionVariableDescriptorBuilder()
	
	def IUmlPropertyReadBuilder createPropertyReadBuilder()
	
	def IUmlPropertyWriteBuilder createPropertyWriteBuilder()
	
	def IUmlOperationCallBuilder createOperationCallBuilder()
	
	def IUmlConstructorCallBuilder createConstructorCallBuilder()
	
	def IUmlCopyConstructorCallBuilder createCopyConstructorCallBuilder()
	
	def IUmlStaticOperationCallBuilder createStaticOperationCallBuilder()
	
	def IUmlInstancesBuilder createInstancesBuilder()
	
	def IUmlLinkUnlinkBuilder createLinkUnlinkBuilder()
	
	def IUmlDeleteBuilder createDeleteBuilder()
	
	def IUmlSigdataDescriptorBuilder createSigdataDescriptorBuilder()
	
	def IUmlSendSignalBuilder createSendSignalBuilder()
}