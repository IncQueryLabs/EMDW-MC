package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

class CppAttributeWriteBuilder implements IOoplAttributeWriteBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private SingleValueDescriptor variable
	private Attribute attribute
	private SingleValueDescriptor newValue
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	
	override build() {
		val cppAttribute = mapper.convertAttribute(attribute)
		return '''«variable.stringRepresentation»->«cppAttribute.cppName» = «newValue.stringRepresentation»'''
	}
	
	override setVariable(SingleValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setAttribute(Attribute attribute) {
		this.attribute = attribute
		return this
	}
	
	override setNewValue(SingleValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}