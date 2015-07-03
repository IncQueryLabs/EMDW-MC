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
class ConditionalValidatorTest {
		
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
		
	@Test
	def andExpressionMultiple() {
		conditionalExpressionOK('''false && true && true;''')
	}
	
	@Test
	def andExpressionBoolean() {
		conditionalExpressionOK('''false && true;''')
	}
	
	@Test
	def andExpressionParentheses() {
		conditionalExpressionOK('''true && (2>3);''')
	}
	
	@Test
	def andExpressionRelational() {
		conditionalExpressionOK('''true && 2>3;''')
	}
	
	@Test
	def andExpressionVariable() {
		conditionalExpressionOK('''
		Boolean x = true;
		x && false;
		''')
	}
	
	@Test
	def andExpressionMultipleVariables() {
		conditionalExpressionOK('''
		Boolean x = true;
		Boolean y = true;
		x && y;
		''')
	}
	
	//Expected: Error
	
	@Test
	def andExpressionNumericUnary() {
		conditionalLogicalExpressionError('''true && -2;''')
	}
		
	@Test
	def andExpressionMultiplicative() {
		conditionalLogicalExpressionError('''true && 2*3;''')
	}
	
	@Test
	def andExpressionAdditive() {
		conditionalLogicalExpressionError('''true && 2+3;''')
	}
	
	@Test
	def andExpressionShift() {
		conditionalLogicalExpressionError('''true && 2>>3;''')
	}
				
	@Test
	def andExpressionInteger() {
		conditionalLogicalExpressionError('''1 && 2;''');
	}
	
	//OR
	@Test
	def orExpressionMultiple() {
		conditionalExpressionOK('''false || true || true;''')
	}
	
	@Test
	def orExpressionBoolean() {
		conditionalExpressionOK('''false || true;''')
	}
	
	@Test
	def orExpressionParentheses() {
		conditionalExpressionOK('''true || (2>3);''')
	}
	
	@Test
	def orExpressionRelational() {
		conditionalExpressionOK('''true || 2>3;''')
	}
	
	@Test
	def orExpressionLogicalAnd() {
		conditionalExpressionOK('''true || true && false;''')
	}
	
	@Test
	def orExpressionVariable() {
		conditionalExpressionOK('''
		Boolean x = true;
		x || false;
		''')
	}
	
	@Test
	def orExpressionMultipleVariables() {
		conditionalExpressionOK('''
		Boolean x = true;
		Boolean y = true;
		x || y;
		''')
	}
	
	//Expected: Error
	
	@Test
	def orExpressionNumericUnary() {
		conditionalLogicalExpressionError('''true || -2;''')
	}
		
	@Test
	def orExpressionMultiplicative() {
		conditionalLogicalExpressionError('''true || 2*3;''')
	}
	
	@Test
	def orExpressionAdditive() {
		conditionalLogicalExpressionError('''true || 2+3;''')
	}
	
	@Test
	def orExpressionShift() {
		conditionalLogicalExpressionError('''true || 2>>3;''')
	}
				
	@Test
	def orExpressionInteger() {
		conditionalLogicalExpressionError('''1 || 2;''');
	}
	
	//Conditional Test
	@Test
	def condTestExpressionInteger() {
		conditionalExpressionOK('''(true) ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionBoolean() {
		conditionalExpressionOK('''(true) ? true : false;''');
	}
	
	@Test
	def condTestExpressionReal() {
		conditionalExpressionOK('''(true) ? 1.1 : 2.1;''');
	}
	
	@Test
	def condTestExpressionString() {
		conditionalExpressionOK('''(true) ? "1" : "2";''');
	}
	
	@Test
	def condTestExpressionPostIncrement() {
		conditionalExpressionOK('''
		Integer x = 1;
		(true) ? x++ : 2;
		''');
	}
	
	@Test
	def condTestExpressionPreIncrement() {
		conditionalExpressionOK('''
		Integer x = 1;
		(true) ? ++x : 2;
		''');
	}
	
	@Test
	def condTestExpressionMultiplicative() {
		conditionalExpressionOK('''(true) ? 1*1 : 2;''');
	}
	
	
	@Test
	def condTestExpressionAdditive() {
		conditionalExpressionOK('''(true) ? 1+1 : 2;''');
	}
	
	@Test
	def condTestExpressionShift() {
		conditionalExpressionOK('''(true) ? 1>>1 : 2;''');
	}
	
	@Test
	def condTestExpressionRelational() {
		conditionalExpressionOK('''(true) ? 1>1 : true;''');
	}
	
	@Test
	def condTestExpressionEquality() {
		conditionalExpressionOK('''(true) ? 1==1 : true;''');
	}
	
	@Test
	def condTestExpressionBitwiseOr() {
		conditionalExpressionOK('''(true) ? 1|1 : 2;''');
	}
	
	@Test
	def condTestExpressionBitwiseAnd() {
		conditionalExpressionOK('''(true) ? 1&1 : 2;''');
	}
	
	@Test
	def condTestExpressionBitwiseXor() {
		conditionalExpressionOK('''(true) ? 1^1 : 2;''');
	}
	
	@Test
	def condTestExpressionAnd() {
		conditionalExpressionOK('''(true) ? true && false : true;''');
	}
	
	@Test
	def condTestExpressionOr() {
		conditionalExpressionOK('''(true) ? true || false : true;''');
	}
	
	@Test
	def condTestExpressionCondTest() {
		conditionalExpressionOK('''(true) ? (true) ? true : false : true;''');
	}
	
	@Test
	def condTestExpressionConditionBooleanUnary() {
		conditionalExpressionOK('''(!true) ? 1 : 2;''');
	}
	@Test
	def condTestExpressionConditionRelational() {
		conditionalExpressionOK('''(1>2) ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionConditionEquality() {
		conditionalExpressionOK('''(2==1) ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionConditionAnd() {
		conditionalExpressionOK('''(true && false) ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionConditionOr() {
		conditionalExpressionOK('''(true || false) ? 1 : 2;''');
	}
	//Expected: Error
	@Test
	def condTestExpressionConditionInteger() {
		conditionalTestExpressionError('''(1) ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionConditionString() {
		conditionalTestExpressionError('''("1") ? 1 : 2;''');
	}
	
	@Test
	def condTestExpressionConditionPostIncrement() {
		conditionalTestExpressionError('''
		Integer x = 1;
		(x++) ? 1 : 2;
		''');
	}
	
	@Test
	def condTestExpressionConditionPreIncrement() {
		conditionalTestExpressionError('''
		Integer x = 1;
		(++x) ? 1 : 2;
		''');
	}
	
	@Test
	def condTestExpressionConditionArithmetic() {
		conditionalTestExpressionError('''(1+2) ? 1 : 2;''');
	}
	@Test
	def condTestExpressionConditionShift() {
		conditionalTestExpressionError('''(1>>2) ? 1 : 2;''');
	}
	
	
	private def conditionalExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def conditionalLogicalExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION)
	}
	
	private def conditionalTestExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.CONDITIONALTESTEXPRESSION)
	}
}
	