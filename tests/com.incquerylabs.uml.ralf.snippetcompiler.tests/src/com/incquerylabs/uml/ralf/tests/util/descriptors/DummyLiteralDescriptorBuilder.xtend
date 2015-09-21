package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlLiteralDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyLiteralDescriptorBuilder implements IUmlLiteralDescriptorBuilder{
	private String literal
	private Type type
	private DummyUmlValueDescriptorFactory descrFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE

	override setType(Type type) {
		this.type=type
		this
	}
	
	override setLiteral(String literal) {
		this.literal=literal
		this
	}
	
	def setDescrFactory(DummyUmlValueDescriptorFactory descrFactory) {
		this.descrFactory = descrFactory
		this
	}
	
	override build() {
		val descr = factory.createLiteralDescriptor()
		descr.stringRepresentation = literal
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
}