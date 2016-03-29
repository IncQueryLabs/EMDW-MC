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
package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class FilterExpressionValidator extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "FilterExpression: Integer",
			    '''Sequence<Integer>{1,2,3}.filter(s : s < 1);''',
			    #[]
			],
			#[  "FilterExpression: Real",
			    '''Sequence<Real>{1.1,2.2,3.3}.filter(s : s < 1.0);''',
			    #[]
			],
			#[  "FilterExpression: String",
			    '''Sequence<String>{"1","2","3"}.filter(s : s == "2");''',
			    #[]
			],
			#[  "FilterExpression: Boolean",
			    '''Sequence<Boolean>{true,false,true}.filter(s : s == true);''',
			    #[]
			],
			#[  "FilterExpression: Filter",
			    '''Sequence<Boolean>{true,false,true}.filter(s : s == true).filter(s : s == true);''',
			    #[]
			],
			#[  "InvalidFilterExpression: Invalid expression type",
			    '''Sequence<Integer>{1,2,3}.filter(s : s + 1);''',
			    #[ReducedAlfSystem.FILTEREXPRESSION]
			]
		)
	}	
}