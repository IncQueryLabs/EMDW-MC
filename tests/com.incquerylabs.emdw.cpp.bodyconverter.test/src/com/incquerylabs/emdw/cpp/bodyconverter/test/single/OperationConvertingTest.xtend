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
				::model::Comp::Ping* __ralf__0__Ping = ::xumlrt::select_any(this->R1_ping);
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
				::xumlrt::select_many(::model::Comp::Pong::_instances);'''
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
				::xumlrt::select_any(::model::Comp::Pong::_instances);'''
			],
			#[  "Add element to collection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Boolean b = Pong::instances().add(this);
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__1____std__set = ::xumlrt::select_many(::model::Comp::Pong::_instances);
				::std::pair< ::std::set< ::model::Comp::Pong*>::iterator, bool> result = __ralf__1____std__set.insert(this);
				bool __ralf__2__bool = result.second;
				bool __ralf__0__b = __ralf__2__bool;'''
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
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg* __ralf__0__packetSwitchLeg = ::xumlrt::select_any(::eatf::ComponentsLibrary::EATF::eatfImplPkg::PacketSwitchLeg::_instances);
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::PublicSafetyAccessPointLeg* __ralf__1__psapLeg = ::xumlrt::select_any(__ralf__0__packetSwitchLeg->R101_manages_incoming_side_of->R102_is_terminated_in);'''
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
					::std::set< ::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* > __ralf__0____std__set = ::xumlrt::select_many(::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer::_instances);
					for(::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__1____timer : __ralf__0____std__set) {
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__2__0__timer = __ralf__1____timer;
					}'''
			]
		)
	}
}

