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
package com.incquerylabs.uml.ralf.tests.validator.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class VariableDeclarationValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "VariableDeclarationStatement: RealVariable_NORHS",
			    '''Real x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: IntegerVariable_NORHS",
			    '''Integer x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: StringVariable_NORHS",
			    '''String x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: BooleanVariable_NORHS",
			    '''Boolean x;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: IntegerLiteral",
			    '''Integer x = 1;''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: String_cannot_be_null",
			    '''String x = null;''',
			    #[ReducedAlfSystem.GENERALREFERENCESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Integer_cannot_be_null",
			    '''Integer x = null;''',
			    #[ReducedAlfSystem.GENERALREFERENCESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Real_cannot_be_null",
			    '''Real x = null;''',
			    #[ReducedAlfSystem.GENERALREFERENCESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Boolean_cannot_be_null",
			    '''Boolean x = null;''',
			    #[ReducedAlfSystem.GENERALREFERENCESUBTYPING]
			],
			#[  "VariableDeclarationStatement: RHS: Addition",
			    '''Integer x = 1+2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: Multiplication",
			    '''Integer x = 1*2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: NumericUnary",
			    '''Integer x = -1;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: Shift",
			    '''Integer x = 1>>2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: Relational",
			    '''Boolean x = 1 < 2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: Equality",
			    '''Boolean x = 1 == 2;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: BooleanUnary",
			    '''Boolean x = !(1 < 2);''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: BitwiseXor",
			    '''Boolean x = 1 < 2 ^ false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: BitwiseOr",
			    '''Boolean x = 1 < 2 | false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: BitwiseAnd",
			    '''Boolean x = 1 < 2 & false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: ConditionalAnd",
			    '''Boolean x = 1 < 2 && false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: ConditionalOR",
			    '''Boolean x = 1 < 2 || false;''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: ConditionalTest",
			    '''String x = (1 != 2) ? "test" : "test2";''',
			    #[]
			],
			#[  "VariableDeclarationStatement: RHS: Variable",
			    '''
				Integer x = 1 + 2;
				Integer y = x + 2;''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: InvalidType",
			    '''Integer y = "String";''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidVariableDeclarationStatement: Duplicate Variable",
			    '''
				Integer x = 1;
				Integer x = 1;''',
			    #["null"]
			],
			#[  "VariableDeclarationStatement: Redefine after block",
			    '''
				{
					String z = "1";
				}
				String z = "2";''',
			    #[]
			],
			#[  "InvalidVariableDeclarationStatement: Redefine In block",
			    '''
				String z = "2";
				{
					String z = "1";
				}''',
			    #["null"]
			]
		)
	}	
}