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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAssociationReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeReadBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.PropertyReadDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Property

class UmlPropertyReadBuilder implements IUmlPropertyReadBuilder {
	extension Logger logger = Logger.getLogger(class)
	
	private UmlToXtumlMapper mapper
	private IOoplAttributeReadBuilder attributeBuilder
	private IOoplAssociationReadBuilder associationBuilder
	
	private ValueDescriptor variable
	private Property property
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new UmlToXtumlMapper(engine)
		attributeBuilder = new CppAttributeReadBuilder(engine)
		associationBuilder = new CppAssociationReadBuilder(engine)
	}
	
	
	override build() {
		trace('''Started building''')
		var PropertyReadDescriptor descriptor
		val xtUmlAttribute = mapper.convertPropertyToAttribute(property)
		if(xtUmlAttribute!=null) {
			trace('''Resolved attribute: «xtUmlAttribute.name»''')
			descriptor = (attributeBuilder => [
						it.variable = variable
						it.attribute = xtUmlAttribute
					]).build
		} else {
			val xtUmlAssociation = mapper.convertPropertyToAssociation(property)
			trace('''Resolved association: «xtUmlAssociation.name»''')
			descriptor = (associationBuilder => [
						it.variable = variable
						it.association = xtUmlAssociation
					]).build
		}
		trace('''Finished building''')
		return descriptor
		
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setProperty(Property property) {
		this.property = property
		return this
	}
	
}