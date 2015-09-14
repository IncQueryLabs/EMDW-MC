package com.incquerylabs.emdw.cpp.bodyconverter.test.multiple

import org.junit.runners.Parameterized.Parameters
import java.util.Collection
import org.junit.Ignore
import org.junit.Test

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
	
	@Test
	@Ignore("This is just for testing PhoneX model on individual PCs and not on the server")
	override test_multipleConversion() {
		super.test_multipleConversion
	}
}