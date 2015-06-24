package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.google.inject.Injector
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import com.incquerylabs.uml.ralf.validation.ReducedAlfSystemValidator
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.FixMethodOrder
import org.junit.runners.MethodSorters
import com.incquerylabs.uml.ralf.reducedAlfLanguage.impl.ExpressionStatementImpl
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import static extension org.junit.Assert.*;
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.UnboundedLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class LiteralExpressionParserTest {
	
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ReducedAlfSystemValidator validator

	@Inject
	Injector injector

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	
	@Test
	def booleanLiteralExpressionTrue() {
		val model = parseHelper.parse('''true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(BooleanLiteralExpression).size)
		val expression = (model.statement.filter(BooleanLiteralExpression).head as BooleanLiteralExpression)
		
		assertEquals("true", expression.image)
	}
	
	@Test
	def booleanLiteralExpressionFalse() {
		val model = parseHelper.parse('''false;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(BooleanLiteralExpression).size)
		val expression = (model.statement.filter(BooleanLiteralExpression).head as BooleanLiteralExpression)
		
		assertEquals("false", expression.image)
	}

	
	@Test
	def naturalLiteralExpressionDecimal() {
		val model = parseHelper.parse('''123;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(NaturalLiteralExpression).size)
		val expression = (model.statement.filter(NaturalLiteralExpression).head as NaturalLiteralExpression)
		
		assertEquals("123", expression.image)
	}
	
	@Test
	def naturalLiteralExpressionBinary() {
		val model = parseHelper.parse('''123;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(NaturalLiteralExpression).size)
		val expression = (model.statement.filter(NaturalLiteralExpression).head as NaturalLiteralExpression)
		
		assertEquals("123", expression.image)
	}
	
	@Test
	def naturalLiteralExpressionHex() {
		
	}
	
	@Test
	def naturalLiteralExpressionInvalid() {
		
	}
	
	@Test
	def unboundedLiteralExpression() {
		
	}
	
	@Test
	def stringLiteralExpression() {
		
	}
	
	@Test
	def stringLiteralExpressionBreak() {
		
	}
	
	@Test
	def stringLiteralExpressionInvalid() {
		
	}
	
	
}