package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.PropertyWriteDescriptor
import org.eclipse.uml2.uml.Property
import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Class
import org.junit.runners.Parameterized
import org.junit.runner.RunWith
import org.junit.runners.Suite.SuiteClasses
import org.junit.runners.Suite

import static org.junit.Assert.*

import static extension com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*
import org.junit.Ignore
import org.junit.Test
import org.eclipse.uml2.uml.PrimitiveType

@SuiteClasses(#[
	PropertyWriteDescriptorForAttributeTest,
	PropertyWriteDescriptorForAssociationTest
])
@RunWith(Suite)
class PropertyWriteDescriptorTestSuite {}

@RunWith(Parameterized)
class PropertyWriteDescriptorForAttributeTest extends ValueDescriptorBaseTest<Property, PropertyWriteDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val PROPERTY_NAME = "isOk"
	private static final val PROPERTY_TYPE = "Boolean"
	private static final val LITERAL = "true"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«PROPERTY_NAME» = «LITERAL»'''
	private Class umlClass
	private PrimitiveType propertyType
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		propertyType = findPrimitiveType(umlModel, PROPERTY_TYPE)
		val prop = umlClass.createAttribute(propertyType, PROPERTY_NAME)
		return prop
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Property object) {
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val ptDescriptor = (factory.createLiteralDescriptorBuilder => [
			it.literal = LITERAL
			it.type = propertyType
		]).build
		val descriptor = (factory.createPropertyWriteBuilder => [
			it.property = object
			it.variable = classDescriptor
			it.newValue = ptDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Property object, PropertyWriteDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.fullType».''', 
					descriptor.fullType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION» instead of «descriptor.stringRepresentation».''',
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION
		)
	}
	
	@Ignore("There is no caching function in Descriptor API for property read descriptors.")
	@Test
	override cache() {
		
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Property object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(PropertyWriteDescriptor originalDescriptor, PropertyWriteDescriptor cachedDescriptor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}

@RunWith(Parameterized)
class PropertyWriteDescriptorForAssociationTest extends ValueDescriptorBaseTest<Property, PropertyWriteDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val PROPERTY_NAME = "dummy"
	private static final val ASSOCIATION_NAME = "myAssoc"
	private static final val OTHER_CLASS_NAME = "DummyClass"
	private static final val VARIABLE_NAME = "testClassVariable"
	private static final val OTHER_VARIABLE_NAME = "dummyClassVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«OTHER_CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»->«ASSOCIATION_NAME»_«PROPERTY_NAME» = «OTHER_VARIABLE_NAME»'''
	private Class umlClass
	private Class otherClass
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		umlClass = comp.createClass(CLASS_NAME)
		otherClass = comp.createClass(OTHER_CLASS_NAME)
		val prop = comp.createAssociation(umlClass, otherClass, ASSOCIATION_NAME, PROPERTY_NAME, "test")
		return prop
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Property object) {
		val classDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = VARIABLE_NAME
			it.type = umlClass
		]).build
		val otherClassDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = OTHER_VARIABLE_NAME
			it.type = otherClass
		]).build
		val descriptor = (factory.createPropertyWriteBuilder => [
			it.property = object
			it.variable = classDescriptor
			it.newValue = otherClassDescriptor
		]).build
		return descriptor
	}
	
	override protected assertResult(Property object, PropertyWriteDescriptor descriptor) {
		assertTrue('''Descriptor's value type should be «EXPECTED_TYPE» instead of «descriptor.fullType».''', 
					descriptor.fullType==EXPECTED_TYPE)
		assertTrue('''Descriptor's string representation should be «EXPECTED_REPRESENTATION» instead of «descriptor.stringRepresentation».''',
					descriptor.stringRepresentation==EXPECTED_REPRESENTATION
		)
	}
	
	@Ignore("There is no caching function in Descriptor API for property read descriptors.")
	@Test
	override cache() {
		
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Property object) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
	override protected assertResult(PropertyWriteDescriptor originalDescriptor, PropertyWriteDescriptor cachedDescriptor) {
		throw new UnsupportedOperationException("TODO: auto-generated method stub")
	}
	
}