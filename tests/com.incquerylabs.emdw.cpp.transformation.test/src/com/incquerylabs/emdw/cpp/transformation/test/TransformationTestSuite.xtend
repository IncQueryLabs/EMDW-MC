/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior.DynamicBehaviorTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.generator.GeneratorTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.mappings.CPPXformMappingTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.monitor.MonitorTestSuite

@SuiteClasses(#[
	DynamicBehaviorTestSuite,
	GeneratorTestSuite,
	CPPXformMappingTestSuite,
	MonitorTestSuite
])
@RunWith(Suite)
class TransformationTestSuite {}