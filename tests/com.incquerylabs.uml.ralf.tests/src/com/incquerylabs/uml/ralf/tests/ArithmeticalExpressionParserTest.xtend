package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
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
class ArithmeticalExpressionParserTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	//Addition Expression
		//Expected: OK
	
	@Test
	def additionExpressionInteger() {
		val model = parseHelper.parse('''1 + 2;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check is first statement is an expression
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionReal() {
		val model = parseHelper.parse('''1.3 + 2.3;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check is first statement is an expression
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def additionExpressionRealInteger() {
		val model = parseHelper.parse('''1.3 + 2;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check is first statement is an expression
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionIntegerReal() {
		val model = parseHelper.parse('''1 + 2.3;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check is first statement is an expression
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def additionExpressionString() {
		val model = parseHelper.parse('''"1" + "2";''')
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof StringLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof StringLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as StringLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as StringLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
		
		//Expected: Validation ERROR
		
	@Test
	def additionExpressionIntegerString() {
		val model = parseHelper.parse('''1 + "2";''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof StringLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as StringLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);		
	}
	
	@Test
	def additionExpressionRealString() {
		val model = parseHelper.parse('''1.3 + "2";''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof StringLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as StringLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionStringInteger() {
		val model = parseHelper.parse('''"1" + 2;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof StringLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as StringLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionStringReal() {
		val model = parseHelper.parse('''"1" + 2.3;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof StringLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as StringLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def additionExpressionBooleanReal() {
		val model = parseHelper.parse('''true + 2.3;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof BooleanLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as BooleanLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def additionExpressionBooleanInteger() {
		val model = parseHelper.parse('''true + 2;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof BooleanLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof NaturalLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as BooleanLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionBooleanString() {
		val model = parseHelper.parse('''true + "2";''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof BooleanLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof StringLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as BooleanLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as StringLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def additionExpressionStringBoolean() {
		val model = parseHelper.parse('''"1" + true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof StringLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof BooleanLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as StringLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as BooleanLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def additionExpressionRealBoolean() {
		val model = parseHelper.parse('''1.3 + true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof BooleanLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as BooleanLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def additionExpressionIntegerBoolean() {
		val model = parseHelper.parse('''1 + true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof NaturalLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof BooleanLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as BooleanLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def additionExpressionBoolean() {
		val model = parseHelper.parse('''false + true;''')
		
		//check statements size
		assertEquals(1, model.statement.size)
		
		//check expression statements
		assertEquals(1, model.statement.filter(ExpressionStatementImpl).size)
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1 instanceof BooleanLiteralExpression)
		assertTrue(arithemticExpression.operand2 instanceof BooleanLiteralExpression)
		val operand1 = (arithemticExpression.operand1 as BooleanLiteralExpression)
		val operand2 = (arithemticExpression.operand2 as BooleanLiteralExpression)
		
		//Operand and operator values
		assertEquals("+", arithemticExpression.operator);
		assertEquals("false", operand1.image);
		assertEquals("true", operand2.image);
	}
	
}