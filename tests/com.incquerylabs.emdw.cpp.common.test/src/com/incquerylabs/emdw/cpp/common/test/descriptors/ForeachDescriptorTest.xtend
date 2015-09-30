package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	ForeachDescriptorTest
])
@RunWith(Suite)
class ForeachDescriptorTestSuite {}

class ForeachDescriptorTest extends ValueDescriptorBaseTest<Class, OperationCallDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val SVARIABLE_NAME = "element"
	private static final val CVARIABLE_NAME = "collection"
	
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''for(::test::«COMPONENT_NAME»::«CLASS_NAME»* «SVARIABLE_NAME» : «CVARIABLE_NAME»)'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val umlClass = comp.createClass(CLASS_NAME)
		
		return umlClass
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class cl) {
		val cvd = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(cl, COLLECTION_TYPE)
			it.elementType = cl
			it.name = CVARIABLE_NAME
			it.isExistingVariable = true
		]).build
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			it.type = cl
			it.name = SVARIABLE_NAME
			it.isExistingVariable = true
		]).build
		val descriptor = (factory.createForeachBuilder => [
			it.collectionDescriptor = cvd
			it.variableDescriptor = svd
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}