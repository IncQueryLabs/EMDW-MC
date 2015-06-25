package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.impl.ExpressionStatementImpl
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class LiteralExpressionParserTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	
	@Test
	def booleanLiteralExpressionTrue() {
		literalExpression('''true;''', 1 , BooleanLiteralExpression, "true")
	}
	
	@Test
	def booleanLiteralExpressionFalse() {
		literalExpression('''false;''', 1 , BooleanLiteralExpression, "false")
	}

	
	@Test
	def naturalLiteralExpressionDecimal() {
		literalExpression('''123;''', 1 , NaturalLiteralExpression, "123")
	}
	
	@Test
	def naturalLiteralExpressionBinary() {
		literalExpression('''0b010101010101;''', 1 , NaturalLiteralExpression, "0b010101010101")
	}
	
	@Test
	def naturalLiteralExpressionHex() {
		literalExpression('''0xAE10;''', 1 , NaturalLiteralExpression, "0xAE10")
	}
	
	@Test
	def naturalLiteralExpressionUnderscore() {
		literalExpression('''123_456;''', 1 , NaturalLiteralExpression, "123_456")
	}
	
	@Test
	def unboundedLiteralExpression() {
		fail("Not yet implemented")
	}
	
	@Test
	def stringLiteralExpression() {
		literalExpression('''"ABC";''', 1 , StringLiteralExpression, "ABC")
	}
	
	@Test
	def stringLiteralExpressionBreak() {
		literalExpression('''"AB\\C";''', 1 , StringLiteralExpression, "AB\\C")
	}
	
	private def literalExpression(String code, int numberOfStatements,
		 Class<?> literalClass, String literalValue
	) {
		val model = parseHelper.parse(code)
		
		//check statements size
		assertEquals(numberOfStatements, model.statement.size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		assertTrue(literalClass.isAssignableFrom(expressionStatement.expression.class))
		val expression = (expressionStatement.expression as LiteralExpression)
		
		assertEquals(literalValue, expression.value)					
	}
		
	
}