package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlCollectionLiteralBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import java.util.List
import org.eclipse.uml2.uml.Type

class DummyCollectionLiteralDescriptorBuilder implements IUmlCollectionLiteralBuilder{
	private Type collectionType
	private Type elementType
	private List<ValueDescriptor> elements
	private DummyUmlValueDescriptorFactory descrFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val descr = factory.createLiteralDescriptor()
		descr.stringRepresentation = '''«collectionType.qualifiedName»<«elementType.qualifiedName»> {«FOR d : elements SEPARATOR ', '»«d.stringRepresentation»«ENDFOR» }'''
		if(collectionType != null && elementType !=null){
			descr.baseType = collectionType.qualifiedName
			descr.fullType = '''«collectionType.qualifiedName»<«elementType.qualifiedName»>'''
		}
		descr
	}
	
	def setDescrFactory(DummyUmlValueDescriptorFactory descrFactory) {
		this.descrFactory = descrFactory
		this
	}
	
	override setCollectionType(Type collectionType) {
		this.collectionType = collectionType
		this
	}
	
	override setElementType(Type elementType) {
		this.elementType = elementType
		this
	}
	
	override setElements(ValueDescriptor... elems) {
		this.elements = elems.toList
		this
	}
	
}