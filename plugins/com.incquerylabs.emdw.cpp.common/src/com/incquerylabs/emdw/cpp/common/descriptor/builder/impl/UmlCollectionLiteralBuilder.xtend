package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Type

class UmlCollectionLiteralBuilder implements IUmlCollectionLiteralBuilder {

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
		var String collectionString
		switch collectionType.qualifiedName {
			case "std::collections::Set": {
				collectionString = "::std::set"
			}
			default: {
				collectionString = "::std::list"
			}
		}
		
		val xtCollectionType = mapper.decodeCollectionType(collectionType)
		val xtElementType = switch (elementType) {
			Signal : mapper.convertSignal(elementType)
			Type : mapper.convertType(elementType)
		}
		
		val cvd = (literalBuilder => [
			it.xtCollectionType = xtCollectionType
			it.xtElementType = xtElementType
			it.elements = elems
		]).build
		
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