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
package com.incquerylabs.emdw.cpp.all.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.uml.ralf.tests.SnippetCompilerTestSuite
import com.incquerylabs.emdw.umlintegration.test.UmlIntegrationMappingTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.CodegenerationTestSuite
import com.incquerylabs.emdw.cpp.common.test.CommonTestSuite
import com.incquerylabs.emdw.cpp.bodyconverter.test.BodyConverterTestSuite
import com.incquerylabs.uml.ralf.RalfTestsTestSuite

@SuiteClasses(#[
	RalfTestsTestSuite,
	SnippetCompilerTestSuite,
	UmlIntegrationMappingTestSuite,
	com.incquerylabs.emdw.cpp.transformation.test.TransformationTestSuite,
	CodegenerationTestSuite,
	CommonTestSuite,
	BodyConverterTestSuite
])
@RunWith(Suite)
class RunAllTestSuite {}