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
class AdditiveExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//Addition Expression
		//Expected: OK
	
	@Test
	def additionExpressionInteger() {
		additiveExpressionOK('''1 + 2;''');
	}
	
	@Test
	def additionExpressionReal() {
		additiveExpressionOK('''1.3 + 2.3;''')
	}
	
	@Test
	def additionExpressionRealInteger() {
		additiveExpressionOK('''1.3 + 2;''')
	}
	
	@Test
	def additionExpressionIntegerReal() {
		additiveExpressionOK('''1 + 2.3;''')
	}
	
	@Test
	def additionExpressionString() {
		additiveExpressionOK('''"1" + "2";''')
	}
	
	@Test
	def additionExpressionParentheses() {
		additiveExpressionOK('''1 + (2+3);''')
	}
	
	@Test
	def additionExpressionMultiplicative() {
		additiveExpressionOK('''1 + 2*3;''')
	}
	
	@Test
	def additionExpressionMultiple() {
		additiveExpressionOK('''1 + 2 + 3 + 4;''')
	}
	
	@Test
	def additionExpressionVariable() {
		additiveExpressionOK('''
		Integer x = 1;
		1+x;
		''')
	}
	
	@Test
	def additionExpressionNumericUnary() {
		additiveExpressionOK('''1 + -2;''')
	}
	
	@Test
	def additionExpressionAffix() {
		additiveExpressionOK('''
		Integer x = 1;
		1 + --x;
		''')
	}
	
	@Test
	def additionExpressionPostfix() {
		additiveExpressionOK('''
		Integer x = 1;
		1 + x--;
		''')
	}
		
		//Expected: Validation ERROR
		
	@Test
	def additionExpressionIntegerString() {
		additiveExpressionError('''1 + "2";''')		
	}
	
	@Test
	def additionExpressionRealString() {
		additiveExpressionError('''1.3 + "2";''')
	}
	
	@Test
	def additionExpressionStringInteger() {
		additiveExpressionError('''"1" + 2;''')
	}
	
	@Test
	def additionExpressionStringReal() {
		additiveExpressionError('''"1" + 2.3;''')
	}
	
	@Test
	def additionExpressionBooleanReal() {
		additiveExpressionError('''true + 2.3;''')
	}
	
	@Test
	def additionExpressionBooleanInteger() {
		additiveExpressionError('''true + 2;''')
	}
	
	@Test
	def additionExpressionBooleanString() {
		additiveExpressionError('''true + "2";''')
	}
	
	@Test
	def additionExpressionStringBoolean() {
		additiveExpressionError('''"1" + true;''')
	}
	
	@Test
	def additionExpressionRealBoolean() {
		additiveExpressionError('''1.3 + true;''')
	}
	
	@Test
	def additionExpressionIntegerBoolean() {
		additiveExpressionError('''1 + true;''')
	}
	
	@Test
	def additionExpressionBoolean() {
		additiveExpressionError('''false + true;''')
	}
	
	//Subtraction
	//Exprected: OK
	
	@Test
	def subtractionExpressionInteger() {
		additiveExpressionOK('''1 - 2;''')
	}
	
	@Test
	def subtractionExpressionReal() {
		additiveExpressionOK('''1.3 - 2.3;''')
	}
	
	@Test
	def subtractionExpressionRealInteger() {
		additiveExpressionOK('''1.3 - 2;''')
	}
	
	@Test
	def subtractionExpressionIntegerReal() {
		additiveExpressionOK('''1 - 2.3;''')
	}
	
	@Test
	def subtractionExpressionParentheses() {
		additiveExpressionOK('''1 - (2-3);''')
	}
	
	@Test
	def subtractionExpressionMultiplicative() {
		additiveExpressionOK('''1 - 2*3;''')
	}
	
	@Test
	def subtractionExpressionMultiple() {
		additiveExpressionOK('''1 - 2 - 3 - 4;''')
	}
	
	@Test
	def subtractionExpressionVariable() {
		additiveExpressionOK('''
		Integer x = 1;
		1-x;
		''')
	}
	
	@Test
	def subtractionExpressionNumericUnary() {
		additiveExpressionOK('''1 - -2;''')
	}
	
	@Test
	def subtractionExpressionAffix() {
		additiveExpressionOK('''
		Integer x = 1;
		1 - --x;
		''')
	}
	
	@Test
	def subtractionExpressionPostfix() {
		additiveExpressionOK('''
		Integer x = 1;
		1 - x--;
		''')
	}
			
		//Expected: Validation ERROR
		
		
	@Test
	def subtractionExpressionString() {
		additiveExpressionError('''"1" - "2";''')
	}
		
	@Test
	def subtractionExpressionIntegerString() {
		additiveExpressionError('''1 - "2";''')
	}
	
	@Test
	def subtractionExpressionRealString() {
		additiveExpressionError('''1.3 - "2";''')
	}
	
	@Test
	def subtractionExpressionStringInteger() {
		additiveExpressionError('''"1" - 2;''')
	}
	
	@Test
	def subtractionExpressionStringReal() {
		additiveExpressionError('''"1" - 2.3;''')
	}
	
	@Test
	def subtractionExpressionBooleanReal() {
		additiveExpressionError('''true - 2.3;''')
	}
	
	@Test
	def subtractionExpressionBooleanInteger() {
		additiveExpressionError('''true - 2;''')
	}
	
	@Test
	def subtractionExpressionBooleanString() {
		additiveExpressionError('''true - "2";''')
	}
	
	@Test
	def subtractionExpressionStringBoolean() {
		additiveExpressionError('''"1" - true;''')
	}
	
	@Test
	def subtractionExpressionRealBoolean() {
		additiveExpressionError('''1.3 - true;''')
	}
	
	@Test
	def subtractionExpressionIntegerBoolean() {
		additiveExpressionError('''1 - true;''')
	}
	
	@Test
	def subtractionExpressionBoolean() {
		additiveExpressionError('''false - true;''')
	}
	
	private def additiveExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def additiveExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.ARITHMETICEXPRESSION)
	}
}