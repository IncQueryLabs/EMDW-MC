package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class StateExitConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Send new signal from state exit action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s1",
				ConversionType.StateExit,
				'''
				send new Pong::ping_s() to this->pong.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(this->R1_pong)->generate_external_event(__ping_s_ralf_0);'''
			],
			#[  "Re-send sigdata from state exit action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s1",
				ConversionType.StateExit,
				'''
				send sigdata to this->pong.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* __pong_s_ralf_0 = casted_const_event->clone();
				::xumlrt::select_any(this->R1_pong)->generate_external_event(__pong_s_ralf_0);'''
			],
			#[  "Create and initialize new signal",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/ClientServer/clientserver.uml",
				"ClientServer::Component::Client::Behavior::MainRegion::Ready",
				ConversionType.StateExit,
				'''
				ClientServer::Component::Server::RequestAddition request = new ClientServer::Component::Server::RequestAddition(id=>sigdata.id+1, a=>3, b=>9);
				''',
				'''
				::ClientServer::Component::Server::RequestAddition_event* request = new ::ClientServer::Component::Server::RequestAddition_event();
				request->id = (casted_const_event->id + 1);
				request->a = 3;
				request->b = 9;'''
			]
		)
	}
}

