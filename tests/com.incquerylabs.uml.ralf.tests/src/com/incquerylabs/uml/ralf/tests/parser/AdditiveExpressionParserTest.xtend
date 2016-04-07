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
package com.incquerylabs.uml.ralf.tests.parser

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractParserTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AdditiveExpressionParserTest extends AbstractParserTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Addition expression: Integer-Integer",
			    '''1 + 2''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: Real-Real",
			    '''1.3 + 2.3''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: String-String",
			    '''"2" + "2"''',
			    "AdditiveExpression",
			    false
			],
			#[  "Addition expression: Parse error",
			    '''1 + -''',
			    "AdditiveExpression",
			    true
			]
		)
	}
}