package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplCopyConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class CppCopyConstructorCallBuilder implements IOoplCopyConstructorCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private XTClassEvent re
	private ValueDescriptor param
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		var ocd = factory.createOperationCallDescriptor
		val cppEvent = mapper.convertEvent(re)
		ocd.baseType = '''«converter.convertType(cppEvent)»_event'''
		ocd.stringRepresentation = '''new «ocd.baseType»(«IF param!=null»«param.stringRepresentation»«ENDIF»)'''
		ocd.fullType = ocd.baseType
		return ocd
	}
	
	override setEvent(XTClassEvent event) {
		this.re = re
		return this
	}
	
	override setParameter(ValueDescriptor param) {
		this.param = param
		return this
	}
	
}