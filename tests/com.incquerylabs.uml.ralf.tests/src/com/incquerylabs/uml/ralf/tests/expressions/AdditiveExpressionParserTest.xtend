package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.ArithmeticExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.BooleanLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.LiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.NaturalLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.reducedAlfLanguage.StringLiteralExpression
import com.incquerylabs.uml.ralf.reducedAlfLanguage.impl.ExpressionStatementImpl
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*
import com.incquerylabs.uml.ralf.reducedAlfLanguage.RealLiteralExpression
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class AdditiveExpressionParserTest {
		
	@Inject
	ParseHelper<Statements> parseHelper

	//Addition Expression
	//OK input
	@Test
	def additionExpressionInteger() {
		additionExpression('''1 + 2;''', 1,1,NaturalLiteralExpression, NaturalLiteralExpression, "+", "1","2")
	}
	
	@Test
	def additionExpressionReal() {
		additionExpression('''1.3 + 2.3;''', 1,1,RealLiteralExpression, RealLiteralExpression, "+", "1.3","2.3")
	}
	
	@Test
	def additionExpressionRealInteger() {
		additionExpression('''1.3 + 2;''', 1,1,RealLiteralExpression, NaturalLiteralExpression, "+", "1.3","2")
	}
	
	@Test
	def additionExpressionIntegerReal() {
		additionExpression('''1 + 2.3;''', 1,1,NaturalLiteralExpression, RealLiteralExpression, "+", "1","2.3")
	}
	
	@Test
	def additionExpressionString() {
		additionExpression('''"1" + "2";''', 1,1,StringLiteralExpression, StringLiteralExpression, "+", "1","2")
	}
		
	//Erroneous Input
		
	@Test
	def additionExpressionIntegerString() {
		additionExpression('''1 + "2";''', 1,1,NaturalLiteralExpression, StringLiteralExpression, "+", "1","2")	
	}
	
	@Test
	def additionExpressionRealString() {
		additionExpression('''1.3 + "2";''', 1,1,RealLiteralExpression, StringLiteralExpression, "+", "1.3","2")
	}
	
	@Test
	def additionExpressionStringInteger() {
		additionExpression('''"1" + 2;''', 1,1,StringLiteralExpression, NaturalLiteralExpression, "+", "1","2")
	}
	
	@Test
	def additionExpressionStringReal() {
		additionExpression('''"1" + 2.3;''', 1,1,StringLiteralExpression, RealLiteralExpression, "+", "1","2.3")
	}
	
	@Test
	def additionExpressionBooleanReal() {
		additionExpression('''true + 2.3;''', 1,1,BooleanLiteralExpression, RealLiteralExpression, "+", "true","2.3")
	}
	
	@Test
	def additionExpressionBooleanInteger() {
		additionExpression('''true + 2;''', 1,1,BooleanLiteralExpression, NaturalLiteralExpression, "+", "true","2")
	}
	
	@Test
	def additionExpressionBooleanString() {
		additionExpression('''true + "2";''', 1,1,BooleanLiteralExpression, StringLiteralExpression, "+", "true","2")
	}
	
	@Test
	def additionExpressionStringBoolean() {
		additionExpression('''"1" + true;''', 1,1,StringLiteralExpression, BooleanLiteralExpression, "+", "1","true")
	}
	
	@Test
	def additionExpressionRealBoolean() {
		additionExpression('''1.3 + true;''', 1,1,RealLiteralExpression, BooleanLiteralExpression, "+", "1.3","true")
	}
	
	@Test
	def additionExpressionIntegerBoolean() {
		additionExpression('''1 + true;''', 1,1,NaturalLiteralExpression, BooleanLiteralExpression, "+", "1","true")
	}
	
	@Test
	def additionExpressionBoolean() {
		additionExpression('''false + true;''', 1,1,BooleanLiteralExpression, BooleanLiteralExpression, "+", "false","true")
	}
	
	
	//Subtraction Expression
	//OK input
	@Test
	def subtractionExpressionInteger() {
		additionExpression('''1 - 2;''', 1,1,NaturalLiteralExpression, NaturalLiteralExpression, "-", "1","2")
	}
	
	@Test
	def subtractionExpressionReal() {
		additionExpression('''1.3 - 2.3;''', 1,1,RealLiteralExpression, RealLiteralExpression, "-", "1.3","2.3")
	}
	
	@Test
	def subtractionExpressionRealInteger() {
		additionExpression('''1.3 - 2;''', 1,1,RealLiteralExpression, NaturalLiteralExpression, "-", "1.3","2")
	}
	
	@Test
	def subtractionExpressionIntegerReal() {
		additionExpression('''1 - 2.3;''', 1,1,NaturalLiteralExpression, RealLiteralExpression, "-", "1","2.3")
	}
	
	//Erroneous input
	
	@Test
	def subtractionExpressionString() {
		additionExpression('''"1" - "2";''', 1,1,StringLiteralExpression, StringLiteralExpression, "-", "1","2")
	}
		
	@Test
	def subtractionExpressionIntegerString() {
		additionExpression('''1 - "2";''', 1,1,NaturalLiteralExpression, StringLiteralExpression, "-", "1","2")		
	}
	
	@Test
	def subtractionExpressionRealString() {
		additionExpression('''1.3 - "2";''', 1,1,RealLiteralExpression, StringLiteralExpression, "-", "1.3","2")
	}
	
	@Test
	def subtractionExpressionStringInteger() {
		additionExpression('''"1" - 2;''', 1,1,StringLiteralExpression, NaturalLiteralExpression, "-", "1","2")
	}
	
	@Test
	def subtractionExpressionStringReal() {
		additionExpression('''"1" - 2.3;''', 1,1,StringLiteralExpression, RealLiteralExpression, "-", "1","2.3")
	}
	
	@Test
	def subtractionExpressionBooleanReal() {
		additionExpression('''true - 2.3;''', 1,1,BooleanLiteralExpression, RealLiteralExpression, "-", "true","2.3")
	}
	
	@Test
	def subtractionExpressionBooleanInteger() {
		additionExpression('''true - 2;''', 1,1,BooleanLiteralExpression, NaturalLiteralExpression, "-", "true","2")
	}
	
	@Test
	def subtractionExpressionBooleanString() {
		additionExpression('''true - "2";''', 1,1,BooleanLiteralExpression, StringLiteralExpression, "-", "true","2")
	}
	
	@Test
	def subtractionExpressionStringBoolean() {
		additionExpression('''"1" - true;''', 1,1,StringLiteralExpression, BooleanLiteralExpression, "-", "1","true")
	}
	
	@Test
	def subtractionExpressionRealBoolean() {
		additionExpression('''1.3 - true;''', 1,1,RealLiteralExpression, BooleanLiteralExpression, "-", "1.3","true")
	}
	
	@Test
	def subtractionExpressionIntegerBoolean() {
		additionExpression('''1 - true;''', 1,1,NaturalLiteralExpression, BooleanLiteralExpression, "-", "1","true")
	}
	
	@Test
	def subtractionExpressionBoolean() {
		additionExpression('''false - true;''', 1,1,BooleanLiteralExpression, BooleanLiteralExpression, "-", "false","true")
	}
	
	
	private def additionExpression(String code, int numberOfStatements, 
		int numberOfExpressions, Class<?> operand1Class,
		Class<?> operand2Class, String operator, String operand1value, String operand2value
	) {
		val model = parseHelper.parse(code)
		
		//check statements size
		assertEquals(numberOfStatements, model.statement.size) 
		
		//check is first statement is an expression
		assertEquals(numberOfExpressions, model.statement.filter(ExpressionStatementImpl).size) 
		val expressionStatement = (model.statement.filter(ExpressionStatementImpl).head as ExpressionStatementImpl)
		
		//arithmetic expression is contained
		assertTrue(expressionStatement.expression instanceof ArithmeticExpression)
		val arithemticExpression = (expressionStatement.expression as ArithmeticExpression)
		
		//Operands properly typed
		assertTrue(operand1Class.isAssignableFrom(arithemticExpression.operand1.class)) 
		assertTrue(operand2Class.isAssignableFrom(arithemticExpression.operand2.class))
		
		val operand1 = (arithemticExpression.operand1 as LiteralExpression) 
		val operand2 = (arithemticExpression.operand2 as LiteralExpression)
		
		//Operand and operator values
		assertEquals(operator, arithemticExpression.operator); 
		assertEquals(operand1value, operand1.value);					
		assertEquals(operand2value, operand2.value);					
	}
	
}