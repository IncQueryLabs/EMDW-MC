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

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class CppCollectionLiteralBuilder implements IOoplCollectionLiteralBuilder{
	extension Logger logger = Logger.getLogger(class)
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	String xtCollectionType
	NamedElement xtElementType
	List<ValueDescriptor> elems;
	
	val XtumlToOoplMapper mapper
	val extension TypeConverter converter
	
	new (AdvancedIncQueryEngine engine) {
		this.mapper = new XtumlToOoplMapper(engine)
		this.converter = new TypeConverter
	}
	
	override build() {
		trace('''Started building''')
		var CollectionVariableDescriptor cvd
		switch (xtElementType) {
			XTEvent : {
				val elementType = mapper.convertEvent(xtElementType)
				trace('''Resolved element type: «elementType.cppQualifiedName»''')
				val cppCollectionType = mapper.findCollectionImplementation(xtCollectionType, elementType)
				trace('''Resolved collection type: «cppCollectionType.convertToBaseType»''')
				cvd = createCollectionVariableDescriptor(cppCollectionType, elementType)
			}
			Type : {
				val elementType = mapper.convertType(xtElementType)
				if(elementType instanceof CPPQualifiedNamedElement) {
					trace('''Resolved element type: «elementType.cppQualifiedName»''')
				}
				val cppCollectionType = mapper.findCollectionImplementation(xtCollectionType, elementType)
				trace('''Resolved collection type: «cppCollectionType.convertToBaseType»''')
				cvd = createCollectionVariableDescriptor(cppCollectionType, elementType)
			}
		}
		
		
		val descriptorString = '''{ «FOR elem : elems.sortBy[it.stringRepresentation] SEPARATOR ", "»«elem.stringRepresentation»«ENDFOR» }'''
		cvd.stringRepresentation = descriptorString
		// pointer and value representation should never be used 
		trace('''Finished building''')
		return cvd
	}
	
	private def createCollectionVariableDescriptor(BaseContainerImplementation collectionType, EObject elementType) {
		factory.createCollectionVariableDescriptor => [
			it.baseType = collectionType.convertToBaseType
			it.templateTypes.add(elementType.convertToType)
			it.fullType = getFullType(baseType, templateTypes)
		]
	}
	
	
	override setXtCollectionType(String xtCollectionType) {
		this.xtCollectionType = xtCollectionType
		this
	}
	
	override setXtElementType(NamedElement xtElementType) {
		this.xtElementType = xtElementType
		this
	}
	
	override setElements(ValueDescriptor... elements) {
		this.elems = elements
		this
	}
	
}