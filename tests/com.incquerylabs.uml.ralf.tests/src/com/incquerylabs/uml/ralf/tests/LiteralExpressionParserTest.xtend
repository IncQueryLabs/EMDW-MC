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

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class LiteralExpressionParserTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	
	@Test
	def booleanLiteralExpressionTrue() {
		val model = parseHelper.parse('''true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//boolean expression is contained
		assertTrue(expressionStatement.expression instanceof BooleanLiteralExpression)
		val expression = (expressionStatement.expression as BooleanLiteralExpression)
		
		
		assertEquals("true", expression.image)
	}
	
	@Test
	def booleanLiteralExpressionFalse() {
		val model = parseHelper.parse('''false;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//boolean expression is contained
		assertTrue(expressionStatement.expression instanceof BooleanLiteralExpression)
		val expression = (expressionStatement.expression as BooleanLiteralExpression)
		
		assertEquals("false", expression.image)
	}

	
	@Test
	def naturalLiteralExpressionDecimal() {
		val model = parseHelper.parse('''123;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof NaturalLiteralExpression)
		val expression = (expressionStatement.expression as NaturalLiteralExpression)
		
		assertEquals("123", expression.image)
	}
	
	@Test
	def naturalLiteralExpressionBinary() {
		val model = parseHelper.parse('''0b010101010101;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof NaturalLiteralExpression)
		val expression = (expressionStatement.expression as NaturalLiteralExpression)
		
		assertEquals("0b010101010101", expression.image)
	}
	
	@Test
	def naturalLiteralExpressionHex() {
		val model = parseHelper.parse('''0xAE10;''')
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof NaturalLiteralExpression)
		val expression = (expressionStatement.expression as NaturalLiteralExpression)
		
		assertEquals("0xAE10", expression.image)
	}
	
	@Test
	def naturalLiteralExpressionUnderscore() {
		val model = parseHelper.parse('''123_456;''')
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof NaturalLiteralExpression)
		val expression = (expressionStatement.expression as NaturalLiteralExpression)
		
		assertEquals("123_456", expression.image)
	}
	
	@Test
	def unboundedLiteralExpression() {
		fail("Not yet implemented")
	}
	
	@Test
	def stringLiteralExpression() {
		val model = parseHelper.parse('''"ABC";''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof StringLiteralExpression)
		val expression = (expressionStatement.expression as StringLiteralExpression)
		
		assertEquals("ABC", expression.image)
	}
	
	@Test
	def stringLiteralExpressionBreak() {
		val model = parseHelper.parse('''"AB\\C";''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//natural expression is contained
		assertTrue(expressionStatement.expression instanceof StringLiteralExpression)
		val expression = (expressionStatement.expression as StringLiteralExpression)
		
		assertEquals("AB\\C", expression.image)
	}
		
	
}