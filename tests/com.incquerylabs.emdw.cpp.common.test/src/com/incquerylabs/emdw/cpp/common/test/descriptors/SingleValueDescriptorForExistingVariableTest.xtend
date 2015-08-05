package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.factory.impl.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*

@RunWith(Parameterized)
class SingleValueDescriptorForExistingVariableTest extends ValueDescriptorBaseTest<Class, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent("TestComponent")
		val cl = comp.createClass("TestClass")
		return cl
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Class element) {
		return factory.prepareSingleValueDescriptorForExistingVariable(element, "classVariable")
	}
	
	override protected assertResult(Class object, SingleValueDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be ::test::TestComponent::TestClass instead of «descriptor.valueType».''', 
					descriptor.valueType=="::test::TestComponent::TestClass")
		assertTrue('''Descriptor's string representation should be classVariable.''', 
					descriptor.stringRepresentation=="classVariable")
	}
	
	override protected getCachedSingleValueDescriptor(UmlValueDescriptorFactory factory, Class element) {
		return factory.prepareSingleValueDescriptorForExistingVariable(element, "classVariable")
	}
	
	override protected assertResult(SingleValueDescriptor originalDescriptor, SingleValueDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}