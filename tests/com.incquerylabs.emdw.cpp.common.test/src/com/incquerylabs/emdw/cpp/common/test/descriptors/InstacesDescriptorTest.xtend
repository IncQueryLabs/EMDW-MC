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
import com.incquerylabs.emdw.valuedescriptor.CollectionVariableDescriptor
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	InstancesDescriptorTest
])
@RunWith(Suite)
class InstancesDescriptorTestSuite {}

class InstancesDescriptorTest extends ValueDescriptorBaseTest<Class, CollectionVariableDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val VARIABLE_NAME = "_instances"
	
	private static final val CLASS_FQN = '''::test::«COMPONENT_NAME»::«CLASS_NAME»'''
	private static final val EXPECTED_TYPE = '''::std::list< «CLASS_FQN»* >'''
	private static final val EXPECTED_REPRESENTATION = '''«CLASS_FQN»::«VARIABLE_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val umlClass = comp.createClass(CLASS_NAME)
		
		return umlClass
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Class cl) {
		val descriptor = (factory.createInstancesBuilder => [
			it.umlClass = cl
		]).build
		return descriptor
	}
	
	override protected assertResult(Class object, CollectionVariableDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}