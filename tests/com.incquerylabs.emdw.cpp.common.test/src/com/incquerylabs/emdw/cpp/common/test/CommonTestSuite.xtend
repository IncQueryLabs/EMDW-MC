package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.cpp.common.test.descriptors.ValueDescriptorTestSuite
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	ValueDescriptorTestSuite
])
@RunWith(Suite)
class CommonTestSuite {}