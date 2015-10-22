package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Property
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*
import org.eclipse.uml2.uml.Component
import org.junit.Ignore

@SuiteClasses(#[
	LinkDescriptorForOne2OneAssociationTest,
	LinkDescriptorForOne2NothingAssociationTest,
	LinkDescriptorForOne2ManyAssociationTest,
	LinkDescriptorForMany2OneAssociationTest,
	LinkDescriptorForMany2ManyAssociationTest,
	UnlinkDescriptorForOne2OneAssociationTest,
	UnlinkDescriptorForOne2NothingAssociationTest,
	UnlinkDescriptorForOne2ManyAssociationTest,
	UnlinkDescriptorForMany2OneAssociationTest,
	UnlinkDescriptorForMany2ManyAssociationTest
])
@RunWith(Suite)
class LinkUnlinkDescriptorTestSuite {}

abstract class AbstractLinkUnlinkDescriptorTest extends ValueDescriptorBaseTest<Property, OperationCallDescriptor> {
	
	protected static final val COMPONENT_NAME = "TestComponent"
	protected static final val CLASS1_NAME = "Class1"
	protected static final val CLASS1_FQN = '''::test::«COMPONENT_NAME»::«CLASS1_NAME»'''
	protected static final val CLASS2_NAME = "Class2"
	protected static final val CLASS2_FQN = '''::test::«COMPONENT_NAME»::«CLASS2_NAME»'''
	protected static final val SOURCE_PROPERTY_NAME = "class1"
	protected static final val TARGET_PROPERTY_NAME = "class2"
	protected static final val ASSOCIATION_NAME = "myAssoc"
	protected static final val SOURCE_VARIABLE_NAME = "class1Variable"
	protected static final val TARGET_VARIABLE_NAME = "class2Variable"
	protected static final val EXPECTED_TYPE = "void"
	
	protected String EXPECTED_REPRESENTATION
	protected Class cl1
	protected Class cl2
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		cl1 = comp.createClass(CLASS1_NAME)
		cl2 = comp.createClass(CLASS2_NAME)
		val prop = comp.prepareAssociation
		setExpectedRepresentation
		return prop
	}
	
	def void setExpectedRepresentation()
	
	protected def Property prepareAssociation(Component component)
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Property prop) {
		val class1Descriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = SOURCE_VARIABLE_NAME
			it.type = cl1
		]).build
		val class2Descriptor = (factory.createSingleVariableDescriptorBuilder => [
			it.isExistingVariable = true
			it.name = TARGET_VARIABLE_NAME
			it.type = cl2
		]).build
		
		val descriptor = (factory.createLinkUnlinkBuilder => [
			it.association = prop.association
			it.sourceDescriptor = class1Descriptor
			it.sourceProperty = prop
			it.targetDescriptor = class2Descriptor
			it.targetProperty = prop.ownerAssociationOtherEnd
			it.isUnlink = isUnlinkTest
		]).build
		return descriptor
	}
	
	def boolean isUnlinkTest()
	
	override protected assertResult(Property object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}

class LinkDescriptorForOne2OneAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME» = «TARGET_VARIABLE_NAME»;
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = «SOURCE_VARIABLE_NAME»'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, TARGET_PROPERTY_NAME)
	}
	
	override isUnlinkTest() {
		false
	}
	
}

@Ignore("One directional association is not supported yet!")
class LinkDescriptorForOne2NothingAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = «SOURCE_VARIABLE_NAME»'''
	}
	
	override protected prepareAssociation(Component comp) {
		val sourceProperty = comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, TARGET_PROPERTY_NAME)
		sourceProperty.getAssociation().getOwnedEnds().get(1).isNavigable = false
		return sourceProperty
	}
	
	override isUnlinkTest() {
		false
	}
	
}

class LinkDescriptorForOne2ManyAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			::xumlrt::collections::list::basic_list::add(«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME», «TARGET_VARIABLE_NAME»);
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = «SOURCE_VARIABLE_NAME»'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 1, 1, TARGET_PROPERTY_NAME, 0, -1)
	}
	
	override isUnlinkTest() {
		false
	}
	
}

class LinkDescriptorForMany2OneAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
		'''
		«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME» = «TARGET_VARIABLE_NAME»;
		::xumlrt::collections::list::basic_list::add(«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME», «SOURCE_VARIABLE_NAME»)'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 0, -1, TARGET_PROPERTY_NAME, 1, 1)
	}
	
	override isUnlinkTest() {
		false
	}
	
}

class LinkDescriptorForMany2ManyAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
		'''
		::xumlrt::collections::list::basic_list::add(«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME», «TARGET_VARIABLE_NAME»);
		::xumlrt::collections::list::basic_list::add(«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME», «SOURCE_VARIABLE_NAME»)'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 0, -1, TARGET_PROPERTY_NAME, 0, -1)
	}
	
	override isUnlinkTest() {
		false
	}
	
}

class UnlinkDescriptorForOne2OneAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME» = nullptr;
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = nullptr'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, TARGET_PROPERTY_NAME)
	}
	
	override isUnlinkTest() {
		true
	}
	
}

@Ignore("One directional association is not supported yet!")
class UnlinkDescriptorForOne2NothingAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = nullptr'''
	}
	
	override protected prepareAssociation(Component comp) {
		val sourceProperty = comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, TARGET_PROPERTY_NAME)
		sourceProperty.getAssociation().getOwnedEnds().get(1).isNavigable = false
		return sourceProperty
	}
	
	override isUnlinkTest() {
		true
	}
	
}

class UnlinkDescriptorForOne2ManyAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
			'''
			::xumlrt::collections::list::basic_list::remove(«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME», «TARGET_VARIABLE_NAME»);
			«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME» = nullptr'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 1, 1, TARGET_PROPERTY_NAME, 0, -1)
	}
	
	override isUnlinkTest() {
		true
	}
	
}

class UnlinkDescriptorForMany2OneAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
		'''
		«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME» = nullptr;
		::xumlrt::collections::list::basic_list::remove(«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME», «SOURCE_VARIABLE_NAME»)'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 0, -1, TARGET_PROPERTY_NAME, 1, 1)
	}
	
	override isUnlinkTest() {
		true
	}
	
}

class UnlinkDescriptorForMany2ManyAssociationTest extends AbstractLinkUnlinkDescriptorTest {
	
	override setExpectedRepresentation() {
		EXPECTED_REPRESENTATION =
		'''
		::xumlrt::collections::list::basic_list::remove(«SOURCE_VARIABLE_NAME»->«ASSOCIATION_NAME»_«TARGET_PROPERTY_NAME», «TARGET_VARIABLE_NAME»);
		::xumlrt::collections::list::basic_list::remove(«TARGET_VARIABLE_NAME»->«ASSOCIATION_NAME»_«SOURCE_PROPERTY_NAME», «SOURCE_VARIABLE_NAME»)'''
	}
	
	override protected prepareAssociation(Component comp) {
		comp.createAssociation(cl1, cl2, ASSOCIATION_NAME, SOURCE_PROPERTY_NAME, 0, -1, TARGET_PROPERTY_NAME, 0, -1)
	}
	
	override isUnlinkTest() {
		true
	}
	
}