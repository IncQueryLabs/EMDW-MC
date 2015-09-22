package com.incquerylabs.emdw.cpp.common.descriptor.builder.impl

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCastDescriptorBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

@Deprecated
class UmlCastDescriptorBuilder implements IUmlCastDescriptorBuilder {
	//TODO this is only a DUMMY class
	Type type
	ValueDescriptor descriptor
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override setDescriptor(ValueDescriptor castableDEscriptor) {
		this.descriptor = castableDEscriptor
		this
	}
	
	override setCastingType(Type castingType) {
		this.type = castingType
		this
	}
	
	override build() {
		val descr = factory.createSingleVariableDescriptor()
		descr.stringRepresentation = '''(«type.qualifiedName») «descriptor.stringRepresentation»'''
		if(type != null){
			descr.baseType = type.qualifiedName
			descr.fullType = type.qualifiedName
		}
		descr
	}
	
	
}