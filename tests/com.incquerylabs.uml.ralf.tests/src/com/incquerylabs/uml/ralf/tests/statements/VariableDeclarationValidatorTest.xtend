package com.incquerylabs.uml.ralf.tests.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class VariableDeclarationValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "VariableDeclarationStatement: RealVariable_NORHS",
			    '''Real x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: IntegerVariable_NORHS",
			    '''Integer x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: StringVariable_NORHS",
			    '''String x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: BooleanVariable_NORHS",
			    '''Boolean x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: IntegerLiteral",
			    '''Integer x = 1;''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: String_cannot_be_null",
			    '''String x = null;''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Integer_cannot_be_null",
			    '''Integer x = null;''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Real_cannot_be_null",
			    '''Real x = null;''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Boolean_cannot_be_null",
			    '''Boolean x = null;''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "VariableDeclarationStatement: RHS: IntegerLiteral",
			    '''Integer x = 1+2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Integer x = 1*2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Integer x = -1;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Integer x = 1>>2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 == 2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = !(1 < 2);''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2 ^ false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2 | false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2 & false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2 && false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''Boolean x = 1 < 2 || false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''String x = (1 != 2) ? "test" : "test2";''',
			    #[]
			],
			#[  "VariableDeclarationStatement: ",
			    '''
				Integer x = 1 + 2;
				Integer y = x + 2;''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: ",
			    '''Integer y = "String";''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: ",
			    '''
				Integer x = 1;
				Integer x = 1;''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			],
			#[  "VariableDeclarationStatement: ",
			    '''
				{
					String z = "1";
				}
				String z = "2";''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: ",
			    '''
				String z = "2";
				{
					String z = "1";
				}''',
			    #[ReducedAlfSystem.PRIMITIVESUBTYPING]
			]
		)
	}	
}