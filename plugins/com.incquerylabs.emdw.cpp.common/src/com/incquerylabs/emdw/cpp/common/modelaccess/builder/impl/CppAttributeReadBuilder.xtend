package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeReadBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence

class CppAttributeReadBuilder implements IOoplAttributeReadBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor variable
	private Attribute attribute
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		val cppAttribute = mapper.convertAttribute(attribute)
		val type = cppAttribute.type
		val svd = factory.createPropertyReadDescriptor => [
			it.fullType = converter.convertType(type)
			it.stringRepresentation = '''«variable.stringRepresentation»->«cppAttribute.cppName»'''
		]
		if(type instanceof CPPSequence) {
			svd.baseType = type.cppContainer
			svd.templateTypes.add(converter.convertType(type.elementType))
		} else {
			svd.baseType = converter.convertType(type)
		}
		return svd
		
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setAttribute(Attribute attribute) {
		this.attribute = attribute
		return this
	}
	
}