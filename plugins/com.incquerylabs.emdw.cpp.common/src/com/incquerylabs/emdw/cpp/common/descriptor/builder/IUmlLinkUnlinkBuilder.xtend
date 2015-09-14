package com.incquerylabs.emdw.cpp.common.descriptor.builder

import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor

interface IUmlLinkUnlinkBuilder extends IValueDescriptorBuilder<OperationCallDescriptor> {
	def IUmlLinkUnlinkBuilder isUnlink(boolean isUnlink)
	def IUmlLinkUnlinkBuilder setAssociation(Association association)
	def IUmlLinkUnlinkBuilder setSourceProperty(Property sourceProperty)
	def IUmlLinkUnlinkBuilder setSourceDescriptor(ValueDescriptor sourceDescriptor)
	def IUmlLinkUnlinkBuilder setTargetProperty(Property targetProperty)
	def IUmlLinkUnlinkBuilder setTargetDescriptor(ValueDescriptor targetDescriptor)
}