package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.incquerylabs.emdw.cpp.bodyconverter.test.single.SingleConversionTestSuite
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses
import com.incquerylabs.emdw.cpp.bodyconverter.test.multiple.MultipleConversionTestSuite
import com.incquerylabs.emdw.cpp.bodyconverter.test.unit.ConvertAbstractOperationTest

@SuiteClasses(#[
	SingleConversionTestSuite,
	MultipleConversionTestSuite,
	ConvertAbstractOperationTest
])
@RunWith(Suite)
class BodyConverterTestSuite {}