package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.tests.util.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class LiteralExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "AffixExpression: Integer variable",
			    '''true;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''false;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''123;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''0b010101010101;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''0xAE10;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''123_456;''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''"ABC";''',
			    #[]
			],
			#[  "AffixExpression: Integer variable",
			    '''"AB\\C";''',
			    #[]
			]
		)
	}	
}