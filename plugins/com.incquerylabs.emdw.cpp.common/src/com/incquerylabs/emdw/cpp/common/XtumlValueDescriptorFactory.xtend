package com.incquerylabs.emdw.cpp.common

import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine

class XtumlValueDescriptorFactory {
	private XtumlValueDescriptorFactory parent
	private OOPLValueDescriptorFactory factory
	private XtumlToOoplMapper mapper
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this(null, engine)
	}
	
	new(XtumlValueDescriptorFactory parent) {
		this(parent, parent.engine)
	}
	
	new(XtumlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new CPPValueDescriptorFactory(parent.factory)
		} else {
			factory = new CPPValueDescriptorFactory
		}
		mapper = new XtumlToOoplMapper(engine)
	}
	
	
	
	def prepareSingleValueDescriptor4NewLocalVariable(Type type, String localVariableName) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4NewLocalVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptor4NewLocalVariable(Type type) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4NewLocalVariable(ooplType)
	}
	
	def prepareSingleValueDescriptor4ExistingVariable(Type type, String localVariableName) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4ExistingVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptor4Literal(Type type, String literal) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4Literal(ooplType, literal)
	}

}