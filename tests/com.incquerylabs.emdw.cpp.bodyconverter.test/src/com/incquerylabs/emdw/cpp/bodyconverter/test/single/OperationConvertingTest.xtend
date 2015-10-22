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
				send new ping_s() to this->ping.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__0__ping_s = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(this->R1_ping)->generate_external_event(__ralf__0__ping_s);'''
			],
			#[  "Create new signal in class operation",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				ping_s sig = new ping_s();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__0__sig = new ::model::Comp::Pong::ping_s_event();
				'''
			],
			#[  "Create signals' collection in class operation",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<ping_s> sigs = Set<ping_s>{new ping_s()};
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ralf__1__ping_s = new ::model::Comp::Pong::ping_s_event();
				
				::std::set< ::model::Comp::Pong::ping_s_event* > __ralf__2____std__set = { __ralf__1__ping_s };
				::std::set< ::model::Comp::Pong::ping_s_event* > __ralf__0__sigs = __ralf__2____std__set;'''
			],
			#[  "If expression (equation) test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Integer i = 42;
				Integer j = 42;
				if(i==42) {
					Integer k = 42;
				}
				''',
				'''
				long __ralf__0__i = 42;
				long __ralf__1__j = 42;
				if ((__ralf__0__i == 42)) {
				long __ralf__2__0__k = 42;
				}'''
			],
			#[  "If expression (boolean value) test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> i;
				if(true) {
					Set<Integer> j = i;
				}
				''',
				'''
				::std::set< long > __ralf__0__i;
				if (true) {
				::std::set< long > __ralf__1__0__j = __ralf__0__i;
				}'''
			],
			#[  "Cast expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Ping ping = (Ping)this;
				''',
				'''
				::model::Comp::Ping* __ralf__0__ping = dynamic_cast<::model::Comp::Ping*>(this);'''	// FIXME: Should not the validation throw an exception that a Pong cannot be casted to Ping?
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
			#[  "Operation's parameter test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::doIntegerVoid", 
				ConversionType.Operation,
				'''
				Integer value = parameter;
				''',
				'''
				long __ralf__0__value = parameter;'''
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
				long __ralf__0__out = 0l;
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
			#[  "Static operation call (println) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				std::out::println("Hello world!");
				''',
				'''
				::std::cout << "Hello world!" << ::std::endl;'''
			],
			#[  "Static operation call (toString for boolean) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				std::boolean::toString(true);
				''',
				'''
				::xumlrt::to_string(true);'''
			],
			#[  "Static operation call (toString for integer) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				std::int::toString(42);
				''',
				'''
				::xumlrt::to_string(42);'''
			],
			#[  "Static operation call (toString for real) expression test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				std::real::toString(3.14);
				''',
				'''
				::xumlrt::to_string(3.14);'''
			],
			#[  "Static operation call send new signal test (EATF)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml",
				"eatf::ComponentsLibrary::EATF::eatfImplPkg::ByeDelayTimer::create", 
				ConversionType.Operation,
				'''
				send new CallLeg::remove() to CallLeg::instances().one();
				''',
				'''
				::eatf::ComponentsLibrary::EATF::eatfImplPkg::CallLeg::remove_event* __ralf__0__remove = new ::eatf::ComponentsLibrary::EATF::eatfImplPkg::CallLeg::remove_event();

				::xumlrt::select_any(::eatf::ComponentsLibrary::EATF::eatfImplPkg::CallLeg::_instances)->generate_external_event(__ralf__0__remove);'''
			],
			#[  "Collection attribute access with collection operation call test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this.integerMultiProperty.add(1);
				''',
				'''
				::xumlrt::collections::set::basic_set::add(this->integerMultiProperty, 1);'''
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
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this->ping;
				''',
				'''
				::xumlrt::select_many(this->R1_ping);'''
			],
			#[  "Association access test (EATF)",
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
			#[  "Foreach test (EATF)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml",
				"eatf::ComponentsLibrary::EATF::eatfImplPkg::eatfImpl::cleanupAllInstances", 
				ConversionType.Operation,
				'''
					for(FallBackTimer __timer in FallBackTimer::instances()) {
					FallBackTimer timer = __timer;
					}
				''',
				'''
					for(::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__0____timer : ::xumlrt::select_many(::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer::_instances)) {
					::eatf::ComponentsLibrary::EATF::eatfImplPkg::FallBackTimer* __ralf__1__0__timer = __ralf__0____timer;
					}'''
			]
		)
	}
}

