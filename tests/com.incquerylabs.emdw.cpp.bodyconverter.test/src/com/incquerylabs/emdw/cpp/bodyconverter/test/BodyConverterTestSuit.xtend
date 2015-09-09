package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.incquerylabs.emdw.cpp.bodyconverter.test.single.SingleConversionTestSuite
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.bodyconverter.test.multiple.MultipleConversionTestSuite

@SuiteClasses(#[
	SingleConversionTestSuite,
	MultipleConversionTestSuite
])
@RunWith(Suite)
class BodyConverterTestSuit {}