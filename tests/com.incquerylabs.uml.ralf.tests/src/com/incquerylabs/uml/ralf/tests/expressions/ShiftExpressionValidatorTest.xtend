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
class ShiftExpressionValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def shiftExpressionInteger() {
		shiftExpressionOK('''1 >> 2;''');
	}
	
	@Test
	def shiftExpressionParentheses() {
		shiftExpressionOK('''1 >> (2+3);''')
	}
	
	@Test
	def shiftExpressionMultiplicative() {
		shiftExpressionOK('''1 >> 2*3;''')
	}
	
	@Test
	def shiftExpressionAdditive() {
		shiftExpressionOK('''1 >> 2+3;''')
	}
	
	@Test
	def shiftExpressionMultiple() {
		shiftExpressionOK('''1 >> 2 >> 3 >> 4;''')
	}
	
	@Test
	def shiftExpressionVariable() {
		shiftExpressionOK('''
		Integer x = 1;
		x >> 1;
		''')
	}
	
	@Test
	def shiftExpressionNumericUnary() {
		shiftExpressionOK('''1 >> -2;''')
	}
	
	@Test
	def shiftExpressionAffix() {
		shiftExpressionOK('''
		Integer x = 1;
		--x >> 1;
		''')
	}
	
	@Test
	def shiftExpressionPostfix() {
		shiftExpressionOK('''
		Integer x = 1;
		x-- >> 1;
		''')
	}
		
		//Expected: Validation ERROR
		
	@Test
	def shiftExpressionReal() {
		shiftExpressionError('''1.3 >> 2.3;''')
	}
	
	@Test
	def shiftExpressionRealInteger() {
		shiftExpressionError('''1.3 >> 2;''')
	}
	
	@Test
	def shiftExpressionIntegerReal() {
		shiftExpressionError('''1 >> 2.3;''')
	}
	
	@Test
	def shiftExpressionString() {
		shiftExpressionError('''"1" >> "2";''')
	}
	
	@Test
	def shiftExpressionMultiplicativeReal() {
		shiftExpressionError('''1 >> 1/2;''')
	}	
		
	@Test
	def shiftExpressionIntegerString() {
		shiftExpressionError('''1 >> "2";''')		
	}
	
	@Test
	def shiftExpressionRealString() {
		shiftExpressionError('''1.3 >> "2";''')
	}
	
	@Test
	def shiftExpressionStringInteger() {
		shiftExpressionError('''"1" >> 2;''')
	}
	
	@Test
	def shiftExpressionStringReal() {
		shiftExpressionError('''"1" >> 2.3;''')
	}
	
	@Test
	def shiftExpressionBooleanReal() {
		shiftExpressionError('''true >> 2.3;''')
	}
	
	@Test
	def shiftExpressionBooleanInteger() {
		shiftExpressionError('''true >> 2;''')
	}
	
	@Test
	def shiftExpressionBooleanString() {
		shiftExpressionError('''true >> "2";''')
	}
	
	@Test
	def shiftExpressionStringBoolean() {
		shiftExpressionError('''"1" >> true;''')
	}
	
	@Test
	def shiftExpressionRealBoolean() {
		shiftExpressionError('''1.3 >> true;''')
	}
	
	@Test
	def shiftExpressionIntegerBoolean() {
		shiftExpressionError('''1 >> true;''')
	}
	
	@Test
	def shiftExpressionBoolean() {
		shiftExpressionError('''false >> true;''')
	}
	
	private def shiftExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def shiftExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.SHIFTEXPRESSION)
	}
}