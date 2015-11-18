package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlEnumerationLiteralDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.EnumerationLiteral

class DummyEnumLiteralBuilder implements IUmlEnumerationLiteralDescriptorBuilder {
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	EnumerationLiteral enumLiteral
	
	override build() {
		val type = enumLiteral.classifier.qualifiedName
		val name = enumLiteral.qualifiedName
		createLiteralDescriptor => [
			it.baseType = type
			it.fullType = type
			it.stringRepresentation = name
			it.valueRepresentation = name
			it.pointerRepresentation = name			
		]
	}
	
	override setEnumerationLiteral(EnumerationLiteral enumLiteral) {
		this.enumLiteral = enumLiteral
		this
	}
	
}