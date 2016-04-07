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

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class BlockStatementValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "BlockStatement: Empty",
			    '''{}''',
			    #[]
			],
			#[  "BlockStatement: Block",
			    '''{{}}''',
			    #[]
			],
			#[  "BlockStatement: Addition",
			    '''
				{
					1+2.5;
				}''',
			    #[]
			],
			#[  "BlockStatement: Variable declaration",
			    '''
				{
					Integer x = 1+2;
				}''',
			    #[]
			],
			#[  "BlockStatement: If statement",
			    '''
				{
					if(true){}
				}''',
			    #[]
			],
			#[  "BlockStatement: While loop",
			    '''
				{
					while(true){}
				}''',
			    #[]
			],
			#[  "BlockStatement: Do..While loop",
			    '''
				{
					do{}while(true);
				}''',
			    #[]
			],
			#[  "BlockStatement: For loop",
			    '''
				{
					for(Integer i; i < 5; i++){}
				}''',
			    #[]
			]
		)
	}
}