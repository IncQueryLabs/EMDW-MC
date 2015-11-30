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
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(this->R1_ping)->generate_external_event(__ping_s_ralf_0);'''
			],
			#[  "Create new signal in class operation",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				ping_s sig = new ping_s();
				''',
				'''
				::model::Comp::Pong::ping_s_event* sig = new ::model::Comp::Pong::ping_s_event();
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
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::std::set< ::model::Comp::Pong::ping_s_event* > sigs = { __ping_s_ralf_0 };'''
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
				long i = 42;
				long j = 42;
				if ((i == 42)) {
				long k = 42;
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
				::std::set< long > i;
				if (true) {
				::std::set< long > j = i;
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
				::model::Comp::Ping* ping = dynamic_cast<::model::Comp::Ping*>(this);'''	// FIXME: Should not the validation throw an exception that a Pong cannot be casted to Ping?
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
				long value = parameter;'''
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
				long out = 0l;
				this->TestOperation(42, (&out));'''
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
			#[  "Static operation call send new signal test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				send new ping_s() to Ping::instances().one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(::model::Comp::Ping::_instances)->generate_external_event(__ping_s_ralf_0);'''
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
				::model::Comp::Pong* p = nullptr;
				p = ::xumlrt::select_any(::model::Comp::Pong::_instances);'''
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
			#[  "Association access test 1",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				this->ping;
				''',
				'''
				::xumlrt::select_many(this->R1_ping);'''
			],
			#[  "Association access test 2",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CleanUp", 
				ConversionType.Operation,
				'''
				Call call = Call::instances().one();
				Call second_call = call->'is being run / handled by'->'handles / runs'->'is being run / handled by'->'handles / runs'.one();
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call* call = ::xumlrt::select_any(::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::_instances);
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call* second_call = ::xumlrt::select_any(::xumlrt::indirect_chain< ::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Service* >(call->R6_is_being_run___handled_by->R6_handles___runs, &::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::R6_is_being_run___handled_by)->R6_handles___runs);'''
			],
			#[  "Foreach test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				for(Ping __ping in Ping::instances()) {
					Ping ping = __ping;
				}
				''',
				'''
				for(::model::Comp::Ping* __ping : ::xumlrt::select_many(::model::Comp::Ping::_instances)) {
				::model::Comp::Ping* ping = __ping;
				}'''
			],
			#[ "Enum as out parameter test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::testEnumOutParameter",
				ConversionType.Operation,
				'''
				testEnum = PingPongEnum::Pong;
				''',
				'''
				(*testEnum) = ::model::Comp::PingPongEnum::Pong;'''
			]
		)
	}
}

