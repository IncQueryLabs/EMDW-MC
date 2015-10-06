package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class CollectionDescriptorTest extends AbstractSingleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[
				"Set creation with default literal values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Set<Integer> p = Set<Integer>{1, 2, 3};
				''',
				'''
				::std::set< long > __ralf__1____std__set = { 1, 2, 3 };
				::std::set< long > __ralf__0__p = __ralf__1____std__set;'''
			],
			#[
				"Set creation with default variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Set<Integer> p = Set<Integer>{i};
				''',
				'''
				long __ralf__0__i = 0;
				::std::set< long > __ralf__2____std__set = { __ralf__0__i };
				::std::set< long > __ralf__1__p = __ralf__2____std__set;'''
			],
			#[
				"Set creation with default literal and variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Set<Integer> p = Set<Integer>{i, 1, 2, 3};
				''',
				'''
				long __ralf__0__i = 0;
				::std::set< long > __ralf__2____std__set = { 1, 2, 3, __ralf__0__i };
				::std::set< long > __ralf__1__p = __ralf__2____std__set;'''
			],
			#[  "Unlink expression collection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				R6::unlink('service'=>service,'call'=>this);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xumlrt::select_any(this->R6_service);
				__ralf__0__service->R6_call.remove(this);
				this->R6_service = nullptr;'''
			],
			#[  "Link expression collection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				R6::link('call'=>this,'service'=>service);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xumlrt::select_any(this->R6_service);
				this->R6_service = __ralf__0__service;
				__ralf__0__service->R6_call.push_back(this);
				true;'''
			]
		)
	}
}