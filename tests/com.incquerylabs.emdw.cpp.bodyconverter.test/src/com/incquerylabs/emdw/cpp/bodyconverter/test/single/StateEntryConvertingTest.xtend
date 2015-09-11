package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class StateEntryConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Single Conversion Test: Send new signal from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send new Pong::ping_s() to this->pong;
				''',
				'''
				::model::Comp::Pong* __ralf__0__Pong = this->R1_pong;
				::model::Comp::Pong::ping_s_event* __ralf__1__ping_s = new ::model::Comp::Pong::ping_s_event(false);
				__ralf__0__Pong->generate_event(__ralf__1__ping_s);
				'''
			],
			#[  "Unlink expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service';
				R6::unlink('service'=>service,'call'=>this);
				''',
				'''
				PhoneX::PhoneX::Implementation::Service* __ralf__0__service = this->R6_service;
				this->R6_service = null;
				__ralf__0__service->R6_call = null;
				'''
			],
			#[  "Link expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service';
				R6::link('service'=>service,'call'=>this);
				''',
				'''
				PhoneX::PhoneX::Implementation::Service* __ralf__0__service = this->R6_service;
				this->R6_service = __ralf__0__service;
				__ralf__0__service->R6_call = this;
				'''
			],
			#[  "Delete expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service';
				delete service;
				''',
				'''
				PhoneX::PhoneX::Implementation::Service* __ralf__0__service = this->R6_service;
				delete __ralf__0__service;
				'''
			]
		)
	}
}

