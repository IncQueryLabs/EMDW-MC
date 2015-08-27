package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AdditiveExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 + 2;''',
			    #[]
			],
			#[  "Addition, Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 + 2.3;''',
			    #[]
			],
			#[  "Addition, Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 + 2;''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 + 2.3;''',
			    #[]
			],
			#[  "Addition, Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" + "2";''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: Addition",
			    '''1 + (2+3);''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: Multiplication",
			    '''1 + 2*3;''',
			    #[]
			],
			#[  "Multiple addition",
			    '''1 + 2 + 3 + 4;''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				1+x;''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 + -2;''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: PrefixDecrement",
			    '''
				Integer x = 1;
				1 + --x;''',
			    #[]
			],
			#[  "Addition, Parameter1 : IntegerLiteral, Parameter2: PostFixDecrement",
			    '''
				Integer x = 1;
				1 + x--;''',
			    #[]
			],
			#[  "InvalidAddition, Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 + "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 + "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" + 2;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : StringLiteral, Parameter2: RealLiteral",
			    '''"1" + 2.3;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true + 2.3;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true + 2;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true + "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" + true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 + true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 + true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidAddition, Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false + true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 - 2;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 - 2.3;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 - 2;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 - 2.3;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: Addition",
			    '''1 - (2+3);''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: Multiplication",
			    '''1 - 2*3;''',
			    #[]
			],
			#[  "Multiple subtraction",
			    '''1 - 2 - 3 - 4;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				1-x;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 - -2;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: PrefixDecrement",
			    '''
				Integer x = 1;
				1 - --x;''',
			    #[]
			],
			#[  "Subtraction, Parameter1 : IntegerLiteral, Parameter2: PostFixDecrement",
			    '''
				Integer x = 1;
				1 - x--;''',
			    #[]
			],
			#[  "InvalidSubtraction, Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" - "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 - "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 - "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" - 2;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : StringLiteral, Parameter2: RealLiteral",
			    '''"1" - 2.3;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true - 2.3;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true - 2;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true - "2";''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" - true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 - true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 - true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidSubtraction, Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false - true;''',
				#[ReducedAlfSystem.ARITHMETICEXPRESSION]
			]
		)
	}
			
}