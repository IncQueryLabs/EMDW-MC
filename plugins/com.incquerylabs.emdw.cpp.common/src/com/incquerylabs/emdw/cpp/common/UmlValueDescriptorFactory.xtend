package com.incquerylabs.emdw.cpp.common

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Element
import static com.google.common.base.Preconditions.*

class UmlValueDescriptorFactory {
	private UmlValueDescriptorFactory parent
	private XtumlValueDescriptorFactory factory
	private UmlToXtumlMapper mapper
	private AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null, "Engine cannot be null!")
		init(null, engine)
	}
	
	new(UmlValueDescriptorFactory parent) {
		checkArgument(parent!=null, "Parent cannot be null!")
		init(parent, parent.engine)
	}
	
	private def init(UmlValueDescriptorFactory parent, AdvancedIncQueryEngine engine) {
		checkArgument(engine!=null)
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new XtumlValueDescriptorFactory(parent.factory)
		} else {
			factory = new XtumlValueDescriptorFactory(engine)
		}
		mapper = new UmlToXtumlMapper(engine)
	}
	
	
	
	def prepareSingleValueDescriptorForNewLocalVariable(Element type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(xtumlType, localVariableName)
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Element type) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(xtumlType)
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Element type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForExistingVariable(xtumlType, localVariableName)
	}
	
	def prepareSingleValueDescriptorForLiteral(Element type, String literal) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForLiteral(xtumlType, literal)
	}
}