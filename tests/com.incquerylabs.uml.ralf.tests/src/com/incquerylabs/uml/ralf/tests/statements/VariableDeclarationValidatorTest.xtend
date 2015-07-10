package com.incquerylabs.uml.ralf.tests.statements

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
class VariableDeclarationValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	//Local variable definition
	
	@Test
	def localVariableSimple() {
		localVariableOK('''Integer x = 1;''')
	}
	
	@Test
	def localVariableAdditive() {
		localVariableOK('''Integer x = 1+2;''')
	}
	
	@Test
	def localVariableMultiplicative() {
		localVariableOK('''Integer x = 1*2;''')
	}
	
	@Test
	def localVariableNumericUnary() {
		localVariableOK('''Integer x = -1;''')
	}
	
	@Test
	def localVariableShift() {
		localVariableOK('''Integer x = 1>>2;''')
	}
	
	@Test
	def localVariableRelation() {
		localVariableOK('''Boolean x = 1 < 2;''')
	}
	
	@Test
	def localVariableEquality() {
		localVariableOK('''Boolean x = 1 == 2;''')
	}
	
	@Test
	def localVariableBooleanUnary() {
		localVariableOK('''Boolean x = !(1 < 2);''')
	}
	
	@Test
	def localVariableBooleanXor() {
		localVariableOK('''Boolean x = 1 < 2 ^ false;''')
	}
	
	@Test
	def localVariableBooleanOr() {
		localVariableOK('''Boolean x = 1 < 2 | false;''')
	}
	
	@Test
	def localVariableBooleanAnd() {
		localVariableOK('''Boolean x = 1 < 2 & false;''')
	}
	
	@Test
	def localVariableBooleanConditionalAnd() {
		localVariableOK('''Boolean x = 1 < 2 && false;''')
	}
	
	@Test
	def localVariableBooleanConditionalOr() {
		localVariableOK('''Boolean x = 1 < 2 || false;''')
	}
	
	@Test
	def localVariableConditionalTest() {
		localVariableOK('''String x = (1 != 2) ? "test" : "test2";''')
	}
	
	@Test
	def localVariableReference() {
		localVariableOK(
		'''
		Integer x = 1 + 2;
		Integer y = x + 2;
		'''
		)
	}
	
	@Test
	def localVariableDifferentType() {
		localVariableError(
		'''
		Integer y = "String";
		'''
		)
	}
	
	@Test
	def localVariableSameName() {
		localVariableError(
		'''
		Integer x = 1;
		Integer x = 1;
		'''
		)
	}
	
	@Test
	def localVariableSameNameAfterBlock() {
		localVariableOK(
		'''
		{
			String z = "1";
		}
		String z = "2";
		'''
		)
	}
	
	@Test
	def localVariableSameNameBeforeBlock() {
		localVariableError(
		'''
		String z = "2";
		{
			String z = "1";
		}
		
		'''
		)
	}

	private def localVariableOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def localVariableError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
	
}