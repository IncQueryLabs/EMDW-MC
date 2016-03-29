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
import org.eclipse.xtext.diagnostics.Diagnostic

class UMLOperationStaticValidatorTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
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
				Pong::StaticTestOperation(1, a);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: Qualified name",
			    '''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: Class local name",
			    '''Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: without class",
			    '''staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: misspelled",
			    '''staticIntegerOperatio();''',
				"model::Comp::Pong::TestOperation",
			    #[
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	Diagnostic.LINKING_DIAGNOSTIC
			    ]
			],
			#[  "This in a static operation",
			    '''this;''',
				"model::Comp::Pong::staticIntegerOperation",
			    #[
			        ReducedAlfLanguageValidator.CODE_THIS_IN_STATIC
			    ]
			],
			#[  "Class Extent: instances() filter",
			    '''
			    Pong::instances().filter( p : p.integerProperty == 1 );''',
				"model::Comp::Pong::TestOperation",
			    #[ ]
			]
		)
	}
}