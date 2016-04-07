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

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type

class UmlCollectionLiteralBuilder implements IUmlCollectionLiteralBuilder {
	extension Logger logger = Logger.getLogger(class)

	Type collectionType
	Type elementType
	List<ValueDescriptor> elems
	
	UmlToXtumlMapper mapper
	IOoplCollectionLiteralBuilder literalBuilder
	
	new(AdvancedIncQueryEngine engine) {
		this.mapper = new UmlToXtumlMapper(engine)
		this.literalBuilder = new CppCollectionLiteralBuilder(engine)
	}
	
	override build() {
		trace('''Started building''')
		var String collectionString
		switch collectionType.qualifiedName {
			case "std::collections::Set": {
				collectionString = "::std::set"
			}
			default: {
				collectionString = "::std::list"
			}
		}
		trace('''Collection type: «collectionString»''')
		
		val xtCollectionType = mapper.decodeCollectionType(collectionType)
		val xtElementType = switch (elementType) {
			Signal : mapper.convertSignal(elementType)
			Type : mapper.convertType(elementType)
		}
		trace('''Element type: «xtElementType.name»''')
		
		val cvd = (literalBuilder => [
			it.xtCollectionType = xtCollectionType
			it.xtElementType = xtElementType
			it.elements = elems
		]).build
		
		trace('''Finished building''')
		return cvd
	}
	
	override setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		return this
	}
	
	override setElementType(Type elementType) {
		this.elementType = elementType
		return this
	}
	
	override setElements(ValueDescriptor... elems) {
		this.elems = elems
		return this
	}
	
}