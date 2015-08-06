package com.incquerylabs.emdw.cpp.common.modelaccess.builder.impl

import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefAssocCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.cpp.common.modelaccess.builder.IOoplAssociationWriteBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

class CppAssociationWriteBuilder implements IOoplAssociationWriteBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor variable
	private XTAssociation association
	private ValueDescriptor newValue
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	
	override build() {
		val cppAssociation = mapper.convertAssociation(association)
		if(cppAssociation instanceof CPPQualifiedNamedElement) {
			val refStorage = cppAssociation.referenceStorage.head
			val type = refStorage.type
			val svd = factory.createPropertyWriteDescriptor => [
				it.fullType = converter.convertType(type)
				it.stringRepresentation = '''«variable.stringRepresentation»->«cppAssociation.cppName» = «newValue.stringRepresentation»'''
			]
			if(type instanceof CPPClassRefAssocCollection) {
				svd.baseType = type.cppContainer
				svd.templateTypes.add(converter.convertType(type.ooplClass))
			} else if(type instanceof CPPClassRefSimpleCollection) {
				svd.baseType = type.cppContainer
				svd.templateTypes.add(converter.convertType(type.ooplClass))
			} else {
				svd.baseType = converter.convertType(type)
			}
			refStorage.required = true
			return svd
		}
		throw new IllegalArgumentException('''«association» has no cpp pair.''')
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		return this
	}
	
	override setAssociation(XTAssociation association) {
		this.association = association
		return this
	}
	
	override setNewValue(ValueDescriptor newValue) {
		this.newValue = newValue
		return this
	}
	
}