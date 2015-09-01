package com.incquerylabs.uml.ralf.tests.parser

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractParserTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters


class PostfixExpressionParserTest extends AbstractParserTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Postfix Increment: Integer Literal",
			    '''
				1++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: Real Literal",
			    '''
				1.1++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: Integer Literal Parentheses",
			    '''
				(1)++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: Real Literal Parentheses",
			    '''
				(1.1)++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: Boolean Literal",
			    '''
				true++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: String Literal",
			    '''
				"a"++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: String Literal Parentheses",
			    '''
				("a")++''',
			    "PostfixExpression",
			    false
			],
			#[  "Postfix Increment: Numeric Unary Negative",
			    '''
				-1++''',
			    "PostfixExpression",
			    true
			],
			#[  "Postfix Increment: Numeric Unary Positive",
			    '''
				+1++''',
			    "PostfixExpression",
			    true
			],
			#[  "Postfix Increment: Prefix increment",
			    '''
				++1++''',
			    "PostfixExpression",
			    true
			],
			#[  "Postfix Increment: Prefix Decrement",
			    '''
				--1++''',
			    "PostfixExpression",
			    true
			],
			#[  "Postfix Increment: variable",
			    '''++x''',
			    "PostfixExpression",
			    true
			]
		)
	}
}