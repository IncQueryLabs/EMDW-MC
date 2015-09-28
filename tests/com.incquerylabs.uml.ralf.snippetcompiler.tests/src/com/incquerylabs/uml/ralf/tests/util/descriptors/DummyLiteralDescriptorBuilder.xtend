package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyLiteralDescriptorBuilder implements IUmlLiteralDescriptorBuilder{
	private String literal
	private Type type
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE

	override setType(Type type) {
		this.type=type
		this
	}
	
	override setLiteral(String literal) {
		this.literal=literal
		this
	}
	
	override build() {
		val descr = factory.createLiteralDescriptor()
		descr.stringRepresentation = literal
		descr.valueRepresentation = '''value{«descr.stringRepresentation»}'''
		descr.pointerRepresentation = '''pointer{«descr.stringRepresentation»}'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
}