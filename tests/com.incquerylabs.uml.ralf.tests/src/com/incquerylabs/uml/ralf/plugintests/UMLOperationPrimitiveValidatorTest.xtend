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

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.BeforeClass
import org.junit.runners.Parameterized.Parameters

class UMLOperationPrimitiveValidatorTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
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
			]
		)
	}
}