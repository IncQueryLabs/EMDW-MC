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
package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.incquerylabs.emdw.cpp.bodyconverter.test.single.SingleConversionTestSuite
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.bodyconverter.test.multiple.MultipleConversionTestSuite
import com.incquerylabs.emdw.cpp.bodyconverter.test.unit.ConvertAbstractOperationTest

@SuiteClasses(#[
	SingleConversionTestSuite,
	MultipleConversionTestSuite,
	ConvertAbstractOperationTest
])
@RunWith(Suite)
class BodyConverterTestSuite {}