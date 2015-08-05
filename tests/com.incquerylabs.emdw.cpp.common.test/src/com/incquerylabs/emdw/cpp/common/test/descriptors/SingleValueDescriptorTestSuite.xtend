package com.incquerylabs.emdw.cpp.common.test.descriptors

import org.junit.runners.Suite
import org.junit.runner.RunWith
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	SingleValueDescriptorForLiteralTestSuite,
	SingleValueDescriptorForNewVariableTestSuite,
	SingleValueDescriptorForExistingVariableTestSuite
])
@RunWith(Suite)
class SingleValueDescriptorTestSuite {}