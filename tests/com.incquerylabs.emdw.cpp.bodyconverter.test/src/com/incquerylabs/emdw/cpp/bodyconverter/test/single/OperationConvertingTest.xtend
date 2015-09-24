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
				::model::Comp::Ping* __ralf__0__Ping = ::xtuml::select_any(this->R1_ping);
				::model::Comp::Pong::ping_s_event* __ralf__1__ping_s = new ::model::Comp::Pong::ping_s_event(false);

				__ralf__0__Ping->generate_event(__ralf__1__ping_s);'''
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
			#[  "Cast expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Ping ping = (Ping)this;
				''',
				'''
				::model::Comp::Ping* __ralf__0__ping = dynamic_cast<::model::Comp::Ping*>(this);'''
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
				::model::Comp::Pong* __ralf__1__Pong = ::xtuml::select_any(__ralf__0__Pong);
				__ralf__1__Pong;'''
			],
			#[  "Association access test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml",
				"eatf::ComponentsLibrary::EATF::eatfImplPkg::ByeDelayTimer::create", 
				ConversionType.Operation,
				'''
					PacketSwitchLeg packetSwitchLeg = PacketSwitchLeg::instances().one();
					PublicSafetyAccessPointLeg psapLeg = packetSwitchLeg->'manages incoming side of'->'is terminated in'.one();
				''',
				'''
					::std::list< ::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg* > __ralf__1__PacketSwitchLeg = ::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg::_instances;
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg* __ralf__2__PacketSwitchLeg = ::xtuml::select_any(__ralf__1__PacketSwitchLeg);
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg* __ralf__0__packetSwitchLeg = __ralf__2__PacketSwitchLeg;
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PublicSafetyAccessPointLeg* __ralf__4__PublicSafetyAccessPointLeg = ::xtuml::select_any(__ralf__0__packetSwitchLeg->R101_manages_incoming_side_of->R102_is_terminated_in);
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PublicSafetyAccessPointLeg* __ralf__3__psapLeg = __ralf__4__PublicSafetyAccessPointLeg;'''
			],
			#[  "Foreach test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml",
				"eatf::ComponentsLibrary::EATF::eatfImplPkg::eatfImpl::cleanupAllInstances", 
				ConversionType.Operation,
				'''
					for(FallBackTimer __timer in FallBackTimer::instances()) {
					FallBackTimer timer = __timer;
					}
				''',
				'''
					::std::list< ::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* > __ralf__0__FallBackTimer = ::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer::_instances;
					for(::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__1____timer : __ralf__0__FallBackTimer) {
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__2__0__timer = __ralf__1____timer;
					}'''
			]
		)
	}
}

