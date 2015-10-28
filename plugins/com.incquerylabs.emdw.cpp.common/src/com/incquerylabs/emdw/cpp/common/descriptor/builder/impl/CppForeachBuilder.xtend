package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplForeachBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class CppForeachBuilder implements IOoplForeachBuilder {
	extension Logger logger = Logger.getLogger(class)
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
		trace('''Started building''')
		val voidTypeString = converter.convertToType(mapper.findBasicType("void"))
		val ocd = factory.createOperationCallDescriptor => [
					it.baseType = voidTypeString
					it.fullType = it.baseType
					it.stringRepresentation = '''for(«variable.fullType» «variable.stringRepresentation» : «collection.stringRepresentation»)'''
				]
		trace('''Finished building''')
		return ocd
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