package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import java.io.StringReader
import org.eclipse.xtext.GrammarUtil
import org.eclipse.xtext.IGrammarAccess
import org.eclipse.xtext.ParserRule
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.parser.IParser
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class PostfixExpressionParserTest {

	@Inject
	IGrammarAccess grammarAccess;
	
	@Inject
	IParser parser;
	
	@Test
	def postfixIncrementIntegerLiteral() {
		postfixParseError('''1++;''', "PostfixExpression")
	}
		
	@Test
	def postfixIncrementReaLiteral() {
		postfixParseError('''1.1++;''', "PostfixExpression")
	}
		
	@Test
	def postfixIncrementParenthesisIntLiteral() {
		postfixParseError('''(1)++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementParenthesisRealLiteral() {
		postfixParseError('''(1.1)++;''', "PostfixExpression")
	}

	@Test
	def postfixIncrementBooleanLiteral() {
		postfixParseError('''true++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementStringLiteral() {
		postfixParseError('''"String"++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementParenthesisInvalidType() {
		postfixParseError('''("1")++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementNumericUnaryNegative() {
		postfixParseError('''-1++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementNumericUnaryPositive() {
		postfixParseError('''+1++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementAffixIncrement() {
		
		postfixParseError('''++1++;''', "PostfixExpression")
	}
	
	@Test
	def postfixIncrementAffixDecrement() {
		postfixParseError('''--1++;''', "PostfixExpression")
		
	}	
	
	private def postfixParseError(String text, String rulename) {
		val grammar = grammarAccess.getGrammar();
		val rule = GrammarUtil.findRuleForName(grammar,rulename) as ParserRule ;
		val result = parser.parse(rule, new StringReader(text));
		assertEquals("There were no parse errors", false, result.getSyntaxErrors().isEmpty)
	}
}