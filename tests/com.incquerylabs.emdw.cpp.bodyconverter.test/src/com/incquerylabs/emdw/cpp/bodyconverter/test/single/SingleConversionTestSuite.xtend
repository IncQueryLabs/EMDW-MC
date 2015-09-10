package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	OperationConvertingTest,
	StateEntryConvertingTest,
	StateExitConvertingTest,
	TransitionConvertingTest,
	TransitionGuardConvertingTest
])
@RunWith(Suite)
class SingleConversionTestSuite {}