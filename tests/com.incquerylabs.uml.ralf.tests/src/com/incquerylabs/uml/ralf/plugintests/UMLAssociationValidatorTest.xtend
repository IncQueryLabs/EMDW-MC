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
import org.eclipse.xtext.diagnostics.Diagnostic

class UMLAssociationValidatorTest extends AbstractPluginValidatorTest{	
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Association Access: OK",
			    '''
			    Pong p = new Pong();
			    p->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: OK_this",
			    '''
			    this->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: PropertyAccess",
			    '''
			    this.pongProperty->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: OperationCall",
			    '''
			    returnPong()->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Association Access: Null",
			    '''
			    Pong p = new Pong();
			    p->pong;''',
				"model::Comp::Pong::TestOperation",
			    #[
			        ReducedAlfSystem.ASSOCIATIONACCESSEXPRESSION,
			        Diagnostic.LINKING_DIAGNOSTIC
			    ]
			]
		)
	}
	
}