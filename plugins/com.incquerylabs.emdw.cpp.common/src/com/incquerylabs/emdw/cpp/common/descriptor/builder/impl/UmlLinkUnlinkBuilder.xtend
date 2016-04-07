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
package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLinkUnlinkBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Association
import org.eclipse.uml2.uml.Property

class UmlLinkUnlinkBuilder implements IUmlLinkUnlinkBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplLinkUnlinkBuilder builder
	
	private boolean isUnlink
	private Association association
	private Property sourceProperty
	private ValueDescriptor sourceDescriptor
	private Property targetProperty
	private ValueDescriptor targetDescriptor
	
	new(UmlValueDescriptorFactory factory, AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		builder = new CppLinkUnlinkBuilder(factory.factory.factory, engine, mapper)
	}
	
	override build() {
		trace('''Started building''')
		val sourceToTargetAssociation = mapper.convertPropertyToAssociation(targetProperty)
		trace('''Resolved association: «sourceToTargetAssociation.name»''')
		builder.isUnlink(isUnlink)
		if(sourceToTargetAssociation != null) {
			builder => [
				it.sourceDescriptor = this.sourceDescriptor
				it.targetDescriptor = this.targetDescriptor
				it.sourceToTargetAssociation = sourceToTargetAssociation
			]
		} else {
			trace('''No source to target association''')
			val targetToSourceAssociation = mapper.convertPropertyToAssociation(sourceProperty)
			trace('''Resolved association: «targetToSourceAssociation.name»''')
			builder => [
				it.sourceDescriptor = this.targetDescriptor
				it.targetDescriptor = this.sourceDescriptor
				it.sourceToTargetAssociation = targetToSourceAssociation
			]
		}
		val vd = builder.build
		trace('''Finished building''')
		return vd
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