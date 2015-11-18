package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplEnumerationLiteralBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.EnumerationLiteral
import org.eclipse.uml2.common.util.SubsetSupersetEDataTypeEList.Unsettable
import com.incquerylabs.emdw.cpp.common.TypeConverter

class CppEnumerationLiteralBuilder implements IOoplEnumerationLiteralBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	extension Logger logger = Logger.getLogger(class)
	
	EnumerationLiteral enumLiteral	
	XtumlToOoplMapper mapper
	extension TypeConverter typeConverter
	
	new (AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		typeConverter = new TypeConverter
	}
	
	override build() {
		trace('''Started building''')
		val cppEnumLiteral = mapper.convertEnumLiteral(enumLiteral)
		val prefix = cppEnumLiteral.cppPrefix
		// remove "::"
		val type = prefix.substring(0, prefix.length - 2)
		trace('''Resolved enum: «cppEnumLiteral.cppQualifiedName»''')
		val enumLiteralDescriptor = factory.createLiteralDescriptor => [
			baseType = type
			fullType = type
			stringRepresentation = cppEnumLiteral.cppQualifiedName
			pointerRepresentation = stringRepresentation
			valueRepresentation = stringRepresentation
		]
		trace('''Finished building''')
		return enumLiteralDescriptor
	}
	
	override setEnumerationLiteral(EnumerationLiteral enumLiteral) {
		this.enumLiteral = enumLiteral
		this	
	}
}