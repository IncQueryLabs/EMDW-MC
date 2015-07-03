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
import org.eclipse.xtext.diagnostics.Diagnostic
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ReducedAlfLanguagePackage
import org.junit.Assert
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class RelationalExpressionValidatorTest {
		
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def relationalExpressionInteger() {
		relationalExpressionOK('''1 > 2;''');
	}
	
	@Test
	def relationalExpressionParentheses() {
		relationalExpressionOK('''1 > (2+3);''')
	}
	
	@Test
	def relationalExpressionMultiplicative() {
		relationalExpressionOK('''1 > 2*3;''')
	}
	
	@Test
	def relationalExpressionAdditive() {
		relationalExpressionOK('''1 > 2+3;''')
	}
	
	@Test
	def relationalExpressionShift() {
		relationalExpressionOK('''1 > 2>>3;''')
	}
	
	@Test
	def relationalExpressionVariable() {
		relationalExpressionOK('''
		Integer x = 1;
		x > 1;
		''')
	}
	
	@Test
	def relationalExpressionNumericUnary() {
		relationalExpressionOK('''1 > -2;''')
	}
	
		
	@Test
	def relationalExpressionReal() {
		relationalExpressionOK('''1.3 > 2.3;''')
	}
	
	@Test
	def relationalExpressionRealInteger() {
		relationalExpressionOK('''1.3 > 2;''')
	}
	
	@Test
	def relationalExpressionIntegerReal() {
		relationalExpressionOK('''1 > 2.3;''')
	}
	
	@Test
	def relationalExpressionMultiplicativeReal() {
		relationalExpressionOK('''1 > 1/2;''')
	}	
	
	@Test
	def relationalExpressionAffix() {
		relationalExpressionOK('''
		Integer x = 1;
		--x > 1;
		''')
	}
	
	@Test
	def relationalExpressionPostfix() {
		relationalExpressionOK('''
		Integer x = 1;
		x-- > 1;
		''')
	}
		
		//Expected: Validation ERROR
		
	@Test
	def relationalExpressionMultiple() {
		val model = parseHelper.parse('''1 > 2 > 3;''')
		Assert.assertEquals(Diagnostic.SYNTAX_DIAGNOSTIC, model.validate.get(0).code)
        tester.validate(model).assertOK
	}
	
	@Test
	def relationalExpressionString() {
		relationalExpressionError('''"1" > "2";''')
	}
		
	@Test
	def relationalExpressionIntegerString() {
		relationalExpressionError('''1 > "2";''')		
	}
	
	@Test
	def relationalExpressionRealString() {
		relationalExpressionError('''1.3 > "2";''')
	}
	
	@Test
	def relationalExpressionStringInteger() {
		relationalExpressionError('''"1" > 2;''')
	}
	
	@Test
	def relationalExpressionStringReal() {
		relationalExpressionError('''"1" > 2.3;''')
	}
	
	@Test
	def relationalExpressionBooleanReal() {
		relationalExpressionError('''true > 2.3;''')
	}
	
	@Test
	def relationalExpressionBooleanInteger() {
		relationalExpressionError('''true > 2;''')
	}
	
	@Test
	def relationalExpressionBooleanString() {
		relationalExpressionError('''true > "2";''')
	}
	
	@Test
	def relationalExpressionStringBoolean() {
		relationalExpressionError('''"1" > true;''')
	}
	
	@Test
	def relationalExpressionRealBoolean() {
		relationalExpressionError('''1.3 > true;''')
	}
	
	@Test
	def relationalExpressionIntegerBoolean() {
		relationalExpressionError('''1 > true;''')
	}
	
	@Test
	def relationalExpressionBoolean() {
		relationalExpressionError('''false > true;''')
	}
	
	private def relationalExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def relationalExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.RELATIONALEXPRESSION)
	}
}