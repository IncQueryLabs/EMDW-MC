package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class OperationConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Single Conversion Test: Send new signal from class operation",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				send new ping_s() to this->ping.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__0__ping_s = new ::model::Comp::Pong::ping_s_event(false);

				::xtuml::select_any(this->R1_ping)->generate_event(__ralf__0__ping_s);'''
			],
			#[  "Instances expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Pong::instances();
				''',
				'''
				::model::Comp::Pong::_instances;'''
			],
			#[  "Instances selection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Pong::instances().one();
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__Pong = ::model::Comp::Pong::_instances;
				::xtuml::select_any(__ralf__0__Pong);'''
			]
		)
	}
}

