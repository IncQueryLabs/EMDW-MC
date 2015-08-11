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
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class SimpleStatementsValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//Empty Statement
	@Test
	def emptyStatement() {
		simpleStatementOK(''';''')
	}
	
	def emptyStatementComment() {
		simpleStatementOK('''
			/*Integer x = false*/;
		''')
	}
	
	//Expression Statement
	//Conditional Test
	@Test
	def expressionStatementNaturalLiteral() {
		simpleStatementOK('''1;''');
	}
	@Test
	def expressionStatementRealLiteral() {
		simpleStatementOK('''1.1;''');
	}
	
	@Test
	def expressionStatementBoolean() {
		simpleStatementOK('''false;''');
	}
	
	@Test
	def expressionStatementString() {
		simpleStatementOK('''"1";''');
	}

	
	@Test
	def expressionStatementMultiplicative() {
		simpleStatementOK('''1*1;''');
	}
	
	
	@Test
	def expressionStatementAdditive() {
		simpleStatementOK('''1+1;''');
	}
	
	@Test
	def expressionStatementShift() {
		simpleStatementOK('''1>>1;''');
	}
	
	@Test
	def expressionStatementRelational() {
		simpleStatementOK('''1>1;''');
	}
	
	@Test
	def expressionStatementEquality() {
		simpleStatementOK('''1==1;''');
	}
	
	@Test
	def expressionStatementBitwiseOr() {
		simpleStatementOK('''1|1;''');
	}
	
	@Test
	def expressionStatementBitwiseAnd() {
		simpleStatementOK('''1&1;''');
	}
	
	@Test
	def expressionStatementBitwiseXor() {
		simpleStatementOK('''1^1;''');
	}
	
	@Test
	def expressionStatementAnd() {
		simpleStatementOK('''true && false;''');
	}
	
	@Test
	def expressionStatementOr() {
		simpleStatementOK('''true || false;''');
	}
	
	@Test
	def expressionStatementBooleanUnary() {
		simpleStatementOK('''!true;''');
	}
	
	@Test
	def expressionStatementAssignment() {
		simpleStatementOK('''
		Integer x = 1;
		x = 2;
		''');
	}
	
	//Break
	
	@Test
	def breakStatementInvalid() {
		simpleStatementError('''break;''');
	}
	
	@Test
	def breakStatementInvalidInBlock() {
		simpleStatementError('''
		{break;}
		''');
	}
	
	@Test
	def breakStatementValidInSwitch() {
		simpleStatementOK('''
		Integer x =1;
		switch(x){
		case 1: break;
		}
		''');
	}
	
	@Test
	def breakStatementValidInSwitch2() {
		simpleStatementOK('''
		Integer x =1;
		switch(x){
		case 1: {break;}
		}
		''');
	}
	
	@Test
	def breakStatementValidInWhile() {
		simpleStatementOK('''
		while(true){
			break;
		}
		''');
	}
	
	@Test
	def breakStatementValidInDoWhile() {
		simpleStatementOK('''
		do{
			break;
		}while(true);
		''');
	}
	
	@Test
	@Ignore
	def breakStatementValidInFor() {
		simpleStatementError('''
		for(i : { 9 }){
			break;
		}
		''');
	}
	
	@Test
	def breakStatementInvalidInIf() {
		simpleStatementError('''
		if(true){
			break;
		}
		''');
	}
	
	//Return
	
	@Test
	def returnStatement() {
		simpleStatementOK('''return;''');
	}
	@Test
	def returnStatementNaturalLiteral() {
		// No return value allowed
        simpleStatementError('''return 1;''');
	}
	@Test
	def returnStatementRealLiteral() {
		// No return value allowed
        simpleStatementError('''return 1.1;''');
	}
	
	@Test
	def returnStatementBoolean() {
		// No return value allowed
        simpleStatementError('''return false;''');
	}
	
	@Test
	def returnStatementString() {
		// No return value allowed
        simpleStatementError('''return "1";''');
	}

	
	@Test
	def returnStatementMultiplicative() {
		// No return value allowed
        simpleStatementError('''return 1*1;''');
	}
	
	
	@Test
	def returnStatementAdditive() {
		// No return value allowed
        simpleStatementError('''return 1+1;''');
	}
	
	@Test
	def returnStatementShift() {
		// No return value allowed
        simpleStatementError('''return 1>>1;''');
	}
	
	@Test
	def returnStatementRelational() {
		// No return value allowed
        simpleStatementError('''return 1>1;''');
	}
	
	@Test
	def returnStatementEquality() {
		// No return value allowed
        simpleStatementError('''return 1==1;''');
	}
	
	@Test
	def returnStatementBitwiseOr() {
		// No return value allowed
        simpleStatementError('''return 1|1;''');
	}
	
	@Test
	def returnStatementBitwiseAnd() {
		// No return value allowed
        simpleStatementError('''return 1&1;''');
	}
	
	@Test
	def returnStatementBitwiseXor() {
		// No return value allowed
        simpleStatementError('''return 1^1;''');
	}
	
	@Test
	def returnStatementAnd() {
		// No return value allowed
        simpleStatementError('''return true && false;''');
	}
	
	@Test
	def returnStatementOr() {
		// No return value allowed
        simpleStatementError('''return true || false;''');
	}
	
	@Test
	def returnStatementBooleanUnary() {
		// No return value allowed
		simpleStatementError('''return !true;''');
	}
	
	@Test
	def returnStatementAssignment() {
		// No return value allowed
        simpleStatementError('''
		Integer x = 1;
		return x = 2;
		''');
	}
		
	
	
	private def simpleStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def simpleStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
}