/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import java.util.Collection
import org.junit.BeforeClass
import org.junit.runners.Parameterized.Parameters

class UMLOperationValidatorTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
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
				ping_s s = new ping_s(1, this);
				this.doPingSignalVoid(s);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: New Instance Parameter",
			    '''this.doPingSignalVoid(new ping_s(1, this));''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Ping Signal Operation Call: New Instance Parameter, without this",
			    '''doPingSignalVoid(new ping_s(1, this));''',
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
			    #[ReducedAlfSystem.PARAMETERLISTTYPING]
			]
		)
	}
}