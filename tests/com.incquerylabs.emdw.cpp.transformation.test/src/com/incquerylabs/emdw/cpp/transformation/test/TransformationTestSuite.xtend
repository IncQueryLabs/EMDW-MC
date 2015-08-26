package com.incquerylabs.emdw.cpp.transformation.test

import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.transformation.test.dynamicbehavior.DynamicBehaviorTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.generator.GeneratorTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.mappings.CPPXformMappingTestSuite
import com.incquerylabs.emdw.cpp.transformation.test.monitor.MonitorTestSuite

@SuiteClasses(#[
	DynamicBehaviorTestSuite,
	GeneratorTestSuite,
	CPPXformMappingTestSuite,
	MonitorTestSuite
])
@RunWith(Suite)
class TransformationTestSuite {}