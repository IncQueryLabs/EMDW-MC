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
package com.incquerylabs.emdw.cpp.codegeneration.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.codegeneration.test.complex.ComplexTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.fsa.FileSystemAccessTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.mains.MainsTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.makefiles.MakefilesTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.mappings.MappingsTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.modeltofilemappings.ModelToFileMappingsTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.persistedmodel.PersistedModelPackageTestSuite

@SuiteClasses(#[
	ComplexTestSuite,
	FileSystemAccessTestSuite,
	MainsTestSuite,
	MakefilesTestSuite,
	MappingsTestSuite,
	ModelToFileMappingsTestSuite,
	PersistedModelPackageTestSuite
])
@RunWith(Suite)
class CodegenerationTestSuite {}