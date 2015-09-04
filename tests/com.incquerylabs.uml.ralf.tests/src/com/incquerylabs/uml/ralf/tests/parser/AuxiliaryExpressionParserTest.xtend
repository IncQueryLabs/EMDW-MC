package com.incquerylabs.uml.ralf.tests.parser

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractParserTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AuxiliaryExpressionParserTest extends AbstractParserTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Unary Numeric: Affix Increment",
			    '''
				Integer x = 1;
				-++x;''',
			    "NumericUnaryExpression",
			    true
			],
			#[  "Unary Numeric: Affix Decrement",
			    '''
				Integer x = 1;
				---x;''',
			    "NumericUnaryExpression",
			    true
			],
			#[  "Unary Numeric Positive: Affix Increment",
			    '''
				Integer x = 1;
				+++x;''',
			    "NumericUnaryExpression",
			    true
			],
			#[  "Unary Numeric Positive: Affix Decrement",
			    '''
				Integer x = 1;
				+--x;''',
			    "NumericUnaryExpression",
			    true
			]
		)
	}
}