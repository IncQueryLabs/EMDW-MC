package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class RelationalExpressionValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "RelationalExpression: Integer variable",
			    '''1 > 2;''',
			    #[]
			],
			#[  "RelationalExpression: Addition Parenthesis",
			    '''1 > (2+3);''',
			    #[]
			],
			#[  "RelationalExpression: Multiplication",
			    '''1 > 2*3;''',
			    #[]
			],
			#[  "RelationalExpression: Addition",
			    '''1 > 2+3;''',
			    #[]
			],
			#[  "RelationalExpression: Shift",
			    '''1 > 2>>3;''',
			    #[]
			],
			#[  "RelationalExpression: Integer variable",
			    '''
				Integer x = 1;
				x > 1;''',
			    #[]
			],
			#[  "RelationalExpression: Numeric unary",
			    '''1 > -2;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: Real literal, Operand2: Real literal",
			    '''1.3 > 2.3;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: Real literal, Operand2: Integer literal",
			    '''1.3 > 2;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: Integer literal, Operand2: Real literal",
			    '''1 > 2.3;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: Integer literal, Operand2: division",
			    '''1 > 1/2;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: prefix decrement, Operand2: Integer literal",
			    '''
				Integer x = 1;
				--x > 1;''',
			    #[]
			],
			#[  "RelationalExpression: Operand1: postfix decrement, Operand2: Integer literal",
			    '''
				Integer x = 1;
				x-- > 1;''',
			    #[]
			],
			#[  "InvalidRelationalExpression: Operand1: String literal, Operand2: String literal",
			    '''"1" > "2";''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Integer literal, Operand2: String literal",
			    '''1 > "2";''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Real literal, Operand2: String literal",
			    '''1.3 > "2";''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: String literal, Operand2: Integer literal",
			    '''"1" > 2;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: String literal, Operand2: Real literal",
			    '''"1" > 2.3;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Boolean literal, Operand2: Real literal",
			    '''true > 2.3;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Boolean literal, Operand2: Integer literal",
			    '''true > 2;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Boolean literal, Operand2: String literal",
			    '''true > "2";''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: String literal, Operand2: Boolean literal",
			    '''"1" > true;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Real literal, Operand2: Boolean literal",
			    '''1.3 > true;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Integer literal, Operand2: Boolean literal",
			    '''1 > true;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			],
			#[  "InvalidRelationalExpression: Operand1: Boolean literal, Operand2: Boolean literal",
			    '''false > true;''',
			    #[ReducedAlfSystem.RELATIONALEXPRESSION]
			]
		)
	}	
}