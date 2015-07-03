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
class AssignmentExpressionValidatorTest {
			
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def assignmentExpressionLiteral() {
		assignmentError('''
		1 = 2;
		''');
	}
	
	@Test
	def assignmentExpressionInteger() {
		assignmentOK('''
		Integer x = 1;
		x = 1;
		''');
	}
	
	@Test
	def assignmentExpressionBoolean() {
		assignmentOK('''
		Boolean x = true;
		x = false;
		''');
	}
	
	@Test
	def assignmentExpressionReal() {
		assignmentOK('''
		Real x = 1.1;
		x = 1.2;
		''');
	}
	
	@Test
	def assignmentExpressionString() {
		assignmentOK('''
		String x = "";
		x = "2";
		''');
	}
	
	@Test
	def assignmentExpressionVariable() {
		assignmentOK('''
		Integer x = 1;
		Integer y = 2;
		y = x;
		''');
	}
	
	@Test
	def assignmentExpressionVariableInvalidType() {
		assignmentOK('''
		String x = "1";
		Integer y = 2;
		y = x;
		''');
	}
	
	@Test
	def assignmentExpressionPostIncrement() {
		assignmentOK('''
		Integer x = 1;
		Integer y = 1;
		y = x++;
		''');
	}
	
	@Test
	def assignmentExpressionPreIncrement() {
		assignmentOK('''
		Integer x = 1;
		Integer y = 1;
		y = ++x;
		''');
	}
	
	@Test
	def assignmentExpressionMultiplicative() {
		assignmentOK('''
		Integer x = 1;
		x = 1*1;
		''');
	}
	
	@Test
	def assignmentExpressionMultiplicativeReal() {
		assignmentError('''
		Integer x = 1;
		x = 0.5 /1;
		''');
	}
	
	
	@Test
	def assignmentExpressionAdditive() {
		assignmentOK('''
		Integer x = 1;
		x = 1+1;
		''');
	}
	
	@Test
	def assignmentExpressionShift() {
		assignmentOK('''
		Integer x = 1;
		x = 1>>1;
		''');
	}
	
	@Test
	def assignmentExpressionRelational() {
		assignmentOK('''
		Boolean x = true;
		x = 1>1;
		''');
	}
	
	@Test
	def assignmentExpressionEquality() {
		assignmentOK('''
		Boolean x = true;
		x = 1==1;
		''');
	}
	
	@Test
	def assignmentExpressionBitwiseOr() {
		assignmentOK('''
		Integer x = 1;
		x = 1|1;
		''');
	}
	
	@Test
	def assignmentExpressionBitwiseAnd() {
		assignmentOK('''
		Integer x = 1;
		x = 1&1;
		''');
	}
	
	@Test
	def assignmentExpressionBitwiseXor() {
		assignmentOK('''
		Integer x = 1;
		x = 1^1;
		''');
	}
	
	@Test
	def assignmentExpressionAnd() {
		assignmentOK('''
		Boolean x = true;
		x = true && false;
		''');
	}
	
	@Test
	def assignmentExpressionOr() {
		assignmentOK('''
		Boolean x = true;
		x = true || false;''');
	}
	
	@Test
	def assignmentExpressionCondTest() {
		assignmentOK('''
		Integer x = 1;
		x = (true) ? 2 : 3;''');
	}
	
	private def assignmentOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	private def assignmentError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.ASSIGNMENTEXPRESSION)
	}
}