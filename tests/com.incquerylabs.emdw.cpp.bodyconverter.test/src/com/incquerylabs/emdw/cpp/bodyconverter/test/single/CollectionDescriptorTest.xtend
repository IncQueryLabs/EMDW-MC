package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class CollectionDescriptorTest extends AbstractSingleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
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
				::std::set< long > __ralf__2____std__set = { __ralf__0__i };
				::std::set< long > __ralf__1__si = __ralf__2____std__set;'''
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
				::std::set< long > __ralf__1____std__set = { 1, 2, 3 };
				::std::set< long > __ralf__0__si = __ralf__1____std__set;'''
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
				::std::set< long > __ralf__2____std__set = { 1, 2, 3, __ralf__0__i };
				::std::set< long > __ralf__1__si = __ralf__2____std__set;'''
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
				bool __ralf__1__b = __ralf__0__si.empty();'''
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
				long __ralf__1__i = __ralf__0__si.size();'''
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
				::std::pair< ::std::set< long>::iterator, bool> result = __ralf__0__si.insert(1);
				bool __ralf__2__bool = result.second;
				bool __ralf__1__b = __ralf__2__bool;'''
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
				bool __ralf__2__b = __ralf__0__si1.insert(__ralf__1__si2.begin(), __ralf__1__si2.end());'''
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
				::std::set< ::model::Comp::Pong* > __ralf__2____std__set = { __ralf__0__p };
				::std::set< ::model::Comp::Pong* > __ralf__1__sp = __ralf__2____std__set;'''
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
				bool __ralf__1__isEmpty = __ralf__0__sp.empty();'''
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
				long __ralf__1__i = __ralf__0__sp.size();'''
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
				::std::pair< ::std::set< ::model::Comp::Pong*>::iterator, bool> result = __ralf__0__sp.insert(this);
				bool __ralf__2__bool = result.second;
				bool __ralf__1__b = __ralf__2__bool;'''
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
				bool __ralf__2__b = __ralf__0__sp1.insert(__ralf__1__sp2.begin(), __ralf__1__sp2.end());'''
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
				::std::vector< long > __ralf__1____std__vector = { 1, 2, 3 };
				::std::vector< long > __ralf__0__p = __ralf__1____std__vector;'''
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
				::std::vector< long > __ralf__2____std__vector = { __ralf__0__i };
				::std::vector< long > __ralf__1__p = __ralf__2____std__vector;'''
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
				::std::vector< long > __ralf__2____std__vector = { 1, 2, 3, __ralf__0__i };
				::std::vector< long > __ralf__1__p = __ralf__2____std__vector;'''
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
				bool __ralf__1__b = __ralf__0__si.empty();'''
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
				long __ralf__1__i = __ralf__0__si.size();'''
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
				long __ralf__1__i = __ralf__0__si[0];'''
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
				__ralf__0__si.push_back(1);
				true;'''
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
				::std::vector< long>::iterator __ralf__1__it = __ralf__0__si.begin();
				::std::advance(__ralf__1__it, 0);
				__ralf__0__si.insert(__ralf__1__it, 1);
				true;'''
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
				::std::list< ::model::Comp::Pong* > __ralf__2____std__list = { __ralf__0__p };
				::std::list< ::model::Comp::Pong* > __ralf__1__sp = __ralf__2____std__list;'''
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
				long __ralf__1__i = __ralf__0__sp.size();'''
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
				bool __ralf__1__b = __ralf__0__sp.empty();'''
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
				::model::Comp::Pong* __ralf__1__p = __ralf__0__sp[0];'''
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
				__ralf__0__sp.push_back(this);
				true;'''
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
				::std::vector< ::model::Comp::Pong*>::iterator __ralf__2__it = __ralf__1__sp.begin();
				::std::advance(__ralf__2__it, 0);
				__ralf__1__sp.insert(__ralf__2__it, __ralf__0__p);
				true;'''
			]
		)
	}
}