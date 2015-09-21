package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.mapper.UmlToXtumlMapper
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import java.util.List
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.PrimitiveType
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.incquerylabs.emdw.cpp.common.TypeConverter

class UmlCollectionLiteralBuilder implements IUmlCollectionLiteralBuilder {
	private static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	private static extension TypeConverter typeConverter = new TypeConverter
	
	private UmlToXtumlMapper xumlMapper
	private XtumlToOoplMapper ooplMapper
	
	private Type collectionType
	private Type elementType
	private List<ValueDescriptor> elems
	private StringBuffer buffer
	
	new(AdvancedIncQueryEngine engine) {
		xumlMapper = new UmlToXtumlMapper(engine)
		ooplMapper = new XtumlToOoplMapper(engine)
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
		switch elementType {
			case Signal: {
				val xtEvent = xumlMapper.convertSignal(elementType as Signal)
				val cppEvent = ooplMapper.convertEvent(xtEvent)
				val collection = ooplMapper.findClassRefCollection(collectionString)
				return createCollectionVariableDescriptor => [
					it.baseType = collection.containerQualifiedName
					it.templateTypes += '''«cppEvent.convertType»*'''
					it.fullType = collection.convertType(cppEvent)
					it.stringRepresentation = '''new «it.fullType»();
					'''
				]
			}
			case PrimitiveType: {
				
			}
			default: {
				
			}
		}
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
	
	override setStringBuffer(StringBuffer buffer) {
		this.buffer = buffer
		return this
	}
	
}