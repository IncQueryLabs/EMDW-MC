package com.incquerylabs.uml.ralf.tests.parser

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractParserTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AdditiveExpressionParserTest extends AbstractParserTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Addition expression: Integer-Integer",
			    '''1 + 2''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: Real-Real",
			    '''1.3 + 2.3''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: String-String",
			    '''"2" + "2"''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: Parse error",
			    '''1 + -''',
			    "AdditiveExpression",
			    true
			]
		)
	}
}