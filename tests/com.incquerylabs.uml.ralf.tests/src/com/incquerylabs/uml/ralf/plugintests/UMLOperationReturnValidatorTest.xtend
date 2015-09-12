package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLOperationReturnValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Return Ping Signal Operation Call: Assignment",
			    '''
				ping_s x = new ping_s(2, this);
				x = this.returnPingSignal();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Pong Operation Call: Assignment",
			    '''
				Pong x = new Pong();
				x = this.returnPong();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Pong Operation Call: Operation call",
			    '''this.returnPong().doIntegerVoid(1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Assignment",
			    '''
				Integer x = 1;
				x = this.returnInteger();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Additive",
			    '''this.returnInteger() + 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Multiplicative",
			    '''this.returnInteger() * 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Shift",
			    '''this.returnInteger() >> 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Ping Operation Call: Assignment, no this",
			    '''
				ping_s x = new ping_s(2, this);
				x = returnPingSignal();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Pong Operation Call: Assignment, no this",
			    '''
				Pong x = new Pong();
				x = returnPong();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Assignment_no this",
			    '''
				Integer x = 1;
				x = returnInteger();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Additive no this",
			    '''returnInteger() + 1;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Multiplicative no this",
			    '''returnInteger() * 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Return Integer Operation Call: Shift no this",
			    '''returnInteger() >> 2;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			]
		)
	}
}