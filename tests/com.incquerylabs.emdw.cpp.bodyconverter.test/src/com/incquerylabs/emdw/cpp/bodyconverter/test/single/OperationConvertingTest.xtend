package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class OperationConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Send new signal from class operation",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Boolean b;
				b = true;
				send new ping_s() to this->ping.one();
				''',
				'''
				bool __ralf__0__b = false;
				__ralf__0__b = true;
				::model::Comp::Ping* __ralf__1__Ping = ::xumlrt::select_any(this->R1_ping);
				::model::Comp::Pong::ping_s_event* __ralf__2__ping_s = new ::model::Comp::Pong::ping_s_event(false);

				__ralf__1__Ping->generate_event(__ralf__2__ping_s);'''
			],
			#[  "Cast expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Ping ping = (Ping)this;
				''',
				''''''	// FIXME: Should not the validation throw an exception that a Pong cannot be casted to Ping?
			],
			#[  "Operation call expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this.returnInteger();
				''',
				'''
				this->returnInteger();'''
			],
			#[  "Operation call expression with parameter test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this.doIntegerVoid(42);
				''',
				'''
				this->doIntegerVoid(42);'''
			],
			#[  "Operation call expression with named parameter test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Integer out;
				this.TestOperation(outParameter=>out, inParameter=>42);
				''',
				'''
				long __ralf__0__out;
				this->TestOperation(42, (&__ralf__0__out));'''
			],
			#[  "Static operation call expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Pong::staticOperation();
				''',
				'''
				::model::Comp::Pong::staticOperation();'''
			],
			#[  "Static operation call (toString) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Boolean b;
				b.toString();
				''',
				'''
				::model::Comp::Pong::staticOperation();'''
			],
			#[  "Static operation call (println) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				std::out::println("Hello world!");
				''',
				'''
				::st::cout << "Hello world!" << ::std::endl;'''
			],
			#[  "Collection attribute access with collection operation call test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this.integerMultiProperty.add(1);
				''',
				'''
				::std::pair< ::std::set< long>::iterator, bool> result = this->integerMultiProperty.insert(1);
				bool __ralf__1__bool = result.second;
				__ralf__1__bool;'''
			],
			#[  "Instances expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Pong p;
				p = Pong::instances().one();
				''',
				'''
				::model::Comp::Pong* __ralf__0__p = nullptr;
				__ralf__0__p = ::xumlrt::select_any(::model::Comp::Pong::_instances);'''
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

