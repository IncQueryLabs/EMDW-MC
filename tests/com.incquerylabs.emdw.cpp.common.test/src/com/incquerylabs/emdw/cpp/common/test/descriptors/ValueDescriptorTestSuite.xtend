package com.incquerylabs.emdw.cpp.common.test.descriptors

import org.junit.runners.Suite
import org.junit.runner.RunWith
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	LiteralDescriptorTestSuite,
	SingleVariableDescriptorForNewVariableTestSuite,
	SingleVariableDescriptorForExistingVariableTestSuite,
	PropertyReadDescriptorTestSuite,
	PropertyWriteDescriptorTestSuite,
	OperationCallDescriptorTestSuite
])
@RunWith(Suite)
class ValueDescriptorTestSuite {}