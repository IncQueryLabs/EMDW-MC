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
class AssignmentExpressionParserTest {
	
	@Inject
	IGrammarAccess grammarAccess;
	
	@Inject
	IParser parser;
	
	@Test
	def assignmentExpressionIntegerLiteral() {
		assignmentParseError('''
		1 = 2;
		''', "AssignmentExpression");
	}
	
	@Test
	def assignmentExpressionStringLiteral() {
		assignmentParseError('''
		"String" = "A";
		''', "AssignmentExpression");
	}
	
	@Test
	def assignmentExpressionRealLiteral() {
		assignmentParseError('''
		1.1 = 2.2;
		''', "AssignmentExpression");
	}
	
	@Test
	def assignmentExpressionBooleanLiteral() {
		assignmentParseError('''
		true = false;
		''', "AssignmentExpression");
	}
	
	private def assignmentParseError(String text, String rulename) {
		val grammar = grammarAccess.getGrammar();
		val rule = GrammarUtil.findRuleForName(grammar,rulename) as ParserRule ;
		val result = parser.parse(rule, new StringReader(text));
		assertEquals("There were no parse errors", false, result.getSyntaxErrors().isEmpty)
	}
}