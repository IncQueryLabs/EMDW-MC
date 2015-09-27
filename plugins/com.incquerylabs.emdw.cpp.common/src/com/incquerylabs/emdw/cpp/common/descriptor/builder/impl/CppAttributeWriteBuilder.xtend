package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeWriteBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

class CppAttributeWriteBuilder implements IOoplAttributeWriteBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor variable
	private Attribute attribute
	private ValueDescriptor newValue
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	
	override build() {
		val cppAttribute = mapper.convertAttribute(attribute)
		val type = cppAttribute.type
		val svd = factory.createPropertyWriteDescriptor => [
			it.baseType = converter.convertToBaseType(type)
			it.fullType = converter.convertToType(type)
			it.stringRepresentation = '''«variable.stringRepresentation»->«cppAttribute.cppName» = «newValue.valueRepresentation»'''
		]
		if(type instanceof CPPSequence) {
			svd.templateTypes.add(converter.convertToType(type.elementType))
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
	
	override setNewValue(ValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}