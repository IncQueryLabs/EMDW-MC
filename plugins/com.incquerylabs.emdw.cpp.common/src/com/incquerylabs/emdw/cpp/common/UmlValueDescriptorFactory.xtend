package com.incquerylabs.emdw.cpp.common

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Element

class UmlValueDescriptorFactory {
	private UmlValueDescriptorFactory parent
	private XtumlValueDescriptorFactory factory
	private UmlToXtumlMapper mapper
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		this(null, engine)
	}
	
	new(UmlValueDescriptorFactory parent) {
		this(parent, parent.engine)
	}
	
	new(UmlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new XtumlValueDescriptorFactory(parent.factory, engine)
		} else {
			factory = new XtumlValueDescriptorFactory(engine)
		}
		mapper = new UmlToXtumlMapper(engine)
	}
	
	
	
	def prepareSingleValueDescriptor4NewLocalVariable(Element type, String localVariableName) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4NewLocalVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptor4NewLocalVariable(Element type) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4NewLocalVariable(ooplType)
	}
	
	def prepareSingleValueDescriptor4ExistingVariable(Element type, String localVariableName) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4ExistingVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptor4Literal(Element type, String literal) {
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptor4Literal(ooplType, literal)
	}
}