package com.incquerylabs.emdw.cpp.common

import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import static com.google.common.base.Preconditions.*

class XtumlValueDescriptorFactory {
	private XtumlValueDescriptorFactory parent
	private OOPLValueDescriptorFactory factory
	private XtumlToOoplMapper mapper
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null, "Engine cannot be null!")
		init(null, engine)
	}
	
	new(XtumlValueDescriptorFactory parent) {
		checkArgument(parent!=null, "Parent cannot be null!")
		init(parent, parent.engine)
	}
	
	private def init(XtumlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new CPPValueDescriptorFactory(parent.factory)
		} else {
			factory = new CPPValueDescriptorFactory
		}
		mapper = new XtumlToOoplMapper(engine)
	}
	
	
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Type type) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(ooplType)
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Type type, String localVariableName) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForExistingVariable(ooplType, localVariableName)
	}
	
	def prepareSingleValueDescriptorForLiteral(Type type, String literal) {
		checkArgument(type!=null, "Type cannot be null")
		val ooplType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForLiteral(ooplType, literal)
	}

}