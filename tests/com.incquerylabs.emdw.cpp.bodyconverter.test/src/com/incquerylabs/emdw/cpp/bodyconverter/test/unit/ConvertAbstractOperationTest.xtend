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
package com.incquerylabs.emdw.cpp.bodyconverter.test.unit

import com.incquerylabs.emdw.cpp.bodyconverter.test.AbstractConversionTest
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import org.eclipse.uml2.uml.Operation
import org.junit.Test

import static org.junit.Assert.*

class ConvertAbstractOperationTest extends AbstractConversionTest {
	
	@Test
	def abstractOperation_noCompiledBody() {
		// Arrange
		val modelPath = "/com.incquerylabs.emdw.cpp.bodyconverter.test/models/AbstractOperation/AbstractOperation.uml"
		val scopedUmlObjectFQN = "AbstractOperationModel::AbstractOperationComponent::AbstractOperationClass::abstractOperation"
		val conversionType = ConversionType.Operation
		
		initTrafos(modelPath)
		bodyConverter = new BodyConverter
		bodyConverter.initialize(engine, context)
		val scopedUmlObject = resolveUmlTarget(scopedUmlObjectFQN, conversionType)
		
		executeTrafos()
		val scopedCppObject = resolveXumlrtTarget(scopedUmlObject, conversionType) as org.eclipse.papyrusrt.xtumlrt.common.Operation
		
		// Act
		val compiledBody = bodyConverter.convertOperation(scopedCppObject)
		
		// Assert
		assertNull("Added body for abstract operation", compiledBody)
	}
	
	@Test
	def modifiedToAbstractOperation_noCompiledBody() {
		// Arrange
		val modelPath = "/com.incquerylabs.emdw.cpp.bodyconverter.test/models/AbstractOperation/AbstractOperation.uml"
		val scopedUmlObjectFQN = "AbstractOperationModel::AbstractOperationComponent::AbstractOperationClass::notAbstractOperation"
		val conversionType = ConversionType.Operation
		
		initTrafos(modelPath)
		bodyConverter = new BodyConverter
		bodyConverter.initialize(engine, context)
		val scopedUmlObject = resolveUmlTarget(scopedUmlObjectFQN, conversionType) as Operation
		executeTrafos()
		val scopedCppObject = resolveXumlrtTarget(scopedUmlObject, conversionType) as org.eclipse.papyrusrt.xtumlrt.common.Operation
		val firstCompiledBody = bodyConverter.convertOperation(scopedCppObject)
		
		scopedUmlObject.isAbstract = true
		scopedUmlObject.methods.clear
		
		// Act
		val abstractCompiledBody = bodyConverter.convertOperation(scopedCppObject)
		
		// Assert
		assertNotNull("There was no body created for non-abstract operation", firstCompiledBody)
		assertNull("Added body for abstract operation", abstractCompiledBody)
	}
}