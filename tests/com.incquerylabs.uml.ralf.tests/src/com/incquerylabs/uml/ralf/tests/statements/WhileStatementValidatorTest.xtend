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
class WhileStatementValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def whileStatementNaturalLiteral() {
		whileStatementError('''
		while(1){
			
		}''');
	}
	@Test
	def whileStatementRealLiteral() {
		whileStatementError('''
		while(1.1){
			
		}
		''');
	}
	
	@Test
	def whileStatementBoolean() {
		whileStatementOK('''
		while(true){
			
		}''');
	}
	
	@Test
	def whileStatementString() {
		whileStatementError('''
		while("1"){
			
		}''');
	}

	
	@Test
	def whileStatementMultiplicative() {
		whileStatementError('''
		while(1*1){
			
		}''');
	}
	
	
	@Test
	def whileStatementAdditive() {
		whileStatementError('''
		while(1+1){
			
		}''');
	}
	
	@Test
	def whileStatementShift() {
		whileStatementError('''
		while(1>>1){
			
		}''');
	}
	
	@Test
	def whileStatementRelational() {
		whileStatementOK('''
		while(1>1){
			
		}''');
	}
	
	@Test
	def whileStatementEquality() {
		whileStatementOK('''
		while(1==1){
			
		}''');
	}
	
	@Test
	def whileStatementBitwiseOr() {
		whileStatementError('''
		while(1|1){
			
		}''');
	}
	
	@Test
	def whileStatementBitwiseAnd() {
		whileStatementError('''
		while(1&1){
			
		}''');
	}
	
	@Test
	def whileStatementBitwiseXor() {
		whileStatementError('''
		while(1^1){
			
		}''');
	}
	
	@Test
	def whileStatementAnd() {
		whileStatementOK('''
		while(true && false){
			
		}''');
	}
	
	@Test
	def whileStatementOr() {
		whileStatementOK('''
		while(true || false){
			
		}''');
	}
	
	@Test
	def whileStatementBooleanUnary() {
		whileStatementOK('''
		while(!true){
			
		}''');
	}
	
	@Test
	def whileStatementAssignment() {
		whileStatementError('''
		Integer x = 1;
		while(x = 2){
			
		}
		''');
	}
	
	@Test
	def doStatementNaturalLiteral() {
		doStatementError('''
		do{
			
		}while(1);''');
	}
	@Test
	def doStatementRealLiteral() {
		doStatementError('''
		do{
			
		}while(1.1);
		''');
	}
	
	@Test
	def doStatementBoolean() {
		doStatementOK('''
		do{
			
		}while(true);''');
	}
	
	@Test
	def doStatementString() {
		doStatementError('''
		do{
			
		}while("1");''');
	}

	
	@Test
	def doStatementMultiplicative() {
		doStatementError('''
		do{
			
		}while(1*1);''');
	}
	
	
	@Test
	def doStatementAdditive() {
		doStatementError('''
		do{
			
		}while(1+1);''');
	}
	
	@Test
	def doStatementShift() {
		doStatementError('''
		do{
			
		}while(1>>1);''');
	}
	
	@Test
	def doStatementRelational() {
		doStatementOK('''
		do{
			
		}while(1>1);''');
	}
	
	@Test
	def doStatementEquality() {
		doStatementOK('''
		do{
			
		}while(1==1);''');
	}
	
	@Test
	def doStatementBitwiseOr() {
		doStatementError('''
		do{
			
		}while(1|1);''');
	}
	
	@Test
	def doStatementBitwiseAnd() {
		doStatementError('''
		do{
			
		}while(1&1);''');
	}
	
	@Test
	def doStatementBitwiseXor() {
		doStatementError('''
		do{
			
		}while(1^1);''');
	}
	
	@Test
	def doStatementAnd() {
		doStatementOK('''
		do{
			
		}while(true && false);''');
	}
	
	@Test
	def doStatementOr() {
		doStatementOK('''
		do{
			
		}while(true || false);''');
	}
	
	@Test
	def doStatementBooleanUnary() {
		doStatementOK('''
		do{
			
		}while(!true);''');
	}
	
	@Test
	def doStatementAssignment() {
		doStatementError('''
		Integer x = 1;
		do{
			
		}while(x = 2);
		''');
	}
	
	private def doStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def doStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
	
	private def whileStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def whileStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
	
	
	
}