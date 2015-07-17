package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import java.io.StringReader
import org.eclipse.xtext.GrammarUtil
import org.eclipse.xtext.IGrammarAccess
import org.eclipse.xtext.ParserRule
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.eclipse.xtext.parser.IParser
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class AuxiliaryExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject 
	extension ValidationTestHelper
	
	@Inject
	IGrammarAccess grammarAccess;
	
	@Inject
	IParser parser;
	
	//Parentheses
	
	@Test
	def parenthesisInteger() {
		auxiliaryOK('''(1);''')
	}
	
	@Test
	def parenthesisBoolean() {
		auxiliaryOK('''(true);''')
	}
	
	@Test
	def parenthesisString() {
		auxiliaryOK('''("String");''')
	}
	
	@Test
	def parenthesisReal() {
		auxiliaryOK('''(1.1);''')
	}
	
	@Test
	def parenthesisAdditive() {
		auxiliaryOK('''(1+2);''')
	}
	
	@Test
	def parenthesisMultiplicative() {
		auxiliaryOK('''(1*2);''')
	}
	
	@Test
	def parenthesisParenthesis() {
		auxiliaryOK('''((1));''')
	}
	
	@Test
	def parenthesisShift() {
		auxiliaryOK('''(1>>2);''')
	}
	
	@Test
	def parenthesisRelation() {
		auxiliaryOK('''(1 < 2);''')
	}
	
	@Test
	def parenthesisEquality() {
		auxiliaryOK('''(1 == 2);''')
	}
	
	@Test
	def parenthesisBooleanUnary() {
		auxiliaryOK('''(!true);''')
	}
	
	@Test
	def parenthesisBooleanXor() {
		auxiliaryOK('''(true ^ false);''')
	}
	
	@Test
	def parenthesisBooleanOr() {
		auxiliaryOK('''(true | false);''')
	}
	
	@Test
	def parenthesisBooleanAnd() {
		auxiliaryOK('''(true & false);''')
	}
	
	@Test
	def parenthesisBooleanConditionalAnd() {
		auxiliaryOK('''(true && false);''')
	}
	
	@Test
	def parenthesisBooleanConditionalOr() {
		auxiliaryOK('''(true || false);''')
	}
	
	@Test
	def parenthesisAssignment() {
		auxiliaryOK('''
		Integer x = 1;
		(x = 2);
		''')
	}
	
	@Test
	def parenthesisName() {
		auxiliaryOK('''
		Integer x = 1;
		(x);
		''')
	}
	
	@Test
	def parenthesisConditionalTest() {
		auxiliaryOK('''(true ? "test" : "test2");''')
	}
	
	//Unary numeric
	@Test
	def unaryNumericInteger() {
		auxiliaryOK('''-1;''')
	}
		
	@Test
	def unaryNumericReal() {
		auxiliaryOK('''-1.1;''')
	}
		
	@Test
	def unaryNumericParenthesisInt() {
		auxiliaryOK('''-(1);''')
	}
	
	@Test
	def unaryNumericNameInteger() {
		auxiliaryOK('''
		Integer x = 1;
		-x;
		''')
	}
		
	@Test
	def unaryNumericNegativeAffixDecrement_Paretheses() {
		auxiliaryOK('''
		Integer x = 1;
		-(--x);
		''')
	}
	
	@Test
	def unaryNumericNegativeAffixIncrement_Paretheses() {
		auxiliaryOK('''
		Integer x = 1;
		-(++x);
		''')
	}
	
	@Test
	def unaryNumericPositiveAffixDecrement_Paretheses() {
		auxiliaryOK('''
		Integer x = 1;
		+(--x);
		''')
	}
	
	@Test
	def unaryNumericPositiveAffixIncrement_Paretheses() {
		auxiliaryOK('''
		Integer x = 1;
		+(++x);
		''')
	}
	
	
	
	
	@Test
	def unaryNumericBooleanUnary() {
		unaryNumericExpressionError('''-!true;''')
	}
	
	@Test
	def unaryNumericBoolean() {
		unaryNumericExpressionError('''-true;''')
	}
	
	@Test
	def unaryNumericString() {
		unaryNumericExpressionError('''-"String";''')
	}
	
	@Test
	def unaryNumericParenthesisString() {
		unaryNumericExpressionError('''-("1");''')
	}
	
	@Test
	def unaryNumericStringVariable() {
		unaryNumericExpressionError('''
		String x = "1";
		-x;
		''')
	}
	

	

	//Boolean Unary		
	@Test
	def unaryBooleanParenthesis() {
		auxiliaryOK('''!(true);''')
	}
		
	@Test
	def unaryBooleanName() {
		auxiliaryOK('''
		Boolean x = true;
		!x;
		''')
	}
	
	@Test
	def unaryBooleanBooleanNot() {
		auxiliaryOK('''!!true;''')
	}
	
	@Test
	def unaryBooleanBoolean() {
		auxiliaryOK('''!true;''')
	}
	
	@Test
	def unaryBooleanString() {
		unaryBooleanExpressionError('''!"String";''')
	}
	
	@Test
	def unaryBooleanParenthesisInvalid() {
		unaryBooleanExpressionError('''!("1");''')
	}
	
	@Test
	def unaryBooleanNameInvalid() {
		unaryBooleanExpressionError('''
		String x = "1";
		!x;
		''')
	}
	
	@Test
	def unaryBooleanInteger() {
		unaryBooleanExpressionError('''!1;''')
	}
		
	@Test
	def unaryBooleanReal() {
		unaryBooleanExpressionError('''!1.1;''')
	}
	
	
	private def auxiliaryOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	
	private def unaryNumericExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.NUMERICUNARYEXPRESSION)
	}
	
	
	private def unaryBooleanExpressionError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.LOGICALUNARYEXPRESSION)
	}
	
	
}