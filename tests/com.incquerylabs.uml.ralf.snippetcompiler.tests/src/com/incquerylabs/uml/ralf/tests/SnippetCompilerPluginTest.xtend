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
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong x = temp0;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test",
			    '''
				Pong p = new Pong();
				ping_s s = new ping_s();
				send s to p->ping;''',
				
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong p = temp0;
				model::Comp::Pong::ping_s temp1 = new model::Comp::Pong::ping_s();
				model::Comp::Pong::ping_s s = temp1;
				model::Comp::Ping temp2 = p->ping;
				temp2->generate_event(s);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test this",
			    '''send new ping_s() to this->ping;''',
				
				'''
				model::Comp::Ping temp0 = this->ping;
				model::Comp::Pong::ping_s temp1 = new model::Comp::Pong::ping_s();
				temp0->generate_event(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Send Signal test null",
			    '''
				Pong p = null;
				p = new Pong();
				ping_s s = new ping_s();
				send s to p->ping;''',
				
				'''
				model::Comp::Pong p = 0;
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong temp1 = (p = temp0);
				temp1;
				model::Comp::Pong::ping_s temp2 = new model::Comp::Pong::ping_s();
				model::Comp::Pong::ping_s s = temp2;
				model::Comp::Ping temp3 = p->ping;
				temp3->generate_event(s);''',
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
				PrimitiveTypes::Integer temp0 = (i = 2);
				temp0;
				model::Comp::Pong temp1 = new model::Comp::Pong();
				model::Comp::Pong p = temp1;
				PrimitiveTypes::Integer temp2 = (p->integerProperty = 1);
				temp2;''',
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
				PrimitiveTypes::Integer temp0 = (x = inParameter);
				temp0;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Out parameter assignment",
			    '''
				Integer x = 1;
				outParameter = x;''',
				
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Integer temp0 = (outParameter = x);
				temp0;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Numeric Unary Expression test",
			    '''-4;''',
				
				'''
				PrimitiveTypes::Integer temp0 = -4;
				temp0;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Boolean Unary Expression test",
			    '''!true;''',
				
				'''
				PrimitiveTypes::Boolean temp0 = !true;
				temp0;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Arithmetic Expression test",
			    '''(1 + 1) * 2;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1 + 1;
				PrimitiveTypes::Integer temp1 = temp0 * 2;
				temp1;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Arithmetic Expression test unnecessary parentheses",
			    '''(1 * 1) + 2;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1 * 1;
				PrimitiveTypes::Integer temp1 = temp0 + 2;
				temp1;''',
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
				PrimitiveTypes::Integer temp0 = ++x;
				temp0;''',
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
				PrimitiveTypes::Integer temp2 = temp1 + 4;
				PrimitiveTypes::Integer x = temp2;
				PrimitiveTypes::Integer temp3 = ++x;
				temp3;
				PrimitiveTypes::Boolean temp4 = x > 3;
				PrimitiveTypes::Boolean temp6 = x == 1;
				if (temp4) {
				PrimitiveTypes::Integer temp5 = x--;
				temp5;
				} else if (temp6) {
				PrimitiveTypes::Integer temp7 = x++;
				temp7;
				}''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Complex arithmetics3 test",
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
				PrimitiveTypes::Integer temp3 = temp1 + temp2;
				PrimitiveTypes::Integer x = temp3;
				PrimitiveTypes::Integer temp4 = ++x;
				temp4;
				PrimitiveTypes::Integer y = x;
				PrimitiveTypes::Integer temp5 = x - 15;
				PrimitiveTypes::Integer temp6 = (y = temp5);
				temp6;
				PrimitiveTypes::Boolean temp7 = x > 3;
				PrimitiveTypes::Integer temp8 = -5;
				PrimitiveTypes::Boolean temp9 = y < temp8;
				PrimitiveTypes::Boolean temp10 = !temp9;
				PrimitiveTypes::Boolean temp11 = temp7 && temp10;
				if (temp11) {
				PrimitiveTypes::Integer temp12 = x--;
				temp12;
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
				PrimitiveTypes::Integer temp0 = x++;
				temp0;
				break;
				}
				default : {
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
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
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
				PrimitiveTypes::Boolean temp2 = true;
				temp0 = temp2;
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
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
				PrimitiveTypes::Boolean temp2 = true;
				temp0 = temp2;
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
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
				PrimitiveTypes::Integer temp2 = i++;
				temp2;
				PrimitiveTypes::Boolean temp3 = i < 5;
				temp0 = temp3;
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
				PrimitiveTypes::Integer temp0 = x++;
				temp0;
				} else if (false) {
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
				} else if (true) {
				PrimitiveTypes::Integer temp2 = x++;
				temp2;
				} else {
				PrimitiveTypes::Integer temp3 = x++;
				temp3;
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
				PrimitiveTypes::Integer temp0 = x++;
				temp0;
				} else {
				if (false) {
				PrimitiveTypes::Integer temp1 = x++;
				temp1;
				} else {
				if (true) {
				PrimitiveTypes::Integer temp2 = x++;
				temp2;
				} else {
				PrimitiveTypes::Integer temp3 = x++;
				temp3;
				}
				}
				}''',
				"model::Comp::Pong::TestOperation"
			]
		)
	}
}

