package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	CollectionLiteralTest
])
@RunWith(Suite)
class CollectionLiteralTestSuite {}

class CollectionLiteralTest extends ValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val SINGLE_VARIABLE_NAME = "classVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = '''__ralf__0____std__set'''
	private static final val EXPECTED_BUILDER_CONTENT = '''::std::set< ::test::TestComponent::TestClass* > __ralf__0____std__set = { classVariable };
														'''
	private StringBuilder builder = new StringBuilder
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = SINGLE_VARIABLE_NAME
			it.type = element
		]).build
		val cvd = (factory.createCollectionLiteralBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			it.elements = svd
			it.stringBuilder = builder
		]).build
		return cvd
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
		assertEquals(EXPECTED_BUILDER_CONTENT, builder.toString)
	}
	
}