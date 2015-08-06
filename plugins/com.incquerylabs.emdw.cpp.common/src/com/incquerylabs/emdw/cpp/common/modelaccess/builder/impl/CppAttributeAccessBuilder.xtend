package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeAccessBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

class CppAttributeAccessBuilder implements IOoplAttributeAccessBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private SingleValueDescriptor variable
	private Attribute attribute
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		val cppAttribute = mapper.convertAttribute(attribute)
		val svd = factory.createSingleValueDescriptor => [
			it.valueType = converter.convertType(cppAttribute.type)
			it.stringRepresentation = '''«variable.stringRepresentation»->«cppAttribute.cppName»'''
		]
		return svd
		
	}
	
	override setVariable(SingleValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setAttribute(Attribute attribute) {
		this.attribute = attribute
		return this
	}
	
}