package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAttributeAccessBuilder
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute

class OoplAttributeAccessBuilder implements IOoplAttributeAccessBuilder {
	private XtumlToOoplMapper mapper
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
	}
	
	override build() {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setVariable(SingleValueDescriptor variable) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override setAttribute(Attribute attribute) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}