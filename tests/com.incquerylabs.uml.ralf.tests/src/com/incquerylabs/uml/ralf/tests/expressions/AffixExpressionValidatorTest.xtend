package com.incquerylabs.uml.ralf.tests.expressions

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
import com.incquerylabs.uml.ralf.ReducedAlfSystem

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
		affixIncrementExpressionError('''++1;''')
	}
		
	@Test
	def affixIncrementReal() {
		affixIncrementExpressionError('''++1.1;''')
	}
		
	@Test
	def affixIncrementParenthesisInt() {
		affixIncrementExpressionError('''++(1);''')
	}
	
	@Test
	def affixIncrementParenthesisReal() {
		affixIncrementExpressionError('''++(1.1);''')
	}
	
	@Test
	def affixIncrementNameInteger() {
		affixIncrementExpressionOK('''
		Integer x = 1;
		++x;
		''')
	}
	
	@Test
	def affixIncrementBooleanUnary() {
		affixIncrementExpressionError('''++!true;''')
	}
	
	@Test
	def affixIncrementBoolean() {
		affixIncrementExpressionError('''++true;''')
	}
	
	@Test
	def affixIncrementString() {
		affixIncrementExpressionError('''++"String";''')
	}
	
	@Test
	def affixIncrementParenthesisInvalidType() {
		affixIncrementExpressionError('''++("1");''')
	}
	
	@Test
	def affixIncrementNumericUnaryNegative() {
		affixIncrementExpressionError('''++-1;''')
	}
	
	@Test
	def affixIncrementNumericUnaryPositive() {
		affixIncrementExpressionError('''+++1;''')
	}
	
	@Test
	def affixIncrementAffixIncrement() {
		
		affixIncrementExpressionError('''++++1;''')
	}
	
	@Test
	def affixIncrementAffixDecrement() {
		affixIncrementExpressionError('''++--1;''')
		
	}
	
	@Test
	def affixIncrementVariableInvalidType() {
		affixIncrementExpressionError('''
		String x = "1";
		++x;
		''')
	}
	
	private def affixIncrementExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def affixIncrementExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.PREFIXEXPRESSION)
	}
}