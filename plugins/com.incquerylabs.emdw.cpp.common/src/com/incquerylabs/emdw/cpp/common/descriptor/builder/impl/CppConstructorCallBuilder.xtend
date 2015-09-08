package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass

class CppConstructorCallBuilder implements IOoplConstructorCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private XTClass cl
	private List<ValueDescriptor> params
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		val cppClass = mapper.convertType(cl) as CPPClass
		val ocd = factory.createOperationCallDescriptor => [
			it.baseType = '''«converter.convertType(cppClass)»*'''
			it.fullType = it.baseType
			it.stringRepresentation = '''new «converter.convertType(cppClass)»(«IF params!=null»«FOR param : params SEPARATOR ", "»«param.stringRepresentation»«ENDFOR»«ENDIF»)'''
		]
		return ocd
	}
	
	override setClass(XTClass cl) {
		this.cl = cl
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}