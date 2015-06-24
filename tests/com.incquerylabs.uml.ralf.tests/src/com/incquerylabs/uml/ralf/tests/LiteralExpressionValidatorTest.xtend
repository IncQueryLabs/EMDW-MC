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

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class LiteralExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	@Test
	def booleanLiteralExpressionTrue() {
		val model = parseHelper.parse('''true;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def booleanLiteralExpressionFalse() {
		val model = parseHelper.parse('''false;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}

	
	@Test
	def naturalLiteralExpressionDecimal() {
		val model = parseHelper.parse('''123;''')
		model.assertNoErrors
		tester.validate(model).assertOK
		
	}
	
	@Test
	def naturalLiteralExpressionBinary() {
		val model = parseHelper.parse('''0b010101010101;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def naturalLiteralExpressionHex() {
		val model = parseHelper.parse('''0xAE10;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def naturalLiteralExpressionUnderscore() {
		val model = parseHelper.parse('''123_456;''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def unboundedLiteralExpression() {
		fail("Not yet implemented")
	}
	
	@Test
	def stringLiteralExpression() {
		val model = parseHelper.parse('''"ABC";''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def stringLiteralExpressionBreak() {
		val model = parseHelper.parse('''"AB\\C";''')
		model.assertNoErrors
		tester.validate(model).assertOK
	}
	
	@Test
	def stringLiteralExpressionInvalid() {
		val model = parseHelper.parse('''ABC";''')
		tester.validate(model).assertError(0)
		
	}
	
	
}