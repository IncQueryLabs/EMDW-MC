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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAssociationWriteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeWriteBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyWriteBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor

class UmlPropertyWriteBuilder implements IUmlPropertyWriteBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplAttributeWriteBuilder attributeBuilder
	private IOoplAssociationWriteBuilder associationBuilder
	
	private ValueDescriptor variable
	private Property property
	private ValueDescriptor newValue
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		attributeBuilder = new CppAttributeWriteBuilder(engine)
		associationBuilder = new CppAssociationWriteBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		var PropertyWriteDescriptor pwd = null
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			trace('''Resolved attribute: «xtUmlAttribute.name»''')
			pwd = (attributeBuilder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
						it.newValue = newValue
					]).build
		} else {
			val xtUmlAssociation = mapper.convertPropertyToAssociation(property)
			trace('''Resolved association: «xtUmlAssociation.name»''')
			pwd = (associationBuilder => [
						it.variable = variable
						it.association = xtUmlAssociation
						it.newValue = newValue
					]).build
		}
		trace('''Finished building''')
		return pwd
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setProperty(Property property) {
		this.property = property
		return this
	}
	
	override setNewValue(ValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}