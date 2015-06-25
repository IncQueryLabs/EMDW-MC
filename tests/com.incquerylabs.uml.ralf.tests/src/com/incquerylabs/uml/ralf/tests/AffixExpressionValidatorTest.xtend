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
class AffixExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//Affix increment operator
	
	@Test
	def affixIncrementInteger() {
		val model = parseHelper.parse('''++1;''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def affixIncrementReal() {
		val model = parseHelper.parse('''++1.1;''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def affixIncrementParenthesisInt() {
		val model = parseHelper.parse('''++(1);''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementParenthesisReal() {
		val model = parseHelper.parse('''++(1.1);''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementNameInteger() {
		val model = parseHelper.parse('''
		Integer x = 1;
		++x;
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def affixIncrementBooleanUnary() {
		val model = parseHelper.parse('''++!true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementBoolean() {
		val model = parseHelper.parse('''++true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementString() {
		val model = parseHelper.parse('''++"String";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementParenthesisInvalidType() {
		val model = parseHelper.parse('''++("1");''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementNumericUnaryNegative() {
		val model = parseHelper.parse('''++-1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementNumericUnaryPositive() {
		val model = parseHelper.parse('''+++1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementAffixIncrement() {
		
		val model = parseHelper.parse('''++++1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def affixIncrementAffixDecrement() {
		val model = parseHelper.parse('''++--1;''')
		tester.validate(model).assertError(0)
		
	}
	
	@Test
	def affixIncrementVariableInvalidType() {
		val model = parseHelper.parse('''
		String x = "1";
		++x;
		''')
		tester.validate(model).assertError(0)
	}
}