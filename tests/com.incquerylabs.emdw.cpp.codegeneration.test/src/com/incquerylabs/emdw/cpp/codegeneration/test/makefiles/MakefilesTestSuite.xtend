package com.incquerylabs.emdw.cpp.codegeneration.test.makefiles

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	MakefileTestSuite,
	RulesMkTestSuite
])
@RunWith(Suite)
class MakefilesTestSuite {}