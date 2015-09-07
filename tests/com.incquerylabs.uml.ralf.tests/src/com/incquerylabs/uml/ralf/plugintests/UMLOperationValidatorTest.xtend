package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator

class UMLOperationValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Pong Operation Call: Local variable Parameter",
			    '''
				Pong x = new Pong();
				this.doPongVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Pong Operation Call: New Instance Parameter",
			    '''this.doPongVoid(new Pong());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Pong Operation Call: New Instance Parameter, Without 'this'",
			    '''doPongVoid(new Pong());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Pong Operation Call: this Parameter",
			    '''
				Pong x = new Pong();
				x.doPongVoid(this);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Pong Operation Call: operation Parameter",
			    '''
				Pong x = new Pong();
				this.doPongVoid(x.returnPong());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Pong Operation Call: Operation Parameter, without this",
			    '''doPongVoid(returnPong());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: Variable Parameter",
			    '''
				ping_s s = new ping_s();
				this.doPingSignalVoid(s);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: New Instance Parameter",
			    '''this.doPingSignalVoid(new ping_s());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: New Instance Parameter, without this",
			    '''doPingSignalVoid(new ping_s());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: Operation Parameter",
			    '''this.doPingSignalVoid(this.returnPingSignal());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: Operation Parameter, without this",
			    '''doPingSignalVoid(returnPingSignal());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Call Multiple Parameters: literals",
			    '''this.doMultipleReturnString(1, this);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Call Multiple Parameters: assignment",
			    '''
				String x = "1";
				x = this.doMultipleReturnString(1, this);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Call Optional Parameters",
			    '''this.doDefaultValue(1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Call Optional Parameters: no this",
			    '''doDefaultValue(1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Operation Call Optional Parameters: default value",
			    '''this.doDefaultValue();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Static Operation Call",
			    '''this.staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfLanguageValidator.CODE_INVALID_FEATURE]
			],
			#[  "Operation Call Optional Parameters: default value no this",
			    '''doDefaultValue();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			]
		)
	}
}