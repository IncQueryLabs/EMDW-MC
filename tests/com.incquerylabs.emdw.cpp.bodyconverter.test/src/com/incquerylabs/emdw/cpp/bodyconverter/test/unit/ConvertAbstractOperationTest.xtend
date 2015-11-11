package com.incquerylabs.emdw.cpp.bodyconverter.test.unit

import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.incquerylabs.emdw.cpp.bodyconverter.test.AbstractConversionTest
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import org.junit.Test

import static org.junit.Assert.*
import org.eclipse.uml2.uml.Operation

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
		val scopedCppObject = resolveCppTarget(scopedUmlObject, conversionType) as CPPOperation
		
		// Act
		bodyConverter.convertOperation(scopedCppObject)
		
		// Assert
		assertNull("Added body for abstract operation", scopedCppObject.compiledBody)
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
		val scopedCppObject = resolveCppTarget(scopedUmlObject, conversionType) as CPPOperation
		bodyConverter.convertOperation(scopedCppObject)
		
		scopedUmlObject.isAbstract = true
		scopedUmlObject.methods.clear
		
		// Act
		bodyConverter.convertOperation(scopedCppObject)
		
		// Assert
		assertNull("Added body for abstract operation", scopedCppObject.compiledBody)
	}
}