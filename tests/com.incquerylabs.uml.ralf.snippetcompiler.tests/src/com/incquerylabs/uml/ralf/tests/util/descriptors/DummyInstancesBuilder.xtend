package com.incquerylabs.uml.ralf.tests.util.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.builder.IUmlInstancesBuilder
import com.incquerylabs.emdw.valuedescriptor.ValuedescriptorFactory
import org.eclipse.uml2.uml.Type

class DummyInstancesBuilder implements IUmlInstancesBuilder {
	extension ValuedescriptorFactory factory = ValuedescriptorFactory.eINSTANCE
	
	Type umlClass
	
	override setUmlClass(Type type) {
		this.umlClass = type
		this
	}
	
	override build() {
		val descriptor = createCollectionVariableDescriptor => [
			if(umlClass == null){
				throw new UnsupportedOperationException("Uml class must be set to build instances descriptor")
			}else{
				baseType = umlClass.qualifiedName
				fullType = umlClass.qualifiedName
			}
			stringRepresentation = '''«umlClass.qualifiedName»::_instances()'''
		]
		
		descriptor
	}
	
}