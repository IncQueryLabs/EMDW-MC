package com.incquerylabs.uml.ralf.tests.statements

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
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
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class IfStatementValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper	
	
	@Test
	def ifStatementNaturalLiteral() {
		ifStatementError('''
		if(1){
			
		}''');
	}
	@Test
	def ifStatementRealLiteral() {
		ifStatementError('''
		if(1.1){
			
		}
		''');
	}
	
	@Test
	def ifStatementBoolean() {
		ifStatementOK('''
		if(true){
			
		}''');
	}
	
	@Test
	def ifStatementString() {
		ifStatementError('''
		if("1"){
			
		}''');
	}

	
	@Test
	def ifStatementMultiplicative() {
		ifStatementError('''
		if(1*1){
			
		}''');
	}
	
	
	@Test
	def ifStatementAdditive() {
		ifStatementError('''
		if(1+1){
			
		}''');
	}
	
	@Test
	def ifStatementShift() {
		ifStatementError('''
		if(1>>1){
			
		}''');
	}
	
	@Test
	def ifStatementRelational() {
		ifStatementOK('''
		if(1>1){
			
		}''');
	}
	
	@Test
	def ifStatementEquality() {
		ifStatementOK('''
		if(1==1){
			
		}''');
	}
	
	@Test
	def ifStatementBitwiseOr() {
		ifStatementError('''
		if(1|1){
			
		}''');
	}
	
	@Test
	def ifStatementBitwiseAnd() {
		ifStatementError('''
		if(1&1){
			
		}''');
	}
	
	@Test
	def ifStatementBitwiseXor() {
		ifStatementError('''
		if(1^1){
			
		}''');
	}
	
	@Test
	def ifStatementAnd() {
		ifStatementOK('''
		if(true && false){
			
		}''');
	}
	
	@Test
	def ifStatementOr() {
		ifStatementOK('''
		if(true || false){
			
		}''');
	}
	
	@Test
	def ifStatementBooleanUnary() {
		ifStatementOK('''
		if(!true){
			
		}''');
	}
	
	@Test
	def ifStatementAssignment() {
		ifStatementError('''
		Integer x = 1;
		if(x = 2){
			
		}
		''');
	}
	
	private def ifStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def ifStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
}