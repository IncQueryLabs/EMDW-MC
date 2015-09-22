package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class StateExitConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Single Conversion Test: Send new signal from state exit action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s1",
				ConversionType.StateExit,
				'''
				send new Pong::ping_s() to this->pong.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__0__ping_s = new ::model::Comp::Pong::ping_s_event(false);

				::xtuml::select_any(this->R1_pong)->generate_event(__ralf__0__ping_s);'''
			]
		)
	}
}

