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
				model::Comp::Ping temp0 = ::xtuml::select_any(p->ping);
				temp0->generate_event(s);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test this",
			    '''send new ping_s(integerAttribute => 2, pongAttribute => this) to this->ping.one();''',
				
				'''
				model::Comp::Ping temp0 = ::xtuml::select_any(this->ping);
				model::Comp::Pong::ping_s temp1 = new model::Comp::Pong::ping_s();
				temp1->integerAttribute = 2;
				temp1->pongAttribute = this;
				temp0->generate_event(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test null",
			    '''
				Pong p = null;
				p = new Pong();
				ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
				send s to p->ping.one();''',
				
				'''
				model::Comp::Pong p = 0;
				model::Comp::Pong temp0 = new model::Comp::Pong();
				p = temp0;
				model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
				s->integerAttribute = 2;
				s->pongAttribute = this;
				model::Comp::Ping temp1 = ::xtuml::select_any(p->ping);
				temp1->generate_event(s);''',
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
				i = 2;
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
				x = inParameter;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Out parameter assignment",
			    '''
				Integer x = 1;
				outParameter = x;''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				outParameter = x;''',
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
				PrimitiveTypes::Integer temp0 = 1 + 1;
				temp0 * 2;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Arithmetic Expression test unnecessary parentheses",
			    '''(1 * 1) + 2;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1 * 1;
				temp0 + 2;''',
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
				++x;''',
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
				PrimitiveTypes::Integer temp0 = 1 + 2;
				PrimitiveTypes::Integer temp1 = temp0 * 3;
				PrimitiveTypes::Integer x = temp1 + 4;
				++x;
				PrimitiveTypes::Boolean temp2 = x > 3;
				PrimitiveTypes::Boolean temp3 = x == 1;
				if (temp2) {
				x--;
				} else if (temp3) {
				x++;
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
				PrimitiveTypes::Integer temp0 = 1 + 2;
				PrimitiveTypes::Integer temp1 = temp0 * 3;
				PrimitiveTypes::Integer temp2 = -4;
				PrimitiveTypes::Integer x = temp1 + temp2;
				++x;
				PrimitiveTypes::Integer y = x;
				PrimitiveTypes::Integer temp3 = x - 15;
				y = temp3;
				PrimitiveTypes::Boolean temp4 = x > 3;
				PrimitiveTypes::Integer temp5 = -5;
				PrimitiveTypes::Boolean temp6 = y < temp5;
				PrimitiveTypes::Boolean temp7 = !temp6;
				PrimitiveTypes::Boolean temp8 = temp4 && temp7;
				if (temp8) {
				x--;
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
				x++;
				break;
				}
				default : {
				x++;
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
				x++;
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
				x++;
				temp0 = true;
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
				PrimitiveTypes::Boolean temp0 = i < 5;
				while (temp0) {
				x++;
				i++;
				PrimitiveTypes::Boolean temp1 = i < 5;
				temp0 = temp1;
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
				x++;
				} else if (false) {
				x++;
				} else if (true) {
				x++;
				} else {
				x++;
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
				x++;
				} else {
				if (false) {
				x++;
				} else {
				if (true) {
				x++;
				} else {
				x++;
				}
				}
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Class instances test",
			    '''
				Pong::instances();''',
				
				'''
				model::Comp::Pong::_instances();''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Link association test",
				'''
				Ping myPing = this->'ping'.one();
				R1::link('ping'=>myPing,'pong'=>this);
				''',
				
				'''
				model::Comp::Ping temp0 = ::xtuml::select_any(this->ping);
				model::Comp::Ping myPing = temp0;
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
				model::Comp::Ping temp0 = ::xtuml::select_any(this->ping);
				model::Comp::Ping myPing = temp0;
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
				model::Comp::Ping temp0 = ::xtuml::select_any(p->ping);
				model::Comp::Pong::ping_s temp1 = model::Comp::Pong::ping_s.clone(sigdata);
				temp0->generate_event(temp1);''',
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
				std::collections::Set<PrimitiveTypes::Integer> temp0 = p->integerMultiple;
				s = temp0;''',
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
			#[  "Collection operation call, property access",
			    '''
			    Pong p = new Pong();
			    p.doIntegerMultiple(p.integerMultiple);
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				std::collections::Set<PrimitiveTypes::Integer> temp0 = p->integerMultiple;
				p.doIntegerMultiple(temp0);''',
				"sendPong"
			],
			#[  "Collection operation call, navigation",
			    '''
			    Pong p = new Pong();
			    p.doPongMultiple(Pong::instances());
			    ''',
			    '''
				model::Comp::Pong p = new model::Comp::Pong();
				model::Comp::Pong temp0 = model::Comp::Pong::_instances();
				p.doPongMultiple(temp0);''',
				"sendPong"
			],
			#[  "Cast expression",
			    '''
			    Pong p;
			    Pong2 p2 = new Pong2();
			    p = ((Pong) p2);
			    ''',
			    '''
				model::Comp::Pong p;
				model::Comp::Pong2 p2 = new model::Comp::Pong2();
				model::Comp::Pong temp0 = (model::Comp::Pong) p2;
				p = temp0;''',
				"sendPong"
			],
			#[  "Cast expression operation call",
			    '''
			    Pong p;
			    Pong2 p2 = new Pong2();
			    p.doPongVoid(((Pong) p2));
			    ''',
			    '''
				model::Comp::Pong p;
				model::Comp::Pong2 p2 = new model::Comp::Pong2();
				model::Comp::Pong temp0 = (model::Comp::Pong) p2;
				p.doPongVoid(temp0);''',
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
				for(PrimitiveTypes::Integer temp0 : s)
				{
				i + 1;
				}''',
				"model::Comp::Pong::TestOperation"
			]
			
		)
	}
}

