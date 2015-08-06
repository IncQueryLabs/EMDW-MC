package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.cpp.common.test.wrappers.TransformationWrapper
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static com.incquerylabs.emdw.cpp.common.test.CommonTestUtil.*
import static org.junit.Assert.*

@SuiteClasses(#[
	SingleVariableDescriptorForBooleanLiteralTest,
	SingleVariableDescriptorForIntegerLiteralTest,
	SingleVariableDescriptorForRealLiteralTest,
	SingleVariableDescriptorForSimpleStringLiteralTest,
	SingleVariableDescriptorForHeavyStringLiteralTest,
	SingleVariableDescriptorForNumberLiteralCacheTest
])
@RunWith(Suite)
class SingleVariableDescriptorForLiteralTestSuite {}

@RunWith(Parameterized)
class SingleVariableDescriptorForBooleanLiteralTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "true"
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Boolean")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be bool.", descriptor.baseType=="bool")
		assertTrue("Descriptor's string representation should be true.", descriptor.stringRepresentation=="true")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

@RunWith(Parameterized)
class SingleVariableDescriptorForIntegerLiteralTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "1"
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Integer")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be long.", descriptor.baseType=="long")
		assertTrue("Descriptor's string representation should be 1.", descriptor.stringRepresentation=="1")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

@RunWith(Parameterized)
class SingleVariableDescriptorForRealLiteralTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "1.1"
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Real")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be double.", descriptor.baseType=="double")
		assertTrue("Descriptor's string representation should be 1.1.", descriptor.stringRepresentation=="1.1")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

@RunWith(Parameterized)
class SingleVariableDescriptorForSimpleStringLiteralTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "simple string"
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "String")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be std::string.", descriptor.baseType=="::std::string")
		assertTrue('''Descriptor's string representation should be "simple string".''', descriptor.stringRepresentation=="\"simple string\"")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

@RunWith(Parameterized)
class SingleVariableDescriptorForHeavyStringLiteralTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "heavy \" string"
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "String")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be std::string.", descriptor.baseType=="::std::string")
		assertTrue('''Descriptor's string representation should be "heavy \" string".''', descriptor.stringRepresentation=="\"heavy \" string\"")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
	}
	
}

@RunWith(Parameterized)
class SingleVariableDescriptorForNumberLiteralCacheTest extends ValueDescriptorBaseTest<PrimitiveType, SingleVariableDescriptor> {
	private static final String LITERAL = "1"
	private PrimitiveType real
	private SingleVariableDescriptor realDescriptor
	
	new(TransformationWrapper wrapper, String wrapperType) {
		super(wrapper, wrapperType)
	}
	
	override protected createUmlObject(Model umlModel) {
		val pT = findPrimitiveType(umlModel, "Integer")
		real = findPrimitiveType(umlModel, "Real")
		return pT
	}
	
	override protected prepareSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		realDescriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = real
			literal = LITERAL
		]).build
		return svd
	}
	
	override protected assertResult(PrimitiveType object, SingleVariableDescriptor descriptor) {
		assertTrue("Descriptor's value type should be long.", descriptor.baseType=="long")
		assertTrue("Descriptor's string representation should be 1.", descriptor.stringRepresentation=="1")
	}
	
	override protected getCachedSingleValueDescriptor(IUmlDescriptorFactory factory, PrimitiveType element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			literal = LITERAL
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertTrue('''Descriptors should be the same but the original is «originalDescriptor» and the cached is «cachedDescriptor».''', 
					originalDescriptor.equals(cachedDescriptor))
		assertFalse('''Real's descriptor and Integer's descriptor cannot be the same.''', 
					originalDescriptor.equals(realDescriptor))
	}
	
}