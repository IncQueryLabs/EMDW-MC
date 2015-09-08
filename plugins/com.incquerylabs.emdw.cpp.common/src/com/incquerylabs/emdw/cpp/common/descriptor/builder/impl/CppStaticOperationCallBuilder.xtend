package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplStaticOperationCallBuilder
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.TypeConverter
import java.util.List
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class CppStaticOperationCallBuilder implements IOoplStaticOperationCallBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private Operation operation
	private List<ValueDescriptor> params
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setOperation(Operation cl) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setParameters(ValueDescriptor... params) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}