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
import com.incquerylabs.emdw.cpp.common.test.ValueDescriptorBaseTest
import com.incquerylabs.emdw.valuedescriptor.OperationCallDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	DeleteDescriptorTest
])
@RunWith(Suite)
class DeleteDescriptorTestSuite {}

class DeleteDescriptorTest extends ValueDescriptorBaseTest<Class, OperationCallDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "deletable"
	
	private static final val EXPECTED_TYPE = '''void'''
	private static final val EXPECTED_REPRESENTATION = '''delete «VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val umlClass = comp.createClass(CLASS_NAME)
		
		return umlClass
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class cl) {
		val svd = (factory.createSingleVariableDescriptorBuilder => [
			it.type = cl
			it.name = VARIABLE_NAME
		]).build
		val descriptor = (factory.createDeleteBuilder => [
			it.variable = svd
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, OperationCallDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}