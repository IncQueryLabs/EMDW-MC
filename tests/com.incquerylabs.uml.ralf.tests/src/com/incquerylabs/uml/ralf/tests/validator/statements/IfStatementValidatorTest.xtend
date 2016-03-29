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

class IfStatementValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "IfStatement: IntegerLiteral",
			    '''if(1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: RealLiteral",
			    '''if(1.1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: BooleanLiteral",
			    '''if(true){}''',
			    #[]
			],
			#[  "IfStatement: StringLiteral",
			    '''if("1"){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Multiplication",
			    '''if(1*1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Addition",
			    '''if(1+1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Shift",
			    '''if(1>>1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Relational",
			    '''if(1>1){}''',
			    #[]
			],
			#[  "IfStatement: Equality",
			    '''if(1==1){}''',
			    #[]
			],
			#[  "IfStatement: Bitwise or",
			    '''if(1|1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Bitwise and",
			    '''if(1&1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Bitwise xor",
			    '''if(1^1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "IfStatement: Conditional and",
			    '''if(true && false){}''',
			    #[]
			],
			#[  "IfStatement: Conditional or",
			    '''if(true || false){}''',
			    #[]
			],
			#[  "IfStatement:Boolean unary ",
			    '''if(!true){}''',
			    #[]
			],
			#[  "IfStatement: Integer variable",
			    '''
				Integer x = 1;
				if(x = 2){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			]
		)
	}
}