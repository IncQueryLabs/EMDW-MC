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
				::model::Comp::Pong* __ralf__0__Pong = ::xumlrt::select_any(this->R1_pong);
				::model::Comp::Pong::ping_s_event* __ralf__1__ping_s = new ::model::Comp::Pong::ping_s_event();

				__ralf__0__Pong->generate_external_event(__ralf__1__ping_s);'''
			],
			#[  "Re-send sigdata from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send sigdata to this->pong.one();
				''',
				'''
				::model::Comp::Pong* __ralf__0__Pong = ::xumlrt::select_any(this->R1_pong);
				::model::Comp::Ping::pong_s_event* __ralf__1__pong_s = casted_const_event->clone();
				__ralf__0__Pong->generate_external_event(__ralf__1__pong_s);''' // FIXME: Is __ralf__1__pong_s' type a pointer?
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
				::PhoneX::PhoneX::Implementation::Called* __ralf__0__cd = ::xumlrt::select_any(this->R3_called);
				this->R3_called = nullptr;
				__ralf__0__cd->R3_call = nullptr;'''
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
				::PhoneX::PhoneX::Implementation::Called* __ralf__0__cd = ::xumlrt::select_any(this->R3_called);
				this->R3_called = __ralf__0__cd;
				__ralf__0__cd->R3_call = this;'''
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
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xumlrt::select_any(this->R6_service);
				delete __ralf__0__service;'''
			],
			#[  "Pointer equality expression test",
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
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xumlrt::select_any(this->R6_service);
				long __ralf__1__x = 1;
				bool __ralf__2__bool = __ralf__0__service == nullptr;
				if (__ralf__2__bool) {
				
				}
				;
				bool __ralf__3__bool = __ralf__1__x == 0;
				if (__ralf__3__bool) {
				
				}'''
			]
		)
	}
}

