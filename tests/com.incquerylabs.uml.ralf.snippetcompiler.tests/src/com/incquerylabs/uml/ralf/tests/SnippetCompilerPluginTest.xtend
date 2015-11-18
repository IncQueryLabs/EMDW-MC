package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class SnippetCompilerPluginTest extends AbstractPluginSnippetTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "UML Type Instantiation",
			    '''Pong x = new Pong();''',
				'''model::Comp::Pong x = new model::Comp::Pong();''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "UML Type Instantiation Named Tuple",
			    '''Pong x = new Pong(parameter => 1, parameter2 => 2);''',
				'''model::Comp::Pong x = new model::Comp::Pong(1, 2);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "UML Type deletion",
			    '''
			    Pong x = new Pong();
			    delete x;''',
				'''
				model::Comp::Pong x = new model::Comp::Pong();
				delete x;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Signal creation test_noparam",
			    '''Ping::pong_s s = new Ping::pong_s();''',
				
				'''model::Comp::Ping::pong_s s = new model::Comp::Ping::pong_s();
				''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test",
			    '''
				Pong p = new Pong();
				ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
				send s to p->ping.one();''',
				
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
				s->integerAttribute = 2;
				s->pongAttribute = this;
				::xumlrt::select_any(p->ping)->generate_external_event(s);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test this",
			    '''send new ping_s(integerAttribute => 2, pongAttribute => this) to this->ping.one();''',
				
				'''
				model::Comp::Pong::ping_s temp0 = new model::Comp::Pong::ping_s();
				temp0->integerAttribute = 2;
				temp0->pongAttribute = this;
				::xumlrt::select_any(this->ping)->generate_external_event(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test null",
			    '''
				Pong p = null;
				p = new Pong();
				ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
				send s to p->ping.one();''',
				
				'''
				model::Comp::Pong p = nullptr;
				pointer{p} = new model::Comp::Pong();
				model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
				s->integerAttribute = 2;
				s->pongAttribute = this;
				::xumlrt::select_any(p->ping)->generate_external_event(s);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property assignment",
			    '''
				Integer i = 1;
				i = 2;
				Pong p = new Pong();
				p.integerProperty = 1;''',
				
				'''
				PrimitiveTypes::Integer i = 1;
				value{i} = 2;
				model::Comp::Pong p = new model::Comp::Pong();
				p->integerProperty = 1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call",
			    '''this.doIntegerVoid(1);''',
				
				'''this.doIntegerVoid(1);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call variable",
			    '''
				Integer x = 2;
				this.doIntegerVoid(x);''',
				
				'''
				PrimitiveTypes::Integer x = 2;
				this.doIntegerVoid(x);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "In parameter reference",
			    '''
				Integer x = 1;
				x = inParameter;''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				value{x} = inParameter;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Out parameter assignment",
			    '''
				Integer x = 1;
				outParameter = x;''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				value{outParameter} = x;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Numeric Unary Expression test",
			    '''-4;''',
				
				'''-4;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Boolean Unary Expression test",
			    '''!true;''',
				
				'''!true;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Arithmetic Expression test",
			    '''(1 + 1) * 2;''',
				
				'''
				(value{(value{1} + value{1})} * value{2});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Arithmetic Expression test unnecessary parentheses",
			    '''(1 * 1) + 2;''',
				
				'''
				(value{(value{1} * value{1})} + value{2});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Variable definition test",
			    '''Integer x = 1;''',
				
				'''PrimitiveTypes::Integer x = 1;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Affix increment test",
			    '''
				Integer x = 1;
				++x;''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				++value{x};''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Complex arithmetics test",
			    '''
				Integer x = (1 + 2) * 3 + 4;
				++x;
				if (x > 3) {
					x--;
				} else if(x == 1){
					x++;
				}''',
				
				'''
				PrimitiveTypes::Integer x = (value{(value{(value{1} + value{2})} * value{3})} + value{4});
				++value{x};
				if ((value{x} > value{3})) {
				value{x}--;
				} else if ((value{x} == value{1})) {
				value{x}++;
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Complex arithmetics2 test",
			    '''
				Integer x = (1 + 2) * 3 + -4;
				++x;
				Integer y = x;
				y = x - 15;
				if ((x > 3) && !(y < -5)) {
				x--;
				}''',
				
				'''
				PrimitiveTypes::Integer x = (value{(value{(value{1} + value{2})} * value{3})} + value{-4});
				++value{x};
				PrimitiveTypes::Integer y = x;
				value{y} = (value{x} - value{15});
				if ((value{(value{x} > value{3})} && value{!(value{y} < value{-5})})) {
				value{x}--;
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Affix increment switch test",
			    '''
				Integer x = 1;
				switch (x){
					case 1 : x++; break;
					default : x++;
				}''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				switch (x) {
				case 1 : {
				value{x}++;
				break;
				}
				default : {
				value{x}++;
				}
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Affix increment Do..While test",
			    '''
				Integer x = 1;	
				do{
					x++;
				} while (true);''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Boolean temp0 = true;
				do {
				value{x}++;
				temp0 = true;
				}while (temp0);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Affix increment While test",
			    '''
				Integer x = 1;
				while (true) {
					x++;
				}''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Boolean temp0 = true;
				while (temp0) {
				value{x}++;
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Affix increment For test",
			    '''
				Integer x = 1;
				for (Integer i = 0; i < 5; i++) {
					x++; 
				}''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				{
				PrimitiveTypes::Integer i = 0;
				while ((value{i} < value{5})) {
				value{x}++;
				value{i}++;
				(value{i} < value{5}) = (value{i} < value{5});
				}
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "If test",
			    '''
				Integer x = 1;
				if(true){
					x++;
				}
				else if (false){
					x++;
				}else if (true){
					x++;
				}else{
					x++;
				}''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				if (true) {
				value{x}++;
				} else if (false) {
				value{x}++;
				} else if (true) {
				value{x}++;
				} else {
				value{x}++;
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "If test nested",
			    '''
				Integer x = 1;
				if(true){
					x++;
				}else {
					if(false){
						x++;
					}else{
						if(true){
							x++;
						}
						else{
							x++;
						}
					}
				}''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				if (true) {
				value{x}++;
				} else {
				if (false) {
				value{x}++;
				} else {
				if (true) {
				value{x}++;
				} else {
				value{x}++;
				}
				}
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Class instances test",
			    '''
				Pong::instances();''',
				
				'''
				::xumlrt::select_many(model::Comp::Pong::_instances());''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Link association test",
				'''
				Ping myPing = this->'ping'.one();
				R1::link('ping'=>myPing,'pong'=>this);
				''',
				
				'''
				model::Comp::Ping myPing = ::xumlrt::select_any(this->ping);
				this->R1_ping = myPing;
				myPing->R1_pong = this;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Unlink association test",
				'''
				Ping myPing = this->'ping'.one();
				R1::unlink('ping'=>myPing,'pong'=>this);
				''',
				
				'''
				model::Comp::Ping myPing = ::xumlrt::select_any(this->ping);
				this->R1_ping = NULL;
				myPing->R1_pong = NULL;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Empty return statement",
			    '''return;''',
				
				'''return;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Signal Data Access",
			    '''sigdata;''',
			    '''sigdata;''',
				"sendPong"
			],
			#[  "Signal Data Property Access",
			    '''sigdata.integerAttribute;''',
			    '''sigdata->integerAttribute;''',
				"sendPong"
			],
			#[  "Signal Data send",
			    '''
				Pong p = new Pong();
				send sigdata to p->ping.one();''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				model::Comp::Pong::ping_s temp0 = model::Comp::Pong::ping_s.clone(sigdata);
				::xumlrt::select_any(p->ping)->generate_external_event(temp0);''',
				"sendPong"
			],
			#[  "Collection variable declaration",
			    '''Set<Integer> p = Set<Integer>{1, 2, 3};''',
			    '''std::collections::Set<PrimitiveTypes::Integer> p = std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 };''',
				"sendPong"
			],
			#[  "Collection variable declaration_ no_literal",
			    '''Set<Integer> p;''',
			    '''std::collections::Set<PrimitiveTypes::Integer> p;''',
				"sendPong"
			],
			#[  "Collection property access",
			    '''
			    Pong p = new Pong();
			    Set<Integer> s = Set<Integer>{1, 2, 3};
			    s = p.integerMultiple;
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				std::collections::Set<PrimitiveTypes::Integer> s = std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 };
				value{s} = p->integerMultiple;''',
				"sendPong"
			],
			#[  "Collection property write",
			    '''
			    Pong p = new Pong();
			    Set<Integer> s = Set<Integer>{1, 2, 3};
			    p.integerMultiple = s;
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				std::collections::Set<PrimitiveTypes::Integer> s = std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 };
				p->integerMultiple = s;''',
				"sendPong"
			],
			#[  "Collection operation call",
			    '''
			    Pong p = new Pong();
			    p.doIntegerMultiple(Set<Integer>{1, 2, 3});
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				p.doIntegerMultiple(std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 });''',
				"sendPong"
			],
			#[  "Collection operation call named",
			    '''
			    Pong p = new Pong();
			    p.doIntegerMultiple(parameter => Set<Integer>{1, 2, 3});
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				p.doIntegerMultiple(std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 });''',
				"sendPong"
			],
			#[  "Collection operation call named2",
			    '''
			    Pong p = new Pong();
			    Set<Integer> s = Set<Integer>{1, 2, 3};
			    p.doIntegerMultiple(parameter => s);
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				std::collections::Set<PrimitiveTypes::Integer> s = std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 };
				p.doIntegerMultiple(s);''',
				"sendPong"
			],
			#[  "Collection operation call, property access",
			    '''
			    Pong p = new Pong();
			    p.doIntegerMultiple(p.integerMultiple);
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				p.doIntegerMultiple(p->integerMultiple);''',
				"sendPong"
			],
			#[  "Collection operation call, navigation",
			    '''
			    Pong p = new Pong();
			    p.doPongMultiple(Pong::instances());
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				p.doPongMultiple(::xumlrt::select_many(model::Comp::Pong::_instances()));''',
				"sendPong"
			],
			#[  "Cast expression",
			    '''
			    Pong p;
			    Pong2 p2 = new Pong2();
			    p = ((Pong) p2);
			    ''',
			    '''
				model::Comp::Pong p = default;
				model::Comp::Pong2 p2 = new model::Comp::Pong2();
				pointer{p} = (model::Comp::Pong) p2;''',
				"sendPong"
			],
			#[  "Cast expression operation call",
			    '''
			    Pong p;
			    Pong2 p2 = new Pong2();
			    p.doPongVoid(((Pong) p2));
			    ''',
			    '''
				model::Comp::Pong p = default;
				model::Comp::Pong2 p2 = new model::Comp::Pong2();
				p.doPongVoid((model::Comp::Pong) p2);''',
				"sendPong"
			],
			#[  "For Each test",
			    '''
			    Set<Integer> s = Set<Integer>{1, 2, 3};
			    for(Integer i in s){
			    	i+1;
			    }''',
			    '''
				std::collections::Set<PrimitiveTypes::Integer> s = std::collections::Set<PrimitiveTypes::Integer> {1, 2, 3 };
				for(PrimitiveTypes::Integer i : s) {
				(value{i} + value{1});
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Cast Expression no flatten",
			    '''
			    Pong p = new Pong();
			    (Pong2) p;''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				(model::Comp::Pong2) p;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Filter expression",
			    '''
			    Pong::instances().filter(p : p.integerProperty == 1);''',
			    '''
				::xumlrt::select_many_where< model::Comp::Pong >(model::Comp::Pong::_instances(), [&](model::Comp::Pong p) {
							return (value{p->integerProperty} == value{1});
						});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Association access expression",
			    '''
			    Pong p = new Pong();
			    p->ping;''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				::xumlrt::select_many(p->ping);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Navigation Chain",
			    '''
			    Ping p = new Ping();
			    p->pong.one().integerProperty;''',
			    '''
				model::Comp::Ping p = new model::Comp::Ping();
				::xumlrt::select_any(p->pong)->integerProperty;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Conditional test",
			    '''(true || false) ? 1 : 2;''',
			    '''
				((value{(value{true} || value{false})}) ? (value{1}) : (value{2}));''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Name Expression Parameter value representation required test",
			    '''Integer i = inParameter;''',
			    '''PrimitiveTypes::Integer i = value{inParameter};''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Empty statement",
			    ''';''',
			    ''';''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Return integer",
			    '''return 1;''',
				
				'''return 1;''',
				"model::Comp::Pong::returnInteger"
			],
			#[
				"Enumeration literal",
				'''PingPongEnum testEnum;''',
				
				'''model::Comp::PingPongEnum testEnum;''',
				"model::Comp::Pong::TestOperation"
			],
						#[
				"Enumeration literal assignment",
				'''PingPongEnum testEnum = PingPongEnum::Ping;''',
				
				'''model::Comp::PingPongEnum testEnum = model::Comp::PingPongEnum::Ping;''',
				"model::Comp::Pong::TestOperation"
			]
		)
	}
}

