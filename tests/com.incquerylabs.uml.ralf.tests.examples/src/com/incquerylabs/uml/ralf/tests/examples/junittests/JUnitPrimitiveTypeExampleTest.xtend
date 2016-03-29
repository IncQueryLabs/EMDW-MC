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
package com.incquerylabs.uml.ralf.tests.examples.junittests

import com.incquerylabs.uml.ralf.tests.example.util.AbstractUnitTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

abstract class JUnitPrimitiveTypeExampleTest extends AbstractUnitTest{
    
    /* This test does not work when executed as a JUnit plug-in test */
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Simple JUnit Test with Primitive Types",
			    '''
				Integer x = (1 + 2) * 3 + -4;
				++x;
				Integer y = x;
				y = x - 15;
				if ((x > 3) && !(y < -5)) {
					x--;
				}''',
				'''
				PrimitiveTypes::Integer x = (1 + 2) * 3 + -4;
				++x;
				PrimitiveTypes::Integer y = x;
				y = x - 15;
				if ((x > 3) && !(y < -5)) {
				x--;
				}'''
			]
		)
	}
}

