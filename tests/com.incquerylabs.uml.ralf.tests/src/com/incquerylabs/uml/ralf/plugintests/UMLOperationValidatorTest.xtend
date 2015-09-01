package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLOperationValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Integer Operation Call: Literal Parameter",
			    '''this.doIntegerVoid(1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Variable Parameter",
			    '''
				Integer x = 2;
				this.doIntegerVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Variable Parameter",
			    '''
				Integer x = 2;
				this.doIntegerVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Variable Parameter_Alternate syntax",
			    '''
				Integer x = 2;
				this.doIntegerVoid(parameter => x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Additive Parameter",
			    '''
				this.doIntegerVoid(1+1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Multiplicative Parameter",
			    '''
				this.doIntegerVoid(1*1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Multiplicative Parameter",
			    '''
				this.doIntegerVoid(1*1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Shift Parameter",
			    '''
				this.doIntegerVoid(1 >> 1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Numeric Unary Parameter",
			    '''
				this.doIntegerVoid(-1);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Integer Operation Call: Operation call Parameter",
			    '''
				this.doIntegerVoid(this.returnInteger());''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "String Operation Call: Literal Parameter",
			    '''this.doStringVoid("1");''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "String Operation Call: Variable Parameter",
			    '''
				String x = "1";
				this.doStringVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "String Operation Call: Addition Parameter",
			    '''
				String x = "1";
				this.doStringVoid(x + "1");''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Boolean Operation Call: Literal Parameter",
			    '''this.doBooleanVoid(true);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Boolean Operation Call: Boolean Unary Parameter",
			    '''this.doBooleanVoid(!true);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Boolean Operation Call: Boolean Property Parameter",
			    '''this.doBooleanVoid(this.booleanProperty);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Boolean Operation Call: Relational Parameter",
			    '''this.doBooleanVoid(1 < 2);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Boolean Operation Call: Logical Parameter",
			    '''this.doBooleanVoid(true || false);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Real Operation Call: variable Parameter",
			    '''
				Real x = 1.1;
				this.doRealVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Real Operation Call: Integer variable Parameter",
			    '''
				Integer x = 1;
				this.doRealVoid(x);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
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
			#[  "Return Ping Signal Operation Call: Assignment",
			    '''
				ping_s x = new ping_s();
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
				ping_s x = new ping_s();
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
			#[  "Return Pong Operation Call: Operation call",
			    '''returnPong().doIntegerVoid(1);''',
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
			#[  "Operation Call Optional Parameters: default value no this",
			    '''doDefaultValue();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call",
			    '''Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: assignment",
			    '''
				Integer a;
				a = Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: variable",
			    '''
				Integer a;
				Pong::TestOperation(1, a);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			]

		)
	}
}