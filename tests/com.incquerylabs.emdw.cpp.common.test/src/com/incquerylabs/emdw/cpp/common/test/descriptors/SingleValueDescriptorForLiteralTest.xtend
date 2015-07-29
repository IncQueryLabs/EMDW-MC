package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.UmlValueDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.SingleValueDescriptor
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*
import static org.junit.Assert.*

@SuiteClasses(#[
	SingleValueDescriptorForBooleanLiteralTest,
	SingleValueDescriptorForIntegerLiteralTest,
	SingleValueDescriptorForRealLiteralTest,
	SingleValueDescriptorForSimpleStringLiteralTest,
	SingleValueDescriptorForHeavyStringLiteralTest
])
@RunWith(Suite)
class SingleValueDescriptorForLiteralTestSuite {}

@RunWith(Parameterized)
class SingleValueDescriptorForBooleanLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Boolean")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "true")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		assertTrue("Descriptor's value type should be bool.", descriptor.valueType=="bool")
		assertTrue("Descriptor's string representation should be true.", descriptor.stringRepresentation=="true")
	}
	
}

@RunWith(Parameterized)
class SingleValueDescriptorForIntegerLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Integer")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "1")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		assertTrue("Descriptor's value type should be long.", descriptor.valueType=="long")
		assertTrue("Descriptor's string representation should be 1.", descriptor.stringRepresentation=="1")
	}
	
}

@RunWith(Parameterized)
class SingleValueDescriptorForRealLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Real")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "1.1")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		assertTrue("Descriptor's value type should be double.", descriptor.valueType=="double")
		assertTrue("Descriptor's string representation should be 1.1.", descriptor.stringRepresentation=="1.1")
	}
	
}

@RunWith(Parameterized)
class SingleValueDescriptorForSimpleStringLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "String")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "simple string")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		assertTrue("Descriptor's value type should be std::string.", descriptor.valueType=="std::string")
		assertTrue('''Descriptor's string representation should be "simple string".''', descriptor.stringRepresentation=="\"simple string\"")
	}
	
}

@RunWith(Parameterized)
class SingleValueDescriptorForHeavyStringLiteralTest extends ValueDescriptorBaseTest<Element, SingleValueDescriptor> {
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "String")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(UmlValueDescriptorFactory factory, Element element) {
		return factory.prepareSingleValueDescriptorForLiteral(element, "heavy \" string")
	}
	
	override protected assertResult(Element object, SingleValueDescriptor descriptor) {
		println(descriptor.stringRepresentation)
		assertTrue("Descriptor's value type should be std::string.", descriptor.valueType=="std::string")
		assertTrue('''Descriptor's string representation should be "heavy \" string".''', descriptor.stringRepresentation=="\"heavy \" string\"")
	}
	
}