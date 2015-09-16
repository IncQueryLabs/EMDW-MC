package com.incquerylabs.uml.ralf.tests.validator.statements

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class ReturnStatementValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			
			#[  "InvalidBreakStatement: InvalidBreak_in_Statements",
			    '''break;''',
			    #["null"]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_Block",
			    '''{break;}''',
			    #["null"]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_If",
			    '''
				if(true){
					break;
				}''',
			    #["null"]
			],
			#[  "ReturnStatement: void return",
			    '''return;''',
			    #[]
			],
			#[  "InvalidReturnStatement: IntegerLiteral",
			    '''return 1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: RealLiteral",
			    '''return 1.1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: BooleanLiteral",
			    '''return false;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: StringLiteral",
			    '''return "1";''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Multiplication",
			    '''return 1*1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Addition",
			    '''return 1+1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Shift",
			    '''return 1>>1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Relational",
			    '''return 1>1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Equality",
			    '''return 1==1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: BitwiseOR",
			    '''return 1|1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: BitwiseAND",
			    '''return 1&1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: BitwiseXOR",
			    '''return 1^1;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: ConditionalAND",
			    '''return true && false;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: ConditionalOR",
			    '''return true || false;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: BooleanUnary",
			    '''return !true;''',
			    #["null"]
			],
			#[  "InvalidReturnStatement: Assignment",
			    '''
				Integer x = 1;
				return x = 2;''',
			    #["null"]
			]
		)
	}
}