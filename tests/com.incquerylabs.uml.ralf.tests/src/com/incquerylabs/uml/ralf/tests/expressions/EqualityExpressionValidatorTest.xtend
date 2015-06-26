package com.incquerylabs.uml.ralf.tests.expressions


import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
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
class EqualityExpressionValidatorTest {
		
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def equalityExpressionInteger() {
		equalityExpressionOK('''1 == 2;''');
	}
	
			
	@Test
	def equalityExpressionMultiple() {
		equalityExpressionOK('''1 == 2 == true;''')
	}
	
	@Test
	def equalityExpressionString() {
		equalityExpressionOK('''"1" == "2";''')
	}
	
	@Test
	def equalityExpressionBoolean() {
		equalityExpressionOK('''false == true;''')
	}
	
	@Test
	def equalityExpressionParentheses() {
		equalityExpressionOK('''1 == (2+3);''')
	}
	
	@Test
	def equalityExpressionMultiplicative() {
		equalityExpressionOK('''1 == 2*3;''')
	}
	
	@Test
	def equalityExpressionAdditive() {
		equalityExpressionOK('''1 == 2+3;''')
	}
	
	@Test
	def equalityExpressionShift() {
		equalityExpressionOK('''1 == 2>>3;''')
	}
	
	@Test
	def equalityExpressionRelational() {
		equalityExpressionOK('''true == 2>3;''')
	}
	
	@Test
	def equalityExpressionVariable() {
		equalityExpressionOK('''
		Integer x = 1;
		x == 1;
		''')
	}
	
	@Test
	def equalityExpressionMultipleVariables() {
		equalityExpressionOK('''
		Integer x = 1;
		Integer y = 1;
		x == y;
		''')
	}
	
	@Test
	def equalityExpressionNumericUnary() {
		equalityExpressionOK('''1 == -2;''')
	}
	
	@Test
	def equalityExpressionBinaryUnary() {
		equalityExpressionOK('''false == !true;''')
	}
		
	@Test
	def equalityExpressionReal() {
		equalityExpressionOK('''1.3 == 2.3;''')
	}
	
	@Test
	def equalityExpressionRealInteger() {
		equalityExpressionOK('''1.3 == 2;''')
	}
	
	@Test
	def equalityExpressionIntegerReal() {
		equalityExpressionOK('''1 == 2.3;''')
	}
	
	@Test
	def equalityExpressionMultiplicativeReal() {
		equalityExpressionOK('''1 == 1/2;''')
	}	
	
	@Test
	def equalityExpressionAffix() {
		equalityExpressionOK('''
		Integer x = 1;
		--x == 1;
		''')
	}
	
	@Test
	def equalityExpressionPostfix() {
		equalityExpressionOK('''
		Integer x = 1;
		x-- == 1;
		''')
	}
		
		//Expected: Validation ERROR
		
	@Test
	def equalityExpressionIntegerString() {
		equalityExpressionError('''1 == "2";''')		
	}
	
	@Test
	def equalityExpressionRealString() {
		equalityExpressionError('''1.3 == "2";''')
	}
	
	@Test
	def equalityExpressionStringInteger() {
		equalityExpressionError('''"1" == 2;''')
	}
	
	@Test
	def equalityExpressionStringReal() {
		equalityExpressionError('''"1" == 2.3;''')
	}
	
	@Test
	def equalityExpressionBooleanReal() {
		equalityExpressionError('''true == 2.3;''')
	}
	
	@Test
	def equalityExpressionBooleanInteger() {
		equalityExpressionError('''true == 2;''')
	}
	
	@Test
	def equalityExpressionBooleanString() {
		equalityExpressionError('''true == "2";''')
	}
	
	@Test
	def equalityExpressionStringBoolean() {
		equalityExpressionError('''"1" == true;''')
	}
	
	@Test
	def equalityExpressionRealBoolean() {
		equalityExpressionError('''1.3 == true;''')
	}
	
	@Test
	def equalityExpressionIntegerBoolean() {
		equalityExpressionError('''1 == true;''')
	}
	
	
	private def equalityExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def equalityExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.EQUALITYEXPRESSION)
	}
}
	