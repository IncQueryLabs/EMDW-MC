package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
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
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class PostfixExpressionValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//postfix increment operator
	
	@Test
	def postfixIncrementIntegerLiteral() {
		postfixIncrementExpressionError('''1++;''')
	}
		
	@Test
	def postfixIncrementReaLiteral() {
		postfixIncrementExpressionError('''1.1++;''')
	}
		
	@Test
	def postfixIncrementParenthesisIntLiteral() {
		postfixIncrementExpressionError('''(1)++;''')
	}
	
	@Test
	def postfixIncrementParenthesisRealLiteral() {
		postfixIncrementExpressionError('''(1.1)++;''')
	}
	
	@Test
	def postfixIncrementIntegerVariable() {
		postfixIncrementExpressionOK('''
		Integer x = 1;
		x++;
		''')
	}
		
	@Test
	def postfixIncrementBooleanLiteral() {
		postfixIncrementExpressionError('''true++;''')
	}
	
	@Test
	def postfixIncrementStringLiteral() {
		postfixIncrementExpressionError('''"String"++;''')
	}
	
	@Test
	def postfixIncrementParenthesisInvalidType() {
		postfixIncrementExpressionError('''("1")++;''')
	}
	
	@Test
	def postfixIncrementNumericUnaryNegative() {
		postfixIncrementExpressionError('''-1++;''')
	}
	
	@Test
	def postfixIncrementNumericUnaryPositive() {
		postfixIncrementExpressionError('''+1++;''')
	}
	
	@Test
	def postfixIncrementAffixIncrement() {
		
		postfixIncrementExpressionError('''++1++;''')
	}
	
	@Test
	def postfixIncrementAffixDecrement() {
		postfixIncrementExpressionError('''--1++;''')
		
	}
	
	@Test
	def postfixIncrementVariableInvalidType() {
		postfixIncrementExpressionError('''
		String x = "1";
		x++;
		''')
	}
	
	private def postfixIncrementExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def postfixIncrementExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.POSTFIXEXPRESSION)
	}
}