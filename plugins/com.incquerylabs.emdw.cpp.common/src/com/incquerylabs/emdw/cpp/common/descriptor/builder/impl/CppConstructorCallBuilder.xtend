package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplConstructorCallBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.RedefinableElement
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent

class CppConstructorCallBuilder implements IOoplConstructorCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private RedefinableElement re
	private List<ValueDescriptor> params
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		var ocd = factory.createOperationCallDescriptor
		if(re instanceof XTClassEvent) {
			val cppEvent = mapper.convertEvent(re)
			ocd.baseType = '''«converter.convertType(cppEvent)»_event'''
			ocd.stringRepresentation = '''new «ocd.baseType»(false)'''
		} else {
			val cppClass = mapper.convertType(re as Type) as CPPClass
			ocd.baseType = converter.convertType(cppClass)
			ocd.stringRepresentation = '''new «ocd.baseType»(«IF params!=null»«FOR param : params SEPARATOR ", "»«param.stringRepresentation»«ENDFOR»«ENDIF»)'''
		}
		ocd.fullType = ocd.baseType
		return ocd
	}
	
	override setRedefinableElement(RedefinableElement re) {
		this.re = re
		return this
	}
	
	override setParameters(ValueDescriptor... params) {
		this.params = params
		return this
	}
	
}