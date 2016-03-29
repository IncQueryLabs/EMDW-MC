/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.bodyconverter.test.multiple

import org.junit.runners.Parameterized.Parameters
import java.util.Collection
import org.junit.Ignore
import org.junit.Test

class EATFMultipleConversionTest extends AbstractMultipleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Multiple Conversion Test: Test all bodies in EATF model",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml",
				newArrayList(ConversionType.Operation,
					ConversionType.StateEntry,
					ConversionType.StateExit,
					ConversionType.Transition,
					ConversionType.TransitionGuard
				)
			]
		)
	}
	
	@Test
	@Ignore("This is just for testing EATF model on individual PCs and not on the server")
	override test_multipleConversion() {
		super.test_multipleConversion
	}
}