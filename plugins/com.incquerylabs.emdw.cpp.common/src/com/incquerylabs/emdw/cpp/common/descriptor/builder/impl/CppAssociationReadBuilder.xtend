package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.ericsson.xtumlrt.oopl.OOPLClassReferenceCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.incquerylabs.emdw.cpp.common.TypeConverter
import com.incquerylabs.emdw.cpp.common.descriptor.builder.IOoplAssociationReadBuilder
import com.incquerylabs.emdw.cpp.common.mapper.XtumlToOoplMapper
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation

class CppAssociationReadBuilder implements IOoplAssociationReadBuilder {
	protected static extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	private XtumlToOoplMapper mapper
	private TypeConverter converter
	
	private ValueDescriptor variable
	private XTAssociation association
	
	
	new(AdvancedIncQueryEngine engine) {
		mapper = new XtumlToOoplMapper(engine)
		converter = new TypeConverter
	}
	
	override build() {
		val cppAssociation = mapper.convertAssociation(association)
		if(cppAssociation instanceof CPPQualifiedNamedElement) {
			val refStorage = cppAssociation.referenceStorage.head
			val type = refStorage.type
			val String stringRepresentation = '''«variable.stringRepresentation»->«cppAssociation.cppName»'''
			val variableRepresentations = converter.createStringRepresentations(stringRepresentation, type)
			val svd = factory.createPropertyReadDescriptor => [
				it.baseType = converter.convertToBaseType(type)
				it.fullType = converter.convertToType(type)
				it.stringRepresentation = stringRepresentation
				it.pointerRepresentation = variableRepresentations.pointerRepresentation
				it.valueRepresentation = variableRepresentations.valueRepresentation
			]
			if(type instanceof OOPLClassReferenceCollection) {
				svd.templateTypes.add(converter.convertToType(type.ooplClass))
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
	
}