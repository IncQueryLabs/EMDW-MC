package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCastDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyCastDescriptorBuilder implements IUmlCastDescriptorBuilder{
	Type type
	ValueDescriptor descr
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = '''(«type.qualifiedName») «descr.stringRepresentation»;'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	override setDescriptor(ValueDescriptor castableDEscriptor) {
		this.descr = castableDEscriptor
		this
	}
	
	override setCastingType(Type castingType) {
		this.type = castingType
		this
	}
	
}