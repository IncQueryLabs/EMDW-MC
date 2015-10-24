package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class CollectionDescriptorTest extends AbstractSingleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Unlink expression collection test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service'.one();
				R6::unlink('service'=>service,'call'=>this);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = ::xumlrt::select_any(this->R6_service);
				::xumlrt::collections::list::basic_list::remove(__ralf__0__service->R6_call, this);
				this->R6_service = nullptr;'''
			],
			#[  "Link expression collection test (PhoneX)",
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
				::xumlrt::collections::list::basic_list::add(__ralf__0__service->R6_call, this);'''
			],
/******************************
 * SET<PRIMITIVE TYPE>
 ******************************/
			#[
				"SET<PRIMITIVE TYPE> - declaration test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Set<Integer> si;
				''',
				'''
				::std::set< long > __ralf__0__si;'''
			],
			#[
				"SET<PRIMITIVE TYPE> - creation with default variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Set<Integer> si = Set<Integer>{i};
				''',
				'''
				long __ralf__0__i = 0;
				::std::set< long > __ralf__1__si = { __ralf__0__i };'''
			],
			#[
				"SET<PRIMITIVE TYPE> - creation with default literal values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Set<Integer> si = Set<Integer>{1, 2, 3};
				''',
				'''
				::std::set< long > __ralf__0__si = { 1, 2, 3 };'''
			],
			#[
				"SET<PRIMITIVE TYPE> - creation with default literal and variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Set<Integer> si = Set<Integer>{i, 1, 2, 3};
				''',
				'''
				long __ralf__0__i = 0;
				::std::set< long > __ralf__1__si = { 1, 2, 3, __ralf__0__i };'''
			],
			#[  "SET<PRIMITIVE TYPE> - one operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> si;
				Integer i = si.one();
				''',
				'''
				::std::set< long > __ralf__0__si;
				long __ralf__1__i = ::xumlrt::select_any(__ralf__0__si);'''
			],
			#[  "SET<PRIMITIVE TYPE> - isEmpty operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> si;
				Boolean b = si.isEmpty();
				''',
				'''
				::std::set< long > __ralf__0__si;
				bool __ralf__1__b = ::xumlrt::collections::set::basic_set::isEmpty(__ralf__0__si);'''
			],
			#[  "SET<PRIMITIVE TYPE> - size operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> si;
				Integer i = si.size();
				''',
				'''
				::std::set< long > __ralf__0__si;
				long __ralf__1__i = ::xumlrt::collections::set::basic_set::size(__ralf__0__si);'''
			],
			#[  "SET<PRIMITIVE TYPE> - add operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> si;
				Boolean b = si.add(1);
				''',
				'''
				::std::set< long > __ralf__0__si;
				bool __ralf__1__b = ::xumlrt::collections::set::basic_set::add(__ralf__0__si, 1);'''
			],
			#[  "SET<PRIMITIVE TYPE> - addAll operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Integer> si1;
				Set<Integer> si2;
				Boolean b = si1.addAll(si2);
				''',
				'''
				::std::set< long > __ralf__0__si1;
				::std::set< long > __ralf__1__si2;
				bool __ralf__2__b = ::xumlrt::collections::set::basic_set::addAll(__ralf__0__si1, __ralf__1__si2);'''
			],
/******************************
 * SET<REFERENCE TYPE>
 ******************************/
			#[
				"SET<REFERENCE TYPE> - declaration test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Set<Pong> sp;
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp;'''
			],
			#[
				"SET<REFERENCE TYPE> - creation with default class variable test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Pong p = this;
				Set<Pong> sp = Set<Pong>{p};
				''',
				'''
				::model::Comp::Pong* __ralf__0__p = this;
				::std::set< ::model::Comp::Pong* > __ralf__1__sp = { __ralf__0__p };'''
			],
			#[  "SET<REFERENCE TYPE> - one operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Pong> sp;
				Pong p = sp.one();
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp;
				::model::Comp::Pong* __ralf__1__p = ::xumlrt::select_any(__ralf__0__sp);'''
			],
			#[  "SET<REFERENCE TYPE> - isEmpty operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Pong> sp;
				Boolean isEmpty = sp.isEmpty();
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp;
				bool __ralf__1__isEmpty = ::xumlrt::collections::set::basic_set::isEmpty(__ralf__0__sp);'''
			],
			#[  "SET<REFERENCE TYPE> - size operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Pong> sp;
				Integer i = sp.size();
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp;
				long __ralf__1__i = ::xumlrt::collections::set::basic_set::size(__ralf__0__sp);'''
			],
			#[  "SET<REFERENCE TYPE> - add operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Pong> sp;
				Boolean b = sp.add(this);
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp;
				bool __ralf__1__b = ::xumlrt::collections::set::basic_set::add(__ralf__0__sp, this);'''
			],
			#[  "SET<REFERENCE TYPE> - addAll operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Set<Pong> sp1;
				Set<Pong> sp2;
				Boolean b = sp1.addAll(sp2);
				''',
				'''
				::std::set< ::model::Comp::Pong* > __ralf__0__sp1;
				::std::set< ::model::Comp::Pong* > __ralf__1__sp2;
				bool __ralf__2__b = ::xumlrt::collections::set::basic_set::addAll(__ralf__0__sp1, __ralf__1__sp2);'''
			],
