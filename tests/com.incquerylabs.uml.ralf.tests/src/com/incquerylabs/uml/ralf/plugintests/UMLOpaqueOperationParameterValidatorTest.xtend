package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLOpaqueOperationParameterValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Operation Parameter access: Integer Assignment",
			    '''
				Integer x = 1;
				x = inParameter;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter access: Real Assignment",
			    '''
				Real x = 1.1;
				x = inParameter;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Invalid Operation Parameter access: Assignment Invalid Type",
			    '''
				String x = "1";
				x = inParameter;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Operation Parameter access: Integer Addition",
			    '''inParameter + 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter access: Integer Multiplication",
			    '''inParameter * 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter access: Shift",
			    '''inParameter >> 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter access: Relational",
			    '''inParameter < 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter assignment: Literal",
			    '''outParameter = 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter assignment: Real Literal",
			    '''outParameter = 1.1;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Invalid Operation Parameter assignment: String Literal",
			    '''outParameter = "1";''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Operation Parameter assignment: Multiplication",
			    '''outParameter = 1 * 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter assignment: Shift",
			    '''outParameter = 1 >> 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Parameter assignment: Operation",
			    '''outParameter = this.returnInteger();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Operation Parameter assignment: Operation",
			    '''outParameter = this.returnPong();''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Return Parameter: Integer Literal",
			    '''return 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Return Parameter: Real Literal",
			    '''return 1.1;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Return Parameter: String Literal",
			    '''return "1";''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Return Parameter: Addition",
			    '''return 1+2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Parameter: Multiplication",
			    '''return 1*2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Parameter: Shift",
			    '''return 1 >> 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Parameter: Operation",
			    '''
				Integer x = this.returnInteger();
				return x;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Return Parameter: String Literal",
			    '''
				Pong x = this.returnPong();
				return x;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			]
			
		)
	}	
}