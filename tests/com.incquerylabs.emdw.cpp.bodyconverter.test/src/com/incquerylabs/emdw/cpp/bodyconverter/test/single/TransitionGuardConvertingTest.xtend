package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class TransitionGuardConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Test class attribute condition in transition guard",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::Pong_SM::Region1::e3",
				ConversionType.TransitionGuard,
				'''
				this.'count' < 42;
				''',
				'''
				this->count < 42;'''
			]
		)
	}
}

