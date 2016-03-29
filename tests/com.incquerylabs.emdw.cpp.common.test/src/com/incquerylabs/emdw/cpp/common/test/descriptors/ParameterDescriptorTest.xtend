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
import com.incquerylabs.emdw.valuedescriptor.ParameterDescriptor
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

import static org.junit.Assert.*

@SuiteClasses(#[
	ParameterDescriptorTest
])
@RunWith(Suite)
class ParameterDescriptorTestSuite {}

class ParameterDescriptorTest extends ValueDescriptorBaseTest<Parameter, ParameterDescriptor> {
	private static final val COMPONENT_NAME = "TestComponent"
	private static final val CLASS_NAME = "TestClass"
	private static final val OPERATION_NAME = "withoutParam"
	private static final val OPERATION_TYPE = "Void"
	private static final val PARAMETER_NAME = "param"
	private static final val PARAMETER_TYPE = "Boolean"
	
	private static final val EXPECTED_TYPE = '''bool'''
	private static final val EXPECTED_REPRESENTATION = '''«PARAMETER_NAME»'''
	
	override protected createUmlObject(Model umlModel) {
		val comp = umlModel.createComponent(COMPONENT_NAME)
		val umlClass = comp.createClass(CLASS_NAME)
		val voidPT = findPrimitiveType(umlModel, OPERATION_TYPE)
		val parameterType = findPrimitiveType(umlModel, PARAMETER_TYPE)
		val returnParam = voidPT.createParameter("returnParam", ParameterDirectionKind.RETURN_LITERAL, 1, 1)
		val parameter = parameterType.createParameter(PARAMETER_NAME, ParameterDirectionKind.IN_LITERAL, 1, 1)
		umlClass.createOperation(OPERATION_NAME, returnParam, parameter)
		return parameter
	}
	
	override protected prepareValueDescriptor(IUmlDescriptorFactory factory, Parameter param) {
		val descriptor = (factory.createParameterDescriptorBuilder => [
			it.parameter = param
		]).build
		return descriptor
	}
	
	override protected assertResult(Parameter object, ParameterDescriptor descriptor) {
		assertEquals(EXPECTED_TYPE, descriptor.fullType)
		assertEquals(EXPECTED_REPRESENTATION, descriptor.stringRepresentation)
	}
}