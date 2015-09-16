package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

interface IOoplLinkUnlinkBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IOoplLinkUnlinkBuilder isUnlink(boolean isUnlink)
	def IOoplLinkUnlinkBuilder setSourceToTargetAssociation(XTAssociation association)
	def IOoplLinkUnlinkBuilder setSourceDescriptor(ValueDescriptor sourceDescriptor)
	def IOoplLinkUnlinkBuilder setTargetDescriptor(ValueDescriptor targetDescriptor)
}