package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplForeachBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.incquerylabs.emdw.cpp.common.TypeConverter

class CppForeachBuilder implements IOoplForeachBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private TypeConverter converter
	private XtumlToOoplMapper mapper
	
	private ValueDescriptor collection
	private ValueDescriptor variable
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		val voidTypeString = converter.convertToType(mapper.findBasicType("void"))
		return factory.createOperationCallDescriptor => [
					it.baseType = voidTypeString
					it.fullType = it.baseType
					it.stringRepresentation = '''for(«variable.fullType» «variable.stringRepresentation» : «collection.stringRepresentation»)'''
				]
	}
	
	override setCollectionDescriptor(ValueDescriptor collection) {
		this.collection = collection
		return this
	}
	
	override setVariableDescriptor(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
}