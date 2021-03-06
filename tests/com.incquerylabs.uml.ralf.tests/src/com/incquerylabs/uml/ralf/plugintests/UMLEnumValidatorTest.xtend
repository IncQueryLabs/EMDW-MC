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
import java.util.Collection
import org.junit.BeforeClass
import org.junit.runners.Parameterized.Parameters

class UMLEnumValidatorTest extends AbstractPluginValidatorTest{	
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Enum literal access: OK",
			    '''
			    Enum::literal;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Enum literal init: OK",
			    '''
			    Enum temp = Enum::literal;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Enum literal Operation param: OK",
			    '''
			    Enum temp = Enum::literal;
			    this.doEnumVoid(temp);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Enum literal property assignment: OK",
			    '''
			    Enum temp = Enum::literal;
			    this.enumProperty = temp;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Enum literal property access: OK",
			    '''
			    Enum temp = Enum::literal;
			    temp = this.enumProperty;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Enum literal property access: FAIL",
			    '''
			    Enum temp = Enum::literal;
			    temp = this.integerProperty;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Enum literal property assignment: FAIL",
			    '''
			    Enum temp = Enum::literal;
			    this.integerProperty = temp;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			]
		)
	}
	
}