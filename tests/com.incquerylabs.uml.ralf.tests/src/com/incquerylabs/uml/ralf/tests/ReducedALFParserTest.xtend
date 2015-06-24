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
class ReducedALFParserTest {

	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ReducedAlfSystemValidator validator

	@Inject
	Injector injector

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
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
		
		tester.validate(model).assertOK
		model.assertNoErrors
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
		
		tester.validate(model).assertOK
		model.assertNoErrors
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
		tester.validate(model).assertOK
		model.assertNoErrors
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
		
		tester.validate(model).assertOK
		model.assertNoErrors
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

		tester.validate(model).assertOK
		model.assertNoErrors
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
		
		tester.validate(model).assertError(0)
		
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
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
		
		tester.validate(model).assertError(0)
	}
	

	
	
	
	@Test
	def simpleLocalVariable() {
		val model = parseHelper.parse('''let x : Integer = 1 + 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def hexadecimalLiteral() {
		val model = parseHelper.parse('''let x : Integer = 0xAE10;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def underscoreLiteral() {
		val model = parseHelper.parse('''let x : Integer = 123_456;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def multipleAdditions() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1 + 2;
		let y : Integer = 1 + 2;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def chainedAddition() {
		val model = parseHelper.parse('''let x : Integer = 1 + 2 + 3 + 4;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def parenthesedAddition() {
		val model = parseHelper.parse('''let x : Integer = (1 * (2 + 3)) + 4;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def localVariableReference() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1 + 2;
		let y : Integer = x + 2;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def incrementOperation() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1;
		x++;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def incrementOperationPrefix() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1;
		++x;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def decrementOperation() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1;
		x--;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def decrementOperationPrefix() {
		val model = parseHelper.parse(
		'''
		let x : Integer = 1;
		--x;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def leftShift() {
		val model = parseHelper.parse(
		'''
        let x : Integer = 1;
        let y : Integer = x << 1;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def rightShift() {
		val model = parseHelper.parse(
		'''
        let x : Integer = 1;
        let y : Integer = x >> 1;
		'''
		)
		tester.validate(model).assertOK
	}
	
	@Test
	def shiftPrecedence() {
		val model = parseHelper.parse('''let x : Integer = 1 + (2 >> 3);''')
		tester.validate(model).assertOK
	}
	
	@Test
	def comparisonLesserThan() {
		val model = parseHelper.parse('''let x : Boolean = 1 < 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def comparisonLesserOrEquals() {
		val model = parseHelper.parse('''let x : Boolean = 1 <= 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def comparisonGreaterThan() {
		val model = parseHelper.parse('''let x : Boolean = 1 > 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def comparisonGreaterOrEquals() {
		val model = parseHelper.parse('''let x : Boolean = 1 >= 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def equality() {
		val model = parseHelper.parse('''let x : Boolean = 1 == 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def inEquality() {
		val model = parseHelper.parse('''let x : Boolean = 1 == 2;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def logicalBitwiseAnd() {
		val model = parseHelper.parse('''let x : Boolean = 1 != 2 & false;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def logicalBitwiseOr() {
		val model = parseHelper.parse('''let x : Boolean = 1 != 2 ^ false;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def logicalNot() {
		val model = parseHelper.parse('''let x : Boolean = 1 != 2 | false;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def logicalAnd() {
		val model = parseHelper.parse('''let x : Boolean = 1 != 2 && true;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def logicalOr() {
		val model = parseHelper.parse('''let x : Boolean = 1 != 2 || true;''')
		tester.validate(model).assertOK
	}
	
	@Test
	def conditionalTestOperation() {
		val model = parseHelper.parse('''let x : String = (1 != 2) ? "test" : "test2";''')
		tester.validate(model).assertOK
	}
	
	@Test
	def assignment() {
		val model = parseHelper.parse(''' y = 2;''')
		tester.validate(model).assertOK
	}

}