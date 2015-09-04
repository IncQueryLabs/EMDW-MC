package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("Return types are unstable")
class UMLOpaqueOperationParameterValidatorTestIgnored extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Operation Parameter access: Real Assignment",
			    '''
				Real x = 1.1;
				x = inParameter;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Parameter: Addition",
			    '''return 1+2;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Return Parameter: Multiplication",
			    '''return 1*2;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Return Parameter: Shift",
			    '''return 1 >> 2;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Return Parameter: Operation",
			    '''
				Integer x = this.returnInteger();
				return x;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Return Parameter: Integer Literal",
			    '''return 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Return Parameter: Real Literal",
			    '''return 1.1;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Invalid Return Parameter: String Literal",
			    '''return "1";''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Invalid Return Parameter: String variable",
			    '''
				Pong x = this.returnPong();
				return x;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			]		
		)
	}	
}