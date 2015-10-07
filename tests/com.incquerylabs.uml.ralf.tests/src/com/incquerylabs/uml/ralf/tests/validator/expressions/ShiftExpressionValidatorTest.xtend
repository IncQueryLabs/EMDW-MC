package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class ShiftExpressionValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 >> 2;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: Addition_Parentheses",
			    '''1 >> (2+3);''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: Multiplication",
			    '''1 >> 2*3;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: Addition",
			    '''1 >> 2+3;''',
			    #[]
			],
			#[  "ShiftExpression: Multiple",
			    '''1 >> 2 >> 3 >> 4;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerVariable, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				x >> 1;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 >> -2;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : Prefix decrement, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				--x >> 1;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : postfix decrement, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				x-- >> 1;''',
			    #[]
			],
			#[  "ShiftExpression: Parameter1 : IntegerLiteral, Parameter2: division",
			    '''1 >> 1/2;''',
			    #[]
			],
			#[  "InvalidShiftExpression: Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 >> 2.3;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 >> 2;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 >> 2.3;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" >> "2";''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : IntegerLiteral, Parameter2: Division_Real",
			    '''1 >> 1/2.5;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 >> "2";''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 >> "2";''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" >> 2;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : StringLiteral, Parameter2: RealLiteral",
			    '''"1" >> 2.3;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true >> 2.3;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true >> 2;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true >> "2";''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" >> true;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 >> true;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 >> true;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			],
			#[  "InvalidShiftExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false >> true;''',
			    #[ReducedAlfSystem.SHIFTEXPRESSION]
			]
		)
	}
}