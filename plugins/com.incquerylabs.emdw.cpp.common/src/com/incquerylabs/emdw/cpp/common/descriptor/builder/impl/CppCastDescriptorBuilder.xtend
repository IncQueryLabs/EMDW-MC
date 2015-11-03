package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCastDescriptorBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Type
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement

class CppCastDescriptorBuilder implements IOoplCastDescriptorBuilder {
	extension Logger logger = Logger.getLogger(class)
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor castableDescriptor
	private Type castingType
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		trace('''Started building''')
		val ooplType = mapper.convertType(castingType)
		if(ooplType instanceof CPPQualifiedNamedElement) {
			trace('''Resolved type: «ooplType.cppQualifiedName»''')
		}
		val svd = factory.createSingleVariableDescriptor => [
					it.baseType = converter.convertToType(ooplType)
					it.fullType = it.baseType
					if(converter.isReferenceType(ooplType)) {
						it.stringRepresentation = '''dynamic_cast<«it.fullType»>(«castableDescriptor.stringRepresentation»)'''
					} else {
						it.stringRepresentation = '''(«it.fullType»)«castableDescriptor.stringRepresentation»'''
					}
				]
		trace('''Finished building''')
		return svd
	}
	
	override setDescriptor(ValueDescriptor castableDescriptor) {
		this.castableDescriptor = castableDescriptor
		return this
	}
	
	override setCastingType(Type castingType) {
		this.castingType = castingType
		return this
	}	
}