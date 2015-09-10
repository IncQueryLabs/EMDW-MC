package com.incquerylabs.emdw.cpp.bodyconverter.test.multiple

import org.junit.runners.Parameterized.Parameters
import java.util.Collection

class PhoneXMultipleConversionTest extends AbstractMultipleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Multiple Conversion Test: Test all bodies in PhoneX model",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				newArrayList(ConversionType.Operation,
					ConversionType.StateEntry,
					ConversionType.StateExit,
					ConversionType.Transition,
					ConversionType.TransitionGuard
				)
			]
		)
	}
}