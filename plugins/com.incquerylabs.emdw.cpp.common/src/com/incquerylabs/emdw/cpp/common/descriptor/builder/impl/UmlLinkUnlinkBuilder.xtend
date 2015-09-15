package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLinkUnlinkBuilder
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplLinkUnlinkBuilder
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class UmlLinkUnlinkBuilder implements IUmlLinkUnlinkBuilder {
	private UmlToXtumlMapper mapper
	private IOoplLinkUnlinkBuilder builder
	
	private boolean isUnlink
	private Association association
	private Property sourceProperty
	private ValueDescriptor sourceDescriptor
	private Property targetProperty
	private ValueDescriptor targetDescriptor
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppLinkUnlinkBuilder(engine)
	}
	
	override build() {
		val sourceToTargetAssociation = mapper.convertPropertyToAssociation(targetProperty)
		return (builder => [
					it.isUnlink(isUnlink)
					it.sourceDescriptor = this.sourceDescriptor
					it.targetDescriptor = this.targetDescriptor
					it.sourceToTargetAssociation = sourceToTargetAssociation
				]).build
	}
	
	override isUnlink(boolean isUnlink) {
		this.isUnlink = isUnlink
		return this
	}
	
	override setAssociation(Association association) {
		this.association = association
		return this
	}
	
	override setSourceProperty(Property sourceProperty) {
		this.sourceProperty = sourceProperty
		return this
	}
	
	override setSourceDescriptor(ValueDescriptor sourceDescriptor) {
		this.sourceDescriptor = sourceDescriptor
		return this
	}
	
	override setTargetProperty(Property targetProperty) {
		this.targetProperty = targetProperty
		return this
	}
	
	override setTargetDescriptor(ValueDescriptor targetDescriptor) {
		this.targetDescriptor = targetDescriptor
		return this
	}
	
}