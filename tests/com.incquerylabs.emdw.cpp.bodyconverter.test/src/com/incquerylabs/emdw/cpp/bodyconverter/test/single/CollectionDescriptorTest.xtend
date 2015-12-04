package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class CollectionDescriptorTest extends AbstractSingleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Unlink expression collection test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'is being run / handled by'.one();
				R6::unlink('is being run / handled by'=>service,'handles / runs'=>this);
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Service* service = ::xumlrt::select_any(this->R6_is_being_run___handled_by);
				::xumlrt::collections::list::basic_list::remove(service->R6_handles___runs, this);
				this->R6_is_being_run___handled_by = nullptr;'''
			],
			#[  "Link expression collection test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'is being run / handled by'.one();
				R6::link('handles / runs'=>this,'is being run / handled by'=>service);
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Service* service = ::xumlrt::select_any(this->R6_is_being_run___handled_by);
				this->R6_is_being_run___handled_by = service;
				::xumlrt::collections::list::basic_list::add(service->R6_handles___runs, this);'''
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
				::std::set< long > si;'''
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
				long i = 0;
				::std::set< long > si = { i };'''
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
				::std::set< long > si = { 1, 2, 3 };'''
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
				long i = 0;
				::std::set< long > si = { 1, 2, 3, i };'''
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
				::std::set< long > si;
				long i = ::xumlrt::select_any(si);'''
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
				::std::set< long > si;
				bool b = ::xumlrt::collections::set::basic_set::isEmpty(si);'''
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
				::std::set< long > si;
				long i = ::xumlrt::collections::set::basic_set::size(si);'''
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
				::std::set< long > si;
				bool b = ::xumlrt::collections::set::basic_set::add(si, 1);'''
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
				::std::set< long > si1;
				::std::set< long > si2;
				bool b = ::xumlrt::collections::set::basic_set::addAll(si1, si2);'''
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
				::std::set< ::model::Comp::Pong* > sp;'''
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
				::model::Comp::Pong* p = this;
				::std::set< ::model::Comp::Pong* > sp = { p };'''
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
				::std::set< ::model::Comp::Pong* > sp;
				::model::Comp::Pong* p = ::xumlrt::select_any(sp);'''
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
				::std::set< ::model::Comp::Pong* > sp;
				bool isEmpty = ::xumlrt::collections::set::basic_set::isEmpty(sp);'''
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
				::std::set< ::model::Comp::Pong* > sp;
				long i = ::xumlrt::collections::set::basic_set::size(sp);'''
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
				::std::set< ::model::Comp::Pong* > sp;
				bool b = ::xumlrt::collections::set::basic_set::add(sp, this);'''
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
				::std::set< ::model::Comp::Pong* > sp1;
				::std::set< ::model::Comp::Pong* > sp2;
				bool b = ::xumlrt::collections::set::basic_set::addAll(sp1, sp2);'''
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
				::std::vector< long > p;'''
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
				::std::vector< long > p = { 1, 2, 3 };'''
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
				long i = 0;
				::std::vector< long > p = { i };'''
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
				long i = 0;
				::std::vector< long > p = { 1, 2, 3, i };'''
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
				::std::vector< long > si;
				long i = ::xumlrt::select_any(si);'''
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
				::std::vector< long > si;
				bool b = ::xumlrt::collections::sequence::basic_vector::isEmpty(si, 1);'''
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
				::std::vector< long > si;
				long i = ::xumlrt::collections::sequence::basic_vector::size(si, 1);'''
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
				::std::vector< long > si;
				long i = ::xumlrt::collections::sequence::basic_vector::get(si, 0);'''
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
				::std::vector< long > si;
				::xumlrt::collections::sequence::basic_vector::add(si, 1);'''
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
				::std::vector< long > si;
				::xumlrt::collections::sequence::basic_vector::add(si, 0, 1);'''
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
				::std::list< ::model::Comp::Pong* > sp;'''
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
				::model::Comp::Pong* p = this;
				::std::list< ::model::Comp::Pong* > sp = { p };'''
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
				::std::list< ::model::Comp::Pong* > sp;
				::model::Comp::Pong* p = ::xumlrt::select_any(sp);'''
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
				::std::list< ::model::Comp::Pong* > sp;
				long i = ::xumlrt::collections::list::basic_list::size(sp);'''
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
				::std::list< ::model::Comp::Pong* > sp;
				bool b = ::xumlrt::collections::list::basic_list::isEmpty(sp);'''
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
				::std::list< ::model::Comp::Pong* > sp;
				::model::Comp::Pong* p = ::xumlrt::collections::list::basic_list::get(sp, 0);'''
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
				::std::list< ::model::Comp::Pong* > sp;
				::xumlrt::collections::list::basic_list::add(sp, this);'''
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
				::model::Comp::Pong* p = this;
				::std::list< ::model::Comp::Pong* > sp;
				::xumlrt::collections::list::basic_list::add(sp, 0, p);'''
			]
		)
	}
}