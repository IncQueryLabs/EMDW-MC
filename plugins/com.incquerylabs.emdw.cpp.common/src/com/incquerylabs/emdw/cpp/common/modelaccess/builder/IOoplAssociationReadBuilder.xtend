package com.incquerylabs.emdw.cpp.common.modelaccess.builder

import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

interface IOoplAssociationReadBuilder extends IModelAccessBuilder {
	override PropertyReadDescriptor build()
	
	def IOoplAssociationReadBuilder setVariable(ValueDescriptor variable)
	
	def IOoplAssociationReadBuilder setAssociation(XTAssociation association)
	
}