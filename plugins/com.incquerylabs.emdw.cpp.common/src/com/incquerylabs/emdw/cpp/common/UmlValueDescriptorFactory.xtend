package com.incquerylabs.emdw.cpp.common

import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.uml2.uml.Element
import static com.google.common.base.Preconditions.*
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import java.util.Map
import com.google.common.collect.Table
import com.google.common.collect.HashBasedTable

class UmlValueDescriptorFactory {
	private UmlValueDescriptorFactory parent
	private XtumlValueDescriptorFactory factory
	private UmlToXtumlMapper mapper
	private AdvancedIncQueryEngine engine
	private Map<String, SingleValueDescriptor> variableCache
	private Table<String, Element, SingleValueDescriptor> literalCache
	
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
		this.variableCache = newHashMap()
		this.parent = parent
		this.engine = engine
		if(parent!=null) {
			factory = new XtumlValueDescriptorFactory(parent.factory)
			this.literalCache = parent.literalCache
		} else {
			factory = new XtumlValueDescriptorFactory(engine)
			this.literalCache = HashBasedTable.create
		}
		mapper = new UmlToXtumlMapper(engine)
	}
	
	
	
	def prepareSingleValueDescriptorForNewLocalVariable(Element type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(xtumlType, localVariableName).cache(localVariableName)
	}
	
	def prepareSingleValueDescriptorForNewLocalVariable(Element type) {
		val xtumlType = mapper.convertType(type)
		return factory.prepareSingleValueDescriptorForNewLocalVariable(xtumlType)
	}
	
	def prepareSingleValueDescriptorForExistingVariable(Element type, String localVariableName) {
		val xtumlType = mapper.convertType(type)
		if(variableCache.containsKey(localVariableName)) {
			return variableCache.get(localVariableName)
		}
		return factory.prepareSingleValueDescriptorForExistingVariable(xtumlType, localVariableName).cache(localVariableName)
	}
	
	def prepareSingleValueDescriptorForLiteral(Element type, String literal) {
		val xtumlType = mapper.convertType(type)
		if(literalCache.contains(literal, type)) {
			return literalCache.get(literal, type)
		}
		return factory.prepareSingleValueDescriptorForLiteral(xtumlType, literal).cacheLiteral(literal, type)
	}
	
	
	
	private def SingleValueDescriptor cache(SingleValueDescriptor svd, String key) {
		variableCache.put(key, svd)
		return svd
	}
	
	private def SingleValueDescriptor cacheLiteral(SingleValueDescriptor svd, String rowkey, Element columnkey) {
		literalCache.put(rowkey, columnkey, svd)
		return svd
	}
}