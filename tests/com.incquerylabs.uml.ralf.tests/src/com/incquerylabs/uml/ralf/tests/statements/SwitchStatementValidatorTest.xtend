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
class SwitchStatementValidatorTest {	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	@Test
	def switchStatementNaturalLiteral() {
		switchStatementOK('''
		switch(1){
			case 1 : { break; }
			default : { break; }
		};''');
	}
	
	def switchStatementNaturalLiteralNoBreak() {
		switchStatementOK('''
		switch(1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementRealLiteral() {
		switchStatementError('''
		switch(1.1){
			case 1.1 : {}
			default : {}
		};
		''');
	}
	
	@Test
	def switchStatementBoolean() {
		switchStatementError('''
		switch(true){
			case true : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementString() {
		switchStatementOK('''
		switch("1"){
			case "1" : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementInvalidCase() {
		switchStatementError('''
		switch("1"){
			case 1 : {}
			default : {}
		};''');
	}

	@Test
	def switchStatementStringVariable() {
		switchStatementOK('''
		String x = "";
		switch(x){
			case "1" : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementMultiplicativeInt() {
		switchStatementOK('''
		switch(1*1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementMultiplicativeReal() {
		switchStatementError('''
		switch(0.75 / 1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementShift() {
		switchStatementOK('''
		switch(1>>1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementRelational() {
		switchStatementError('''
		switch(1>1){
			case true : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementEquality() {
		switchStatementError('''
		switch(1==1){
			case true : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementBitwiseOr() {
		switchStatementOK('''
		switch(1|1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementBitwiseAnd() {
		switchStatementOK('''
		switch(1&1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementBitwiseXor() {
		switchStatementOK('''
		switch(1^1){
			case 1 : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementAnd() {
		switchStatementError('''
		switch(true && false){
			case true : {}
			default : {}
		}''');
	}
	
	@Test
	def switchStatementOr() {
		switchStatementError('''
		switch(true || false){
			case true : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementBooleanUnary() {
		switchStatementError('''
		switch(!true){
			case true : {}
			default : {}
		};''');
	}
	
	@Test
	def switchStatementAssignment() {
		switchStatementOK('''
		Integer x = 1;
		switch(x = 2){
			case 2 : {}
			default : {}
		};''');
	}
	
	private def switchStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def switchStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
	
}