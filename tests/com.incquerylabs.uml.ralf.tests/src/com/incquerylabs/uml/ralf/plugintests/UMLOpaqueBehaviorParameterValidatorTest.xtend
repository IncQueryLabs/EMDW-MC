package com.incquerylabs.uml.ralf.plugintests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.context.TestModelUMLContextProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguagePluginInjectorProvider))
class UMLOpaqueBehaviorParameterValidatorTest {
	@Inject
	IReducedAlfParser parser
	@Inject
	TestModelUMLContextProvider context
	
	@Test
	def inParameterIntegerAssignment(){
		parameterOK(
		'''
			Integer x = 1;
			x = inParameter;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerAssignment_Real(){
		parameterOK(
		'''
			Real x = 1.1;
			x = inParameter;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerAssignment_InvalidType(){
		parameterError(
		'''
			String x = "1";
			x = inParameter;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerAddition(){
		parameterOK(
		'''
			inParameter + 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerMultiplication(){
		parameterOK(
		'''
			inParameter * 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerShift(){
		parameterOK(
		'''
			inParameter >> 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def inParameterIntegerRelational(){
		parameterOK(
		'''
			inParameter < 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Literal(){
		parameterOK(
		'''
			outParameter = 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_RealLiteral(){
		parameterError(
		'''
			outParameter = 1.1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_InvalidLiteral(){
		parameterError(
		'''
			outParameter = "1";
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Addition(){
		parameterOK(
		'''
			outParameter = 1 + 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Multiplication(){
		parameterOK(
		'''
			outParameter = 1 * 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Shift(){
		parameterOK(
		'''
			outParameter = 1 >> 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Operation(){
		parameterOK(
		'''
			outParameter = this.returnInteger();
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def outParameterIntegerAssignment_Operation_Invalid(){
		parameterError(
		'''
			outParameter = this.returnPong();
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_IntegerLiteral(){
		parameterOK(
		'''
			return 1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_RealLiteral(){
		parameterError(
		'''
			return 1.1;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_StringLiteral_Invalid(){
		parameterError(
		'''
			return "1";
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Integer_Addition(){
		parameterOK(
		'''
			return 1 + 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Integer_Multiplication(){
		parameterOK(
		'''
			return 1 * 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Integer_Shift(){
		parameterOK(
		'''
			return 1 >> 2;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Operation(){
		parameterOK(
		'''
			Integer x = this.returnInteger();
			return x;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Operation_Invalid(){
		parameterError(
		'''
			Pong x = this.returnPong();
			return x;
		''',
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	def returnParameter_Operation_Unexpected_ReturnValue(){
		parameterError(
		'''
			Pong x = this.returnPong();
			return x;
		''',
		"model::Comp::Pong::doIntegerVoid")
	}
	
	def parameterOK(String input, String opaqueFQN) {
		//Set Opaque behavior ID	
		context.definedOperation = opaqueFQN
		val result = parser.parse(input, context)
		assertTrue(result.toString, result.validationOK)
	}
	
	def parameterError(String input, String opaqueFQN) {	
		//Set Opaque behavior ID
		context.definedOperation = opaqueFQN
		assertTrue("NO Validation errors found", parser.parse(input, context).hasError)
	}
	
}