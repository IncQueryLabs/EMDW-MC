package com.incquerylabs.emdw.valuedescriptor.factory.cpp

import com.ericsson.xtumlrt.oopl.OOPLType
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.OOPLClass
import com.ericsson.xtumlrt.oopl.util.OoplAdapterFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute

class CPPValueDescriptorFactory {
	static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private CPPValueDescriptorFactory parent
	private int index
	
	new() {
		this(null, 0)
	}
	
	new(int start_index) {
		this(null, start_index)
	}
	
	new(CPPValueDescriptorFactory parent) {
		this(parent, 0)
	}
	
	new(CPPValueDescriptorFactory parent, int start_index) {
		index = start_index
		this.parent = parent
	}
	
	
	def int getActualIndex() {
		return index
	}
	
	def prepareSingleValueDescriptor(OOPLType type, String localVariableName) {
		val preparedDescriptor = factory.createSingleValueDescriptor => [
				it.stringRepresentation = '''___ralf___«index.qualifiedIndex»___«localVariableName»'''
				it.valueType = (type as CPPQualifiedNamedElement).cppQualifiedName
		]
		return preparedDescriptor
	}
	
//	def prepareSingleValueDescriptor(CPPAttribute type) {
//		val preparedDescriptor = factory.createSingleValueDescriptor => [
//				it.stringRepresentation = '''«localVariableName»'''
//				it.valueType = (type as CPPQualifiedNamedElement).cppQualifiedName
//		]
//		return preparedDescriptor
//	}
	
	def String qualifiedIndex(Integer index) {
		if(parent!=null) {
			return '''«parent.index.qualifiedIndex»___«index»'''
		}
		return index.toString
	}
	
}