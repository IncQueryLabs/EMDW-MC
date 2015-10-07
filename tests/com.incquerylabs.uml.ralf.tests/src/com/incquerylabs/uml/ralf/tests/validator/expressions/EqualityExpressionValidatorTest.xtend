package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class EqualityExpressionValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 == 2;''',
			    #[]
			],
			#[  "EqualityExpression: Multiple",
			    '''1 == 2 == true;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" == "2";''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false == true;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: Parenthesis",
			    '''1 == (2+3);''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: Multiplication",
			    '''1 == 2*3;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: Addition",
			    '''1 == 2+3;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: Shift",
			    '''1 == 2>>3;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : BooleanLiteral, Parameter2: Relational",
			    '''true == 2>3;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerVariable, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				x == 1;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerVariable, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				Integer y = 1;
				x == y;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 == -2;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanUnary",
			    '''false == !true;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 == 2.3;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : IntegerLiteral, Parameter2: Division(Integer)",
			    '''1 == 1/2;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : PrefixDecrement, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				--x == 1;''',
			    #[]
			],
			#[  "EqualityExpression: Parameter1 : PostfixDecrement, Parameter2: IntegerLiteral",
			    '''
				Integer x = 1;
				x-- == 1;''',
			    #[]
			],
			#[  "InvalidEqualityExpression: Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 == "2";''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 == "2";''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" == 2;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true == 2.3;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true == 2;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true == "2";''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" == true;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 == true;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			],
			#[  "InvalidEqualityExpression: Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 == true;''',
			    #[ReducedAlfSystem.EQUALITYEXPRESSION]
			]
		)
	}
}
	