package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class TransitionConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Single Conversion Test: Send new signal from transition effect",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::Pong_SM::Region1::e2",
				ConversionType.Transition,
				'''
				send new Ping::pong_s() to this->ping.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* __ralf__0__pong_s = new ::model::Comp::Ping::pong_s_event(false);

				::xtuml::select_any(this->R1_ping)->generate_event(__ralf__0__pong_s);'''
			]
		)
	}
}

