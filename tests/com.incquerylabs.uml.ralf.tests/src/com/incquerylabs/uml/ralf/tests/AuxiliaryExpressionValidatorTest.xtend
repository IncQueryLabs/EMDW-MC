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
class AuxiliaryExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	//Parentheses
	
	@Test
	def parenthesisInteger() {
		val model = parseHelper.parse('''(1);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBoolean() {
		val model = parseHelper.parse('''(true);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisString() {
		val model = parseHelper.parse('''("String");''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisReal() {
		val model = parseHelper.parse('''(1.1);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisAdditive() {
		val model = parseHelper.parse('''(1+2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisMultiplicative() {
		val model = parseHelper.parse('''(1*2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisParenthesis() {
		val model = parseHelper.parse('''((1));''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisShift() {
		val model = parseHelper.parse('''(1>>2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisRelation() {
		val model = parseHelper.parse('''(1 < 2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisEquality() {
		val model = parseHelper.parse('''(1 == 2);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanUnary() {
		val model = parseHelper.parse('''(!true);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanXor() {
		val model = parseHelper.parse('''(true ^ false);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanOr() {
		val model = parseHelper.parse('''(true | false);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanAnd() {
		val model = parseHelper.parse('''(true & false);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanConditionalAnd() {
		val model = parseHelper.parse('''(true && false);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisBooleanConditionalOr() {
		val model = parseHelper.parse('''(true || false);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisAssignment() {
		val model = parseHelper.parse('''
		Integer x = 1;
		(x = 2);
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisName() {
		val model = parseHelper.parse('''
		Integer x = 1;
		(x);
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesisConditionalTest() {
		val model = parseHelper.parse('''(true ? "test" : "test2");''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	//Unary numeric
	@Test
	def unaryNumericInteger() {
		val model = parseHelper.parse('''-1;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
		
	@Test
	def unaryNumericReal() {
		val model = parseHelper.parse('''-1.1;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
		
	@Test
	def unaryNumericParenthesisInt() {
		val model = parseHelper.parse('''-(1);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unaryNumericNameInteger() {
		val model = parseHelper.parse('''
		Integer x = 1;
		-x;
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unaryNumericNegativeAffixIncrement() {
		val model = parseHelper.parse('''-++1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericNegativeAffixDecrement() {
		val model = parseHelper.parse('''---1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericPositiveAffixIncrement() {
		val model = parseHelper.parse('''+++1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericPositiveAffixDecrement() {
		val model = parseHelper.parse('''+--1;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericBooleanUnary() {
		val model = parseHelper.parse('''-!true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericBoolean() {
		val model = parseHelper.parse('''-true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericString() {
		val model = parseHelper.parse('''-"String";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericParenthesisString() {
		val model = parseHelper.parse('''-("1");''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryNumericNameString() {
		val model = parseHelper.parse('''
		String x = "1";
		-x;
		''')
		tester.validate(model).assertError(0)
	}
	

	

	//Boolean Unary		
	@Test
	def unaryBooleanParenthesis() {
		val model = parseHelper.parse('''!(true);''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
		
	@Test
	def unaryBooleanName() {
		val model = parseHelper.parse('''
		Boolean x = true;
		!x;
		''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unaryBooleanBooleanNot() {
		val model = parseHelper.parse('''!!true;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unaryBooleanBoolean() {
		val model = parseHelper.parse('''!true;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unaryBooleanString() {
		val model = parseHelper.parse('''!"String";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryBooleanParenthesisInvalid() {
		val model = parseHelper.parse('''!("1");''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryBooleanNameInvalid() {
		val model = parseHelper.parse('''
		String x = "1";
		!x;
		''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def unaryBooleanInteger() {
		val model = parseHelper.parse('''!1;''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def unaryBooleanReal() {
		val model = parseHelper.parse('''!1.1;''')
		tester.validate(model).assertError(0)
	}
	
	
	
}