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
				send new Pong::ping_s() to this->pong.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__0__ping_s = new ::model::Comp::Pong::ping_s_event(false);

				::xtuml::select_any(this->R1_pong)->generate_event(__ralf__0__ping_s);'''
			],
			#[  "Unlink expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'called'.one();
				R3::unlink('call'=>this,'called'=>cd);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Called* __ralf__0__cd = ::xtuml::select_any(this->R3_called);
				this->R3_called = NULL;
				__ralf__0__cd->R3_call = NULL;'''
			],
			#[  "Link expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'called'.one();
				R3::link('call'=>this,'called'=>cd);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Called* __ralf__0__cd = ::xtuml::select_any(this->R3_called);
				this->R3_called = __ralf__0__cd;
				__ralf__0__cd->R3_call = this;'''
			],
			#[  "Delete expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				delete service;
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xtuml::select_any(this->R6_service);
				delete __ralf__0__service;'''
			]
		)
	}
}

