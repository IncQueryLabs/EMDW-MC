package com.incquerylabs.emdw.cpp.performance.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	SimpleRunTest,
	RunWithModificationTest
])
@RunWith(Suite)
class PerformanceTestSuite {}