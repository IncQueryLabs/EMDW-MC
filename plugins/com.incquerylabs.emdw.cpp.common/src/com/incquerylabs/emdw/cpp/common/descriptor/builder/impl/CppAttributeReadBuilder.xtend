package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAttributeReadBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

class CppAttributeReadBuilder implements IOoplAttributeReadBuilder {
	extension Logger logger = Logger.getLogger(class)
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
		trace('''Started building''')
		val cppAttribute = mapper.convertAttribute(attribute)
		trace('''Resolved attribute: «cppAttribute.cppQualifiedName»''')
		val type = cppAttribute.type
		val String stringRepresentation = '''«variable.stringRepresentation»->«cppAttribute.cppName»'''
		val variableRepresentations = converter.createStringRepresentations(stringRepresentation, type)
		val svd = factory.createPropertyReadDescriptor => [
			it.baseType = converter.convertToBaseType(type)
			it.fullType = converter.convertToType(type)
			it.stringRepresentation = stringRepresentation
			it.pointerRepresentation = variableRepresentations.pointerRepresentation
			it.valueRepresentation = variableRepresentations.valueRepresentation
		]
		if(type instanceof CPPSequence) {
			svd.templateTypes.add(converter.convertToType(type.elementType))
		}
		trace('''Finished building''')
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