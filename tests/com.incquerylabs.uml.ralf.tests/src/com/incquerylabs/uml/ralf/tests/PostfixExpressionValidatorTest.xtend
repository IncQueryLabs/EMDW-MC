package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class PostfixExpressionValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//postfix increment operator
	
	@Test
	def postfixIncrementInteger() {
		val model = parseHelper.parse('''1++;''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def postfixIncrementReal() {
		val model = parseHelper.parse('''1.1++;''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def postfixIncrementParenthesisInt() {
		val model = parseHelper.parse('''(1)++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementParenthesisReal() {
		val model = parseHelper.parse('''(1.1)++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementNameInteger() {
		val model = parseHelper.parse('''
		Integer x = 1;
		x++;
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def postfixIncrementBooleanUnary() {
		val model = parseHelper.parse('''!true++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementBoolean() {
		val model = parseHelper.parse('''true++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementString() {
		val model = parseHelper.parse('''"String"++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementParenthesisInvalidType() {
		val model = parseHelper.parse('''("1")++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementNumericUnaryNegative() {
		val model = parseHelper.parse('''-1++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementNumericUnaryPositive() {
		val model = parseHelper.parse('''+1++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementpostfixIncrement() {
		
		val model = parseHelper.parse('''++1++;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def postfixIncrementpostfixDecrement() {
		val model = parseHelper.parse('''--1++;''')
		tester.validate(model).assertError(0)
		
	}
	
	@Test
	def postfixIncrementVariableInvalidType() {
		val model = parseHelper.parse('''
		String x = "1";
		x++;
		''')
		tester.validate(model).assertError(0)
	}
}