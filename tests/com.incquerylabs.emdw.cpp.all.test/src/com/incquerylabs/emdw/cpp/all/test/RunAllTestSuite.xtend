package com.incquerylabs.emdw.cpp.all.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.uml.ralf.tests.SnippetCompilerTestSuite
import com.incquerylabs.emdw.umlintegration.test.UmlIntegrationMappingTestSuite
import com.incquerylabs.emdw.cpp.codegeneration.test.CodegenerationTestSuite
import com.incquerylabs.emdw.cpp.common.test.CommonTestSuite
import com.incquerylabs.emdw.cpp.bodyconverter.test.BodyConverterTestSuite

@SuiteClasses(#[
	SnippetCompilerTestSuite,
	UmlIntegrationMappingTestSuite,
	com.incquerylabs.emdw.cpp.transformation.test.TransformationTestSuite,
	CodegenerationTestSuite,
	CommonTestSuite,
	BodyConverterTestSuite
])
@RunWith(Suite)
class RunAllTestSuite {}