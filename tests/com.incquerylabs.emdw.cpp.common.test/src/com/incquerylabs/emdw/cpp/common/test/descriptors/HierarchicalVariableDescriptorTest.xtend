/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.common.test.descriptors

import com.incquerylabs.emdw.cpp.common.descriptor.factory.IUmlDescriptorFactory
import com.incquerylabs.emdw.cpp.common.test.CachedValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.SingleVariableDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor

@SuiteClasses(#[
	SingleVariableDescriptorForExistingVariableCachedInParentTest,
	HierarchicalSignleVariableDescriptorForNewVariableWithPredifinedNameTest,
	CollectionVariableDescriptorForExistingVariableCachedInParentTest,
	HierarchicalCollectionVariableDescriptorForNewVariableWithPredifinedNameTest
])
@RunWith(Suite)
class HierarchicalVariableDescriptorTestSuite {}

class SingleVariableDescriptorForExistingVariableCachedInParentTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final String VARIABLE_NAME = "classVariable"
	private static final String EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(VARIABLE_NAME, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val subFactory = factory.createChild
		val chachedDescriptor = (subFactory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return chachedDescriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class HierarchicalSignleVariableDescriptorForNewVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Class, SingleVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val EXPECTED_TYPE = '''::test::«COMPONENT_NAME»::«CLASS_NAME»*'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»'''
	private IUmlDescriptorFactory subFactory
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		subFactory = factory.createChild
		val descriptor = (subFactory.createSingleVariableDescriptorBuilder => [
			type = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, SingleVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.baseType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (subFactory.createSingleVariableDescriptorBuilder => [
			type = element
			isExistingVariable = true
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(SingleVariableDescriptor originalDescriptor, SingleVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class CollectionVariableDescriptorForExistingVariableCachedInParentTest extends CachedValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = VARIABLE_NAME
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (factory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			it.isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val subFactory = factory.createChild
		val chachedDescriptor = (subFactory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return chachedDescriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}

class HierarchicalCollectionVariableDescriptorForNewVariableWithPredifinedNameTest extends CachedValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "classVariable"
	private static final val COLLECTION_TYPE = "std::collections::Set"
	private static final val EXPECTED_TYPE = '''::std::set< ::test::«COMPONENT_NAME»::«CLASS_NAME»* >'''
	private static final val EXPECTED_REPRESENTATION = '''«VARIABLE_NAME»'''
	private IUmlDescriptorFactory subFactory
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val cl = comp.createClass(CLASS_NAME)
		return cl
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		subFactory = factory.createChild
		val descriptor = (subFactory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
	
	override protected getCachedValueDescriptor(IUmlDescriptorFactory factory, Class element) {
		val descriptor = (subFactory.createCollectionVariableDescriptorBuilder => [
			it.collectionType = findCollectionType(element, COLLECTION_TYPE)
			it.elementType = element
			name = VARIABLE_NAME
			isExistingVariable = true
		]).build
		return descriptor
	}
	
	override protected assertResult(CollectionVariableDescriptor originalDescriptor, CollectionVariableDescriptor cachedDescriptor) {
		assertEquals(originalDescriptor, cachedDescriptor)
	}
	
}
