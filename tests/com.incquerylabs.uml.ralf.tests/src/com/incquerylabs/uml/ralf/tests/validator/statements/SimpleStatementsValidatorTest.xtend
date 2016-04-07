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

class SimpleStatementsValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "EmptyStatement",
			    ''';''',
			    #[]
			],
			#[  "EmptyStatement: Comment",
			    '''/*Integer x = false*/;''',
			    #[]
			],
			#[  "ExpressionStatement: IntegerLiteral",
			    '''1;''',
			    #[]
			],
			#[  "ExpressionStatement: RealLiteral",
			    '''1.1;''',
			    #[]
			],
			#[  "ExpressionStatement: BooleanLiteral",
			    '''false;''',
			    #[]
			],
			#[  "ExpressionStatement: StringLiteral",
			    '''"1";''',
			    #[]
			],
			#[  "ExpressionStatement: Multiplication",
			    '''1*1;''',
			    #[]
			],
			#[  "ExpressionStatement: Addition",
			    '''1+1;''',
			    #[]
			],
			#[  "ExpressionStatement: Shift",
			    '''1>>1;''',
			    #[]
			],
			#[  "ExpressionStatement: Relation",
			    '''1>1;''',
			    #[]
			],
			#[  "ExpressionStatement: Equality",
			    '''1==1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseOR",
			    '''1|1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseAND",
			    '''1&1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseXOR",
			    '''1^1;''',
			    #[]
			],
			#[  "ExpressionStatement: ConditionalAND",
			    '''true && false;''',
			    #[]
			],
			#[  "ExpressionStatement: ConditionalOR",
			    '''true || false;''',
			    #[]
			],
			#[  "ExpressionStatement: BooleanUnary",
			    '''!true;''',
			    #[]
			],
			#[  "ExpressionStatement: Assignment",
			    '''
				Integer x = 1;
				x = 2;''',
			    #[]
			],
			#[  "BreakStatement: BreakSwitch",
			    '''
				Integer x =1;
				switch(x){
					case 1: break;
				}''',
			    #[]
			],
			#[  "BreakStatement: BreakSwitch2",
			    '''
				Integer x =1;
				switch(x){
					case 1: {break;}
				}''',
			    #[]
			],
			#[  "BreakStatement: While",
			    '''
				while(true){
					break;
				}''',
			    #[]
			],
			#[  "BreakStatement: Do...While",
			    '''
				do{
					break;
				}while(true);''',
			    #[]
			],
			#[  "BreakStatement: For",
			    '''
				for(Integer i in { 9 }){
					break;
				}''',
			    #[]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_Statements",
			    '''break;''',
			    #["null"]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_Block",
			    '''{break;}''',
			    #["null"]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_If",
			    '''
				if(true){
					break;
				}''',
			    #["null"]
			]
		)
	}
}