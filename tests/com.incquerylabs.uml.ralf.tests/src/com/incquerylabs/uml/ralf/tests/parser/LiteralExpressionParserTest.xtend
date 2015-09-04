package com.incquerylabs.uml.ralf.tests.parser

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractParserTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class LiteralExpressionParserTest extends AbstractParserTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Boolean Literal: true",
			    '''true''',
			    "BooleanLiteralExpression",
			    false
			],
			#[  "Boolean Literal: false",
			    '''false''',
			    "BooleanLiteralExpression",
			    false
			],
			#[  "Natural Literal: Decimal",
			    '''123''',
			    "NaturalLiteralExpression",
			    false
			],
			#[  "Natural Literal: Binary",
			    '''0b010101010101''',
			    "NaturalLiteralExpression",
			    false
			],
			#[  "Natural Literal: Hex",
			    '''0xAE10''',
			    "NaturalLiteralExpression",
			    false
			],
			#[  "Natural Literal: Underscore",
			    '''123_456''',
			    "NaturalLiteralExpression",
			    false
			],
			#[  "String Literal: valid",
			    '''"ABC"''',
			    "StringLiteralExpression",
			    false
			],
			#[  "String Literal: break",
			    '''"AB\"C"''',
			    "StringLiteralExpression",
			    false
			]
			
		)
	}
}