package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

interface IOoplAssociationWriteBuilder extends IModelAccessBuilder {
	override PropertyWriteDescriptor build()
	
	def IOoplAssociationWriteBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAssociationWriteBuilder setAssociation(XTAssociation association)
	
	def IOoplAssociationWriteBuilder setNewValue(ValueDescriptor newValue)
	
}