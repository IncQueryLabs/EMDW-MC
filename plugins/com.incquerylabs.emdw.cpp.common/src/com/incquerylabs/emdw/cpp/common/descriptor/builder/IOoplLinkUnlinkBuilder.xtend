package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IOoplLinkUnlinkBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IUmlLinkUnlinkBuilder isUnlink(boolean isUnlink)
	def IUmlLinkUnlinkBuilder setAssociation(XTAssociation association)
	def IUmlLinkUnlinkBuilder setSource(XTClass sourceClass, ValueDescriptor sourceDescriptor)
	def IUmlLinkUnlinkBuilder setTarget(XTClass targetClass, ValueDescriptor targetDescriptor)
}