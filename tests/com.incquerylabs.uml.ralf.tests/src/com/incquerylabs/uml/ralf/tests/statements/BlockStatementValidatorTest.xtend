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
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class BlockStatementValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def blockStatementEmpty() {
		blockStatementOK('''{}''');
	}
	
	@Test
	def blockStatementContainsBlock() {
		blockStatementOK('''{{}}''');
	}
	
	@Test
	def blockStatementContainsExpressionStatement() {
		blockStatementOK('''
		{
			1+2.5;
		}
		''');
	}
	
	@Test
	def blockStatementContainsVariableDeclaration() {
		blockStatementOK('''
		{
			Integer x = 1+2;
		}
		''');
	}
	
	@Test
	def blockStatementContainsIf() {
		blockStatementOK('''
		{
			if(true){}
		}
		''');
	}
	
	@Test
	def blockStatementContainsWhile() {
		blockStatementOK('''
		{
			while(true){}
		}
		''');
	}
	
	@Test
	def blockStatementContainsDoWhile() {
		blockStatementOK('''
		{
			do{
				
			}while(true);
		}
		''');
	}
	
	@Test
	def blockStatementContainsFor() {
		blockStatementOK('''
		{
			for(i in 1 .. 2){}
		}
		''');
	}
	
	private def blockStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
}