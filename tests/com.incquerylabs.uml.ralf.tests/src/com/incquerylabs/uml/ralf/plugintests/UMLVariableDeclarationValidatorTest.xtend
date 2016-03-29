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
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator

class UMLVariableDeclarationValidatorTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Local Variable: OK",
			    '''Pong x = new Pong();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Local Variable: Null",
			    '''Pong x = null;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Local Variable: Abstract",
			    '''AbstractPong x = new AbstractPong();''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfLanguageValidator.CODE_ABTRACT_INSTANTIATION]
			]
		)
	}
}