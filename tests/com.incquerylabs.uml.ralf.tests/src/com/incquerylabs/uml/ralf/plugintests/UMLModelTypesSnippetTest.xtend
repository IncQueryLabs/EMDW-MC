package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLModelTypesSnippetTest extends AbstractPluginSnippetTest{
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
				p = temp0;
				model::Comp::Pong::ping_s temp1 = new model::Comp::Pong::ping_s();
				model::Comp::Pong::ping_s s = temp1;
				model::Comp::Ping temp2 = p->ping;
				temp2->generate_event(s);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property assignment",
			    '''
				Integer i = 1;
				i = 2;
				Pong p = new Pong();
				p.integerProperty = 1;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer i = temp0;
				PrimitiveTypes::Integer temp1 = 2;
				i = temp1;
				model::Comp::Pong temp2 = new model::Comp::Pong();
				model::Comp::Pong p = temp2;
				PrimitiveTypes::Integer temp3 = 1;
				p->integerProperty = temp3;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call",
			    '''this.doIntegerVoid(1);''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call variable",
			    '''
				Integer x = 2;
				this.doIntegerVoid(x);''',
				
				'''
				PrimitiveTypes::Integer temp0 = 2;
				PrimitiveTypes::Integer x = temp0;
				this.doIntegerVoid(x);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "In parameter reference",
			    '''
				Integer x = 1;
				x = inParameter;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer x = temp0;
				x = inParameter;''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Out parameter assignment",
			    '''
				Integer x = 1;
				outParameter = x;''',
				
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer x = temp0;
				outParameter = x;''',
				"model::Comp::Pong::TestOperation"
			]
		)
	}	
}

