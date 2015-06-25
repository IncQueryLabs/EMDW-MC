package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.impl.ExpressionStatementImpl
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
import com.incquerylabs.uml.ralf.tests.util.parameterized.Generator
import com.incquerylabs.uml.ralf.tests.util.parameterized.ListGenerator
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.FixMethodOrder
import org.junit.Rule
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static java.util.Arrays.asList
import static org.junit.Assert.*


@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class AdditiveExpressionParserTest {
	
	@Rule
    public Generator<Parameter> params =
        new ListGenerator(asList(
        new Parameter('''1 + 2;''', 1,1,NaturalLiteralExpression, NaturalLiteralExpression, "+", "1","1")
        ));
	
	@Inject
	ParseHelper<Statements> parseHelper

	//Addition Expression
		//Expected: OK
	
	@Test
	def additionExpressionInteger() {
		val model = parseHelper.parse(params.value.code)
		
		//check statements size
		assertEquals(params.value.numberOfStatements, model.statement.size) 
		
		//check is first statement is an expression
		assertEquals(params.value.numberOfExpressions, model.statement.filter(ExpressionStatementImpl).size) 
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(arithemticExpression.operand1.class.equals(params.value.operand1Class)) 
		assertTrue(arithemticExpression.operand2.class.equals(params.value.operand2Class))
		
		val operand1 = (arithemticExpression.operand1 as NaturalLiteralExpression) 
		val operand2 = (arithemticExpression.operand2 as NaturalLiteralExpression)
		
		//Operand and operator values
		assertEquals(params.value.operator, arithemticExpression.operator); 
		assertEquals(params.value.operand1Image, operand1.image);					
		assertEquals(params.value.operand2Image, operand2.image);					
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
	
	
	//Subtraction Expression
	
	@Test
	def subtractionExpressionInteger() {
		val model = parseHelper.parse('''1 - 2;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionReal() {
		val model = parseHelper.parse('''1.3 - 2.3;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def subtractionExpressionRealInteger() {
		val model = parseHelper.parse('''1.3 - 2;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionIntegerReal() {
		val model = parseHelper.parse('''1 - 2.3;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def subtractionExpressionString() {
		val model = parseHelper.parse('''"1" - "2";''')
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
		
	@Test
	def subtractionExpressionIntegerString() {
		val model = parseHelper.parse('''1 - "2";''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);		
	}
	
	@Test
	def subtractionExpressionRealString() {
		val model = parseHelper.parse('''1.3 - "2";''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionStringInteger() {
		val model = parseHelper.parse('''"1" - 2;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionStringReal() {
		val model = parseHelper.parse('''"1" - 2.3;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def subtractionExpressionBooleanReal() {
		val model = parseHelper.parse('''true - 2.3;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2.3", operand2.image);
	}
	
	@Test
	def subtractionExpressionBooleanInteger() {
		val model = parseHelper.parse('''true - 2;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionBooleanString() {
		val model = parseHelper.parse('''true - "2";''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("true", operand1.image);
		assertEquals("2", operand2.image);
	}
	
	@Test
	def subtractionExpressionStringBoolean() {
		val model = parseHelper.parse('''"1" - true;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def subtractionExpressionRealBoolean() {
		val model = parseHelper.parse('''1.3 - true;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1.3", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def subtractionExpressionIntegerBoolean() {
		val model = parseHelper.parse('''1 - true;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("1", operand1.image);
		assertEquals("true", operand2.image);
	}
	
	@Test
	def subtractionExpressionBoolean() {
		val model = parseHelper.parse('''false - true;''')
		
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
		assertEquals("-", arithemticExpression.operator);
		assertEquals("false", operand1.image);
		assertEquals("true", operand2.image);
	}
	
}

class Parameter {
    String code
    int numberOfStatements
    int numberOfExpressions
    Class<?> operand1Class
    Class<?> operand2Class
    String operator
    String operand1Image
    String operand2Image
    
    new(String code, int numberOfStatements, int numberOfExpressions
        , Class<?> operand1Class, Class<?> operand2Class, String operator
        , String operator1Image, String operator2Image
    ) {
        this.code = code
        this.numberOfStatements = numberOfStatements
        this.numberOfExpressions = numberOfExpressions
        this.operand1Class = operand1Class
        this.operand2Class = operand2Class
        this.operator = operator
        this.operand1Image = operand1Image
        this.operand2Image = operator2Image
    }
    def String getCode() {
        return code;
    }
    def int getNumberOfStatements() {
        return numberOfStatements;
    }
    def int getNumberOfExpressions() {
        return numberOfExpressions;
    }
    def Class<?> getOperand1Class() {
        return operand1Class;
    }
    def Class<?> getOperand2Class() {
        return operand2Class;
    }
    def String getOperator() {
        return operator;
    }
    def String getOperand1Image() {
        return operand1Image;
    }
    def String getOperand2Image() {
        return operand2Image;
    }
    
}