/******************************
 * SEQUENCE<PRIMITIVE TYPE>
 ******************************/
			#[
				"SEQUENCE<PRIMITIVE TYPE> - declaration test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Sequence<Integer> p;
				''',
				'''
				::std::vector< long > __ralf__0__p;'''
			],
			#[
				"SEQUENCE<PRIMITIVE TYPE> - creation with default literal values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Sequence<Integer> p = Sequence<Integer>{1, 2, 3};
				''',
				'''
				::std::vector< long > __ralf__0__p = { 1, 2, 3 };'''
			],
			#[
				"SEQUENCE<PRIMITIVE TYPE> - creation with default variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Sequence<Integer> p = Sequence<Integer>{i};
				''',
				'''
				long __ralf__0__i = 0;
				::std::vector< long > __ralf__1__p = { __ralf__0__i };'''
			],
			#[
				"SEQUENCE<PRIMITIVE TYPE> - creation with default literal and variable values test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Integer i = 0;
				Sequence<Integer> p = Sequence<Integer>{i, 1, 2, 3};
				''',
				'''
				long __ralf__0__i = 0;
				::std::vector< long > __ralf__1__p = { 1, 2, 3, __ralf__0__i };'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - one operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				Integer i = si.one();
				''',
				'''
				::std::vector< long > __ralf__0__si;
				long __ralf__1__i = ::xumlrt::select_any(__ralf__0__si);'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - isEmpty operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				Boolean b = si.isEmpty(1);
				''',
				'''
				::std::vector< long > __ralf__0__si;
				bool __ralf__1__b = ::xumlrt::collections::sequence::basic_vector::isEmpty(__ralf__0__si, 1);'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - size operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				Integer i = si.size(1);
				''',
				'''
				::std::vector< long > __ralf__0__si;
				long __ralf__1__i = ::xumlrt::collections::sequence::basic_vector::size(__ralf__0__si, 1);'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - get operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				Integer i = si.get(0);
				''',
				'''
				::std::vector< long > __ralf__0__si;
				long __ralf__1__i = ::xumlrt::collections::sequence::basic_vector::get(__ralf__0__si, 0);'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - add operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				si.add(1);
				''',
				'''
				::std::vector< long > __ralf__0__si;
				::xumlrt::collections::sequence::basic_vector::add(__ralf__0__si, 1);'''
			],
			#[  "SEQUENCE<PRIMITIVE TYPE> - add at index operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Integer> si;
				si.add(0, 1);
				''',
				'''
				::std::vector< long > __ralf__0__si;
				::xumlrt::collections::sequence::basic_vector::add(__ralf__0__si, 0, 1);'''
			],
/******************************
 * SEQUENCE<REFERENCE TYPE>
 ******************************/
			#[
				"SEQUENCE<REFERENCE TYPE> - declaration test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;'''
			],
			#[
				"SEQUENCE<REFERENCE TYPE> - creation with default class variable test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing",
				ConversionType.Operation,
				'''
				Pong p = this;
				Sequence<Pong> sp = Sequence<Pong>{p};
				''',
				'''
				::model::Comp::Pong* __ralf__0__p = this;
				::std::list< ::model::Comp::Pong* > __ralf__1__sp = { __ralf__0__p };'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - one operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				Pong p = sp.one();
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;
				::model::Comp::Pong* __ralf__1__p = ::xumlrt::select_any(__ralf__0__sp);'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - size operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				Integer i = sp.size();
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;
				long __ralf__1__i = ::xumlrt::collections::list::basic_list::size(__ralf__0__sp);'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - isEmpty operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				Boolean b = sp.isEmpty();
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;
				bool __ralf__1__b = ::xumlrt::collections::list::basic_list::isEmpty(__ralf__0__sp);'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - get operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				Pong p = sp.get(0);
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;
				::model::Comp::Pong* __ralf__1__p = ::xumlrt::collections::list::basic_list::get(__ralf__0__sp, 0);'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - add operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Sequence<Pong> sp;
				sp.add(this);
				''',
				'''
				::std::list< ::model::Comp::Pong* > __ralf__0__sp;
				::xumlrt::collections::list::basic_list::add(__ralf__0__sp, this);'''
			],
			#[  "SEQUENCE<REFERENCE TYPE> - add at index operation test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::sendPing", 
				ConversionType.Operation,
				'''
				Pong p = this;
				Sequence<Pong> sp;
				sp.add(0, p);
				''',
				'''
				::model::Comp::Pong* __ralf__0__p = this;
				::std::list< ::model::Comp::Pong* > __ralf__1__sp;
				::xumlrt::collections::list::basic_list::add(__ralf__1__sp, 0, __ralf__0__p);'''
			]
		)
	}
}