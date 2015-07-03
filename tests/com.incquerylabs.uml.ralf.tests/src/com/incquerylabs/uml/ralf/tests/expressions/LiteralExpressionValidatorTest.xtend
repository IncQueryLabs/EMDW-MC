package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
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

import static org.junit.Assert.*
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class LiteralExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	@Test
	def booleanLiteralExpressionTrue() {
		literalExpressionOK('''true;''')
	}
	
	@Test
	def booleanLiteralExpressionFalse() {
		literalExpressionOK('''false;''')
	}

	
	@Test
	def naturalLiteralExpressionDecimal() {
		literalExpressionOK('''123;''')
		
	}
	
	@Test
	def naturalLiteralExpressionBinary() {
		literalExpressionOK('''0b010101010101;''')
	}
	
	@Test
	def naturalLiteralExpressionHex() {
		literalExpressionOK('''0xAE10;''')
	}
	
	@Test
	def naturalLiteralExpressionUnderscore() {
		literalExpressionOK('''123_456;''')
	}
	
	@Ignore
	@Test
	def unboundedLiteralExpression() {
		fail("Not yet implemented")
	}
	
	@Test
	def stringLiteralExpression() {
		literalExpressionOK('''"ABC";''')
	}
	
	@Test
	def stringLiteralExpressionBreak() {
		literalExpressionOK('''"AB\\C";''')
	}
	
	private def literalExpressionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
}