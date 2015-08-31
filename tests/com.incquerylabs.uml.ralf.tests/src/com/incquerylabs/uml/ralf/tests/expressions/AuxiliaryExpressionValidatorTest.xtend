package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AuxiliaryExpressionValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Parenthesis: Integer literal",
			    '''(1);''',
			    #[]
			],
			#[  "Parenthesis: Boolean literal",
			    '''(true);''',
			    #[]
			],
			#[  "Parenthesis: String literal",
			    '''("String");''',
			    #[]
			],
			#[  "Parenthesis: Real literal",
			    '''(1.1);''',
			    #[]
			],
			#[  "Parenthesis: Addition",
			    '''(1+2);''',
			    #[]
			],
			#[  "Parenthesis: Multiplication",
			    '''(1*2);''',
			    #[]
			],
			#[  "Parenthesis: Parenthesis",
			    '''((1));''',
			    #[]
			],
			#[  "Parenthesis: Shift",
			    '''(1>>2);''',
			    #[]
			],
			#[  "Parenthesis: Relational",
			    '''(1 < 2);''',
			    #[]
			],
			#[  "Parenthesis: Equality",
			    '''(1 == 2);''',
			    #[]
			],
			#[  "Parenthesis: Boolean unary",
			    '''(!true);''',
			    #[]
			],
			#[  "Parenthesis: Bitwise XOR",
			    '''(true ^ false);''',
			    #[]
			],
			#[  "Parenthesis: Bitwise OR",
			    '''(true | false);''',
			    #[]
			],
			#[  "Parenthesis: Bitwise AND",
			    '''(true & false);''',
			    #[]
			],
			#[  "Parenthesis: Conditional AND",
			    '''(true && false);''',
			    #[]
			],
			#[  "Parenthesis: Conditional OR",
			    '''(true || false);''',
			    #[]
			],
			#[  "Parenthesis: Assignment",
			    '''
				Integer x = 1;
				(x = 2);''',
			    #[]
			],
			#[  "Parenthesis: Integer variable",
			    '''
				Integer x = 1;
				(x);''',
			    #[]
			],
			#[  "Parenthesis: Conditional test ",
			    '''(true ? "test" : "test2");''',
			    #[]
			],
			#[  "Numeric unary: Integer literal",
			    '''-1;''',
			    #[]
			],
			#[  "Numeric unary: Real literal",
			    '''-1.1;''',
			    #[]
			],
			#[  "Numeric unary: Parenthesis",
			    '''-(1);''',
			    #[]
			],
			#[  "Numeric unary: Integer variable",
			    '''
				Integer x = 1;
				-x;''',
			    #[]
			],
			#[  "Numeric unary: Prefix decrement, negative",
			    '''
				Integer x = 1;
				-(--x);''',
			    #[]
			],
			#[  "Numeric unary: Prefix increment, negative",
			    '''
				Integer x = 1;
				-(++x);''',
			    #[]
			],
			#[  "Numeric unary: Prefix decrement, positive",
			    '''
				Integer x = 1;
				+(--x);''',
			    #[]
			],
			#[  "Numeric unary: Prefix increment, positive",
			    '''
				Integer x = 1;
				+(++x);''',
			    #[]
			],
			#[  "Invalid Numeric unary: Boolean unary",
			    '''-!true;''',
			    #[ReducedAlfSystem.NUMERICUNARYEXPRESSION]
			],
			#[  "Invalid Numeric unary: Boolean literal",
			    '''-true;''',
			    #[ReducedAlfSystem.NUMERICUNARYEXPRESSION]
			],
			#[  "Invalid Numeric unary: String literal",
			    '''-"String";''',
			    #[ReducedAlfSystem.NUMERICUNARYEXPRESSION]
			],
			#[  "Invalid Numeric unary: Invalid parenthesis",
			    '''-("1");''',
			    #[ReducedAlfSystem.NUMERICUNARYEXPRESSION]
			],
			#[  "Invalid Numeric unary: Invalid variable type",
			    '''
				String x = "1";
				-x;''',
			    #[ReducedAlfSystem.NUMERICUNARYEXPRESSION]
			],
			#[  "Boolean unary: Parenthesis",
			    '''!(true);''',
			    #[]
			],
			#[  "Boolean unary: Boolean variable",
			    '''
				Boolean x = true;
				!x;''',
			    #[]
			],
			#[  "Boolean unary: Boolean unary",
			    '''!!true;''',
			    #[]
			],
			#[  "Boolean unary: Boolean literal",
			    '''!true;''',
			    #[]
			],
			#[  "Invalid Boolean unary: String literal",
			    '''!"String";''',
			    #[ReducedAlfSystem.LOGICALUNARYEXPRESSION]
			],
			#[  "Invalid Boolean unary: Invalid parenthesis type",
			    '''!("1");''',
			    #[ReducedAlfSystem.LOGICALUNARYEXPRESSION]
			],
			#[  "Invalid Boolean unary: Invalid variable type",
			    '''
				String x = "1";
				!x;''',
			    #[ReducedAlfSystem.LOGICALUNARYEXPRESSION]
			],
			#[  "Invalid Boolean unary: Integer literal",
			    '''!1;''',
			    #[ReducedAlfSystem.LOGICALUNARYEXPRESSION]
			],
			#[  "Invalid Boolean unary: Real literal",
			    '''!1.1;''',
			    #[ReducedAlfSystem.LOGICALUNARYEXPRESSION]
			]
		)
	}	
}