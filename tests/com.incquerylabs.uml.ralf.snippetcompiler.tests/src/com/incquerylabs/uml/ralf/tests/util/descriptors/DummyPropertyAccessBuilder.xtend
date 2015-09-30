package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlPropertyReadBuilder
import com.incquerylabs.emdw.valuedescriptor.ValueDescriptor
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Property

class DummyPropertyAccessBuilder implements IUmlPropertyReadBuilder{
	ValueDescriptor variable
	Property property
	private DummyUmlValueDescriptorFactory descrFactory
	
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	override build() {
		val desc = createPropertyReadDescriptor => [
			baseType = property.type.qualifiedName
			fullType = property.type.qualifiedName
			stringRepresentation = variable.stringRepresentation+'''->'''+property.name
			valueRepresentation = '''value{«stringRepresentation»}'''
			pointerRepresentation = '''pointer{«stringRepresentation»}'''
		]
		descrFactory.cache.add(desc)
		return desc
	}
	
	def setDescrFactory(DummyUmlValueDescriptorFactory descrFactory) {
		this.descrFactory = descrFactory
		this
	}
	
	override setVariable(ValueDescriptor variable) {
		this.variable = variable
		this
	}
	
	override setProperty(Property property) {
		this.property = property
		this
	}
	
}