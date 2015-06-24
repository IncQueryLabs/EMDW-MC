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
class StatementsValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	//Local variable definition
	
	@Test
	def localVariableSimple() {
		val model = parseHelper.parse('''Integer x = 1;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableAdditive() {
		val model = parseHelper.parse('''Integer x = 1+2;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableMultiplicative() {
		val model = parseHelper.parse('''Integer x = 1*2;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableNumericUnary() {
		val model = parseHelper.parse('''Integer x = -1;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableShift() {
		val model = parseHelper.parse('''Integer x = 1>>2;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableRelation() {
		val model = parseHelper.parse('''Boolean x = 1 < 2;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableEquality() {
		val model = parseHelper.parse('''Boolean x = 1 == 2;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanUnary() {
		val model = parseHelper.parse('''Boolean x = !(1 < 2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanXor() {
		val model = parseHelper.parse('''Boolean x = 1 < 2 ^ false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanOr() {
		val model = parseHelper.parse('''Boolean x = 1 < 2 | false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanAnd() {
		val model = parseHelper.parse('''Boolean x = 1 < 2 & false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanConditionalAnd() {
		val model = parseHelper.parse('''Boolean x = 1 < 2 && false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableBooleanConditionalOr() {
		val model = parseHelper.parse('''Boolean x = 1 < 2 || false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableConditionalTest() {
		val model = parseHelper.parse('''String x = (1 != 2) ? "test" : "test2";''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableReference() {
		val model = parseHelper.parse(
		'''
		Integer x = 1 + 2;
		Integer y = x + 2;
		'''
		)
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableDifferentType() {
		val model = parseHelper.parse(
		'''
		Integer y = "String";
		'''
		)
		tester.validate(model).assertError(0)
	}
	
	
	
}