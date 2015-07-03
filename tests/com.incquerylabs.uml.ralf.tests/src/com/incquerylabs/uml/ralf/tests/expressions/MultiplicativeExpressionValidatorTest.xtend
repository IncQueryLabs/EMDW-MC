package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
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
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class MultiplicativeExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//multiplication Expression
		//Expected: OK
	
	@Test
	def multiplicationExpressionInteger() {
		multiplicativeExpressionOK('''1 * 2;''');
	}
	
	@Test
	def multiplicationExpressionReal() {
		multiplicativeExpressionOK('''1.3 * 2.3;''')
	}
	
	@Test
	def multiplicationExpressionRealInteger() {
		multiplicativeExpressionOK('''1.3 * 2;''')
	}
	
	@Test
	def multiplicationExpressionIntegerReal() {
		multiplicativeExpressionOK('''1 * 2.3;''')
	}
	
	
	@Test
	def multiplicationExpressionParentheses() {
		multiplicativeExpressionOK('''1 * (2+3);''')
	}
	
	@Test
	def multiplicationExpressionMultiple() {
		multiplicativeExpressionOK('''1 * 2 * 3 * 4;''')
	}
	
	@Test
	def multiplicationExpressionVariable() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1*x;
		''')
	}
	
	@Test
	def multiplicationExpressionNumericUnary() {
		multiplicativeExpressionOK('''1 * -2;''')
	}
	
	@Test
	def multiplicationExpressionAffix() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 * --x;
		''')
	}
	
	@Test
	def multiplicationExpressionPostfix() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 * x--;
		''')
	}
		
		//Expected: Validation ERROR
	@Test
	def multiplicationExpressionString() {
		multiplicativeExpressionError('''"1" * "2";''')
	}
		
	@Test
	def multiplicationExpressionIntegerString() {
		multiplicativeExpressionError('''1 * "2";''')		
	}
	
	@Test
	def multiplicationExpressionRealString() {
		multiplicativeExpressionError('''1.3 * "2";''')
	}
	
	@Test
	def multiplicationExpressionStringInteger() {
		multiplicativeExpressionError('''"1" * 2;''')
	}
		
	@Test
	def multiplicationExpressionBooleanInteger() {
		multiplicativeExpressionError('''true * 2;''')
	}
	
	@Test
	def multiplicationExpressionBooleanString() {
		multiplicativeExpressionError('''true * "2";''')
	}
	
	@Test
	def multiplicationExpressionStringBoolean() {
		multiplicativeExpressionError('''"1" * true;''')
	}
	
	@Test
	def multiplicationExpressionRealBoolean() {
		multiplicativeExpressionError('''1.3 * true;''')
	}
	
	@Test
	def multiplicationExpressionIntegerBoolean() {
		multiplicativeExpressionError('''1 * true;''')
	}
	
	@Test
	def multiplicationExpressionBoolean() {
		multiplicativeExpressionError('''false * true;''')
	}
	
	//division
	//Exprected: OK
	
	@Test
	def divisionExpressionInteger() {
		multiplicativeExpressionOK('''1 - 2;''')
	}
	
	@Test
	def divisionExpressionReal() {
		multiplicativeExpressionOK('''1.3 - 2.3;''')
	}
	
	@Test
	def divisionExpressionRealInteger() {
		multiplicativeExpressionOK('''1.3 - 2;''')
	}
	
	@Test
	def divisionExpressionIntegerReal() {
		multiplicativeExpressionOK('''1 - 2.3;''')
	}
	
	@Test
	def divisionExpressionParentheses() {
		multiplicativeExpressionOK('''1 - (2-3);''')
	}
	
	@Test
	def divisionExpressionMultiple() {
		multiplicativeExpressionOK('''1 - 2 - 3 - 4;''')
	}
	
	@Test
	def divisionExpressionVariable() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1-x;
		''')
	}
	
	@Test
	def divisionExpressionNumericUnary() {
		multiplicativeExpressionOK('''1 - -2;''')
	}
	
	@Test
	def divisionExpressionAffix() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 - --x;
		''')
	}
	
	@Test
	def divisionExpressionPostfix() {
		multiplicativeExpressionOK('''
		Integer x = 2;
		1 / x--;
		''')
	}
	
		
		//Expected: Validation ERROR
		
		
	@Test
	def divisionExpressionZero() {
		multiplicativeExpressionOK('''1 / 0;''')
	}
	
	@Test
	def divisionExpressionString() {
		multiplicativeExpressionError('''"1" / "2";''')
	}
		
	@Test
	def divisionExpressionIntegerString() {
		multiplicativeExpressionError('''1 / "2";''')
	}
	
	@Test
	def divisionExpressionRealString() {
		multiplicativeExpressionError('''1.3 / "2";''')
	}
	
	@Test
	def divisionExpressionStringInteger() {
		multiplicativeExpressionError('''"1" / 2;''')
	}
	
	@Test
	def divisionExpressionStringReal() {
		multiplicativeExpressionError('''"1" / 2.3;''')
	}
	
	@Test
	def divisionExpressionBooleanReal() {
		multiplicativeExpressionError('''true / 2.3;''')
	}
	
	@Test
	def divisionExpressionBooleanInteger() {
		multiplicativeExpressionError('''true / 2;''')
	}
	
	@Test
	def divisionExpressionBooleanString() {
		multiplicativeExpressionError('''true / "2";''')
	}
	
	@Test
	def divisionExpressionStringBoolean() {
		multiplicativeExpressionError('''"1" / true;''')
	}
	
	@Test
	def divisionExpressionRealBoolean() {
		multiplicativeExpressionError('''1.3 / true;''')
	}
	
	@Test
	def divisionExpressionIntegerBoolean() {
		multiplicativeExpressionError('''1 / true;''')
	}
	
	@Test
	def divisionExpressionBoolean() {
		multiplicativeExpressionError('''false / true;''')
	}
	
	//modulo
	//Exprected: OK
	
	@Test
	def moduloExpressionInteger() {
		multiplicativeExpressionOK('''1 % 2;''')
	}
	
	@Test
	def moduloExpressionReal() {
		multiplicativeExpressionOK('''1.3 % 2.3;''')
	}
	
	@Test
	def moduloExpressionRealInteger() {
		multiplicativeExpressionOK('''1.3 % 2;''')
	}
	
	@Test
	def moduloExpressionIntegerReal() {
		multiplicativeExpressionOK('''1 % 2.3;''')
	}
	
	@Test
	def moduloExpressionParentheses() {
		multiplicativeExpressionOK('''1 % (2-3);''')
	}
	
	@Test
	def moduloExpressionMultiple() {
		multiplicativeExpressionOK('''1 % 2 % 3 % 4;''')
	}
	
	@Test
	def moduloExpressionVariable() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 % x;
		''')
	}
	
	@Test
	def moduloExpressionNumericUnary() {
		multiplicativeExpressionOK('''1 % -2;''')
	}
	
	@Test
	def moduloExpressionAffix() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 % --x;
		''')
	}
	
	@Test
	def moduloExpressionPostfix() {
		multiplicativeExpressionOK('''
		Integer x = 1;
		1 % x--;
		''')
	}
	
	//Expected: Validation ERROR
	
	@Test
	def moduloExpressionString() {
		multiplicativeExpressionError('''"1" % "2";''')
	}
		
	@Test
	def moduloExpressionIntegerString() {
		multiplicativeExpressionError('''1 % "2";''')
	}
	
	@Test
	def moduloExpressionRealString() {
		multiplicativeExpressionError('''1.3 % "2";''')
	}
	
	@Test
	def moduloExpressionStringInteger() {
		multiplicativeExpressionError('''"1" % 2;''')
	}
	
	@Test
	def moduloExpressionStringReal() {
		multiplicativeExpressionError('''"1" % 2.3;''')
	}
	
	@Test
	def moduloExpressionBooleanReal() {
		multiplicativeExpressionError('''true % 2.3;''')
	}
	
	@Test
	def moduloExpressionBooleanInteger() {
		multiplicativeExpressionError('''true % 2;''')
	}
	
	@Test
	def moduloExpressionBooleanString() {
		multiplicativeExpressionError('''true % "2";''')
	}
	
	@Test
	def moduloExpressionStringBoolean() {
		multiplicativeExpressionError('''"1" % true;''')
	}
	
	@Test
	def moduloExpressionRealBoolean() {
		multiplicativeExpressionError('''1.3 % true;''')
	}
	
	@Test
	def moduloExpressionIntegerBoolean() {
		multiplicativeExpressionError('''1 % true;''')
	}
	
	@Test
	def moduloExpressionBoolean() {
		multiplicativeExpressionError('''false % true;''')
	}
	
	private def multiplicativeExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def multiplicativeExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.ARITHMETICEXPRESSION)
	}
}