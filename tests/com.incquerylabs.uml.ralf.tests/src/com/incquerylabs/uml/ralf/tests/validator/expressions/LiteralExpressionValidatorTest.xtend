package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class LiteralExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Boolean literal true",
			    '''true;''',
			    #[]
			],
			#[  "Boolean literal false",
			    '''false;''',
			    #[]
			],
			#[  "Natural literal: decimal",
			    '''123;''',
			    #[]
			],
			#[  "Natural literal: binary",
			    '''0b010101010101;''',
			    #[]
			],
			#[  "Natural literal: hex",
			    '''0xAE10;''',
			    #[]
			],
			#[  "Natural literal: underscore",
			    '''123_456;''',
			    #[]
			],
			#[  "String literal: valid",
			    '''"ABC";''',
			    #[]
			],
			#[  "String literal: break",
			    '''"AB\"C";''',
			    #[]
			]
		)
	}	
}