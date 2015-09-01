package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class MultiplicativeExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			//multiplication
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 * 2;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 * 2.3;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 * 2;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 * 2.3;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: Addition",
			    '''1 * (2+3);''',
			    #[]
			],
			#[  "MultiplicationExpression: Multiple",
			    '''1 * 2 * 3 * 4;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				1*x;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 * -2;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: PrefixDecrement",
			    '''
				Integer x = 1;
				1 * --x;''',
			    #[]
			],
			#[  "MultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: PostFixDecrement",
			    '''
				Integer x = 1;
				1 * x--;''',
			    #[]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" * "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 * "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 * "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" * 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true * 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true * "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" * true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 * true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 * true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidMultiplicationExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false * true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			//Division
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 / 2;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 / 2.3;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 / 2;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 / 2.3;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: Parenthesis",
			    '''1 / (2-3);''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : Multiple",
			    '''1 / 2 / 3 / 4;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				1/x;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 / -2;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: PrefixDecrement",
			    '''
				Integer x = 1;
				1 / --x;''',
			    #[]
			],
			#[  "DivisionExpression: Parameter1 : IntegerLiteral, Parameter2: PostFixDecrement",
			    '''
				Integer x = 2;
				1 / x--;''',
			    #[]
			],
			#[  "InvalidDivisionExpression: Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" / "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 / "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 / "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" / 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : StringLiteral, Parameter2: RealLiteral",
			    '''"1" / 2.3;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true / 2.3;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true / 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true / "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" / true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 / true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 / true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidDivisionExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false / true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			//modulo
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerLiteral",
			    '''1 % 2;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : RealLiteral, Parameter2: RealLiteral",
			    '''1.3 % 2.3;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : RealLiteral, Parameter2: IntegerLiteral",
			    '''1.3 % 2;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: RealLiteral",
			    '''1 % 2.3;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: Parenthesis",
			    '''1 % (2-3);''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : Multiple",
			    '''1 % 2 % 3 % 4;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: IntegerVariable",
			    '''
				Integer x = 1;
				1 % x;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: NumericUnary",
			    '''1 % -2;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: PrefixDecrement",
			    '''
				Integer x = 1;
				1 % --x;''',
			    #[]
			],
			#[  "ModuloExpression: Parameter1 : IntegerLiteral, Parameter2: PostFixDecrement",
			    '''
				Integer x = 1;
				1 % x--;''',
			    #[]
			],
			#[  "InvalidModuloExpression: Parameter1 : StringLiteral, Parameter2: StringLiteral",
			    '''"1" % "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : IntegerLiteral, Parameter2: StringLiteral",
			    '''1 % "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : RealLiteral, Parameter2: StringLiteral",
			    '''1.3 % "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : StringLiteral, Parameter2: IntegerLiteral",
			    '''"1" % 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : StringLiteral, Parameter2: RealLiteral",
			    '''"1" % 2.3;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : BooleanLiteral, Parameter2: RealLiteral",
			    '''true % 2.3;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : BooleanLiteral, Parameter2: IntegerLiteral",
			    '''true % 2;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : BooleanLiteral, Parameter2: StringLiteral",
			    '''true % "2";''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : StringLiteral, Parameter2: BooleanLiteral",
			    '''"1" % true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : RealLiteral, Parameter2: BooleanLiteral",
			    '''1.3 % true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : IntegerLiteral, Parameter2: BooleanLiteral",
			    '''1 % true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			],
			#[  "InvalidModuloExpression: Parameter1 : BooleanLiteral, Parameter2: BooleanLiteral",
			    '''false % true;''',
			    #[ReducedAlfSystem.ARITHMETICEXPRESSION]
			]
		)
	}
}