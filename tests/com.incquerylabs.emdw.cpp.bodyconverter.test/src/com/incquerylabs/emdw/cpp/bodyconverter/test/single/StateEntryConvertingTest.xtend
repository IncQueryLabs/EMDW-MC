package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class StateEntryConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Send new signal from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send new Pong::ping_s() to this->pong.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(this->R1_pong)->generate_external_event(__ping_s_ralf_0);'''
			],
			#[  "Re-send sigdata from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send sigdata to this->pong.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* __pong_s_ralf_0 = casted_const_event->clone();
				::xumlrt::select_any(this->R1_pong)->generate_external_event(__pong_s_ralf_0);'''
			],
			#[  "Unlink expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'called'.one();
				R3::unlink('call'=>this,'called'=>cd);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Called* cd = ::xumlrt::select_any(this->R3_called);
				this->R3_called = nullptr;
				cd->R3_call = nullptr;'''
			],
			#[  "Link expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'called'.one();
				R3::link('call'=>this,'called'=>cd);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Called* cd = ::xumlrt::select_any(this->R3_called);
				this->R3_called = cd;
				cd->R3_call = this;'''
			],
			#[  "Delete expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				delete service;
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* service = ::xumlrt::select_any(this->R6_service);
				delete service;'''
			],
			#[  "Pointer equality expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				Integer x = 1;
				if(service == null){
				};
				if(x == 0){
				}
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* service = ::xumlrt::select_any(this->R6_service);
				long x = 1;
				if ((service == nullptr)) {
				
				}
				;
				if ((x == 0)) {
				
				}'''
			]
		)
	}
}

