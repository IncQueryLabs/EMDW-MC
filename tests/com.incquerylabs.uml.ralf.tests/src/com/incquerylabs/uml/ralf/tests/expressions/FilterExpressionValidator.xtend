package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
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
class FilterExpressionValidator {
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	@Test
	def filterExpressionInteger() {
		filterExpressionOK('''
		sequence<Integer>{1,2,3}->filter(s | s < 1);''')
	}
	
	@Test
	def filterExpressionReal() {
		filterExpressionOK('''
		sequence<Real>{1.1,2.2,3.3}->filter(s | s < 1.0);''')
	}
	
	@Test
	def filterExpressionString() {
		filterExpressionOK('''
		sequence<String>{"1","2","3"}->filter(s | s == "2");''')
	}
	
	@Test
	def filterExpressionBoolean() {
		filterExpressionOK('''
		sequence<Boolean>{true,false,true}->filter(s | s == true);''')
	}
	
	@Test
	def filterExpressionFilter() {
		filterExpressionOK('''
		sequence<Boolean>{true,false,true}->filter(s | s == true).filter(s | s == true);''')
	}
		
	//Expected: Validation ERROR
	
	@Test
	def filterExpressionInvalidExpressionType() {
		filterExpressionError('''
		sequence<Integer>{1,2,3}->filter(s | s + 1);''')
	}
	
		
	
	private def filterExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def filterExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.FILTEREXPRESSION)
	}
}