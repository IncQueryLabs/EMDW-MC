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