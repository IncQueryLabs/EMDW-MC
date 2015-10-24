package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.BaseContainerImplementation
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCollectionLiteralBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import java.util.List

class CppCollectionLiteralBuilder implements IOoplCollectionLiteralBuilder{
	
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
		var CollectionVariableDescriptor cvd
		switch (xtElementType) {
			XTEvent : {
				val elementType = mapper.convertEvent(xtElementType)
				val cppCollectionType = mapper.findCollectionImplementation(xtCollectionType, elementType)
				cvd = createCollectionVariableDescriptor(cppCollectionType, elementType)
			}
			Type : {
				val elementType = mapper.convertType(xtElementType)
				val cppCollectionType = mapper.findCollectionImplementation(xtCollectionType, elementType)
				cvd = createCollectionVariableDescriptor(cppCollectionType, elementType)
			}
		}
		
		
		val descriptorString = '''{ «FOR elem : elems.sortBy[it.stringRepresentation] SEPARATOR ", "»«elem.stringRepresentation»«ENDFOR» }'''
		cvd.stringRepresentation = descriptorString
		// pointer and value representation should never be used 
				
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