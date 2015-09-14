package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplLinkUnlinkBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

class CppLinkUnlinkBuilder implements IOoplLinkUnlinkBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private CppAssociationWriteBuilder sourceToTargetWriteBuilder
	private CppAssociationWriteBuilder targetToSourceWriteBuilder
	
	private boolean isUnlink
	private XTAssociation xtAssociation
	private ValueDescriptor sourceDescriptor
	private ValueDescriptor targetDescriptor
	
	
	new(AdvancedIncQueryEngine engine) {
		sourceToTargetWriteBuilder = new CppAssociationWriteBuilder(engine)
		targetToSourceWriteBuilder = new CppAssociationWriteBuilder(engine)
	}
	
	override build() {
		sourceToTargetWriteBuilder.setVariable(sourceDescriptor)
									.setAssociation(xtAssociation)
									.setNewValue(targetDescriptor)
		targetToSourceWriteBuilder.setVariable(targetDescriptor)
									.setAssociation(xtAssociation.opposite)
									.setNewValue(sourceDescriptor)
		if(isUnlink) {
			val nullDescriptor = factory.createSingleVariableDescriptor => [
				it.baseType = "void"
				it.fullType = "void"
				it.stringRepresentation = "null"
			]
			sourceToTargetWriteBuilder.newValue = nullDescriptor
			targetToSourceWriteBuilder.newValue = nullDescriptor
		}
		return factory.createOperationCallDescriptor => [
			it.stringRepresentation =	'''
										«sourceToTargetWriteBuilder.build»;
										«targetToSourceWriteBuilder.build»
										'''
			it.baseType = "void"
			it.fullType = "void"
		]
	}
	
	override isUnlink(boolean isUnlink) {
		this.isUnlink = isUnlink
		return this
	}
	
	override setSourceToTargetAssociation(XTAssociation association) {
		this.xtAssociation = association
		return this
	}
	
	override setSourceDescriptor(ValueDescriptor sourceDescriptor) {
		this.sourceDescriptor = sourceDescriptor
		return this
	}
	
	override setTargetDescriptor(ValueDescriptor targetDescriptor) {
		this.targetDescriptor = targetDescriptor
		return this
	}
	
}