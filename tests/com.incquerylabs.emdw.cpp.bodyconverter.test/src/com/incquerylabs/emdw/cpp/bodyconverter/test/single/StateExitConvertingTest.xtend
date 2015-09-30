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
				::model::Comp::Pong* __ralf__0__Pong = ::xumlrt::select_any(this->R1_pong);
				::model::Comp::Pong::ping_s_event* __ralf__1__ping_s = new ::model::Comp::Pong::ping_s_event(false);
				
				__ralf__0__Pong->generate_event(__ralf__1__ping_s);'''
			],
			#[  "Single Conversion Test: Create and initialize new signal",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/ClientServer/clientserver.uml",
				"ClientServer::Component::Client::Behavior::MainRegion::Ready",
				ConversionType.StateExit,
				'''
				ClientServer::Component::Server::RequestAddition request = new ClientServer::Component::Server::RequestAddition(id=>sigdata.id+1, a=>3, b=>9);
				''',
				'''
				::ClientServer::Component::Server::RequestAddition_event* __ralf__0__request = new ::ClientServer::Component::Server::RequestAddition_event(false);
				long __ralf__1__long = casted_const_event->id;
				long __ralf__2__long = __ralf__1__long + 1;
				__ralf__0__request->id = __ralf__2__long;
				__ralf__0__request->a = 3;
				__ralf__0__request->b = 9;'''
			]
		)
	}
}

