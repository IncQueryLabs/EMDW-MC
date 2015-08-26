package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class SnippetFlattenerPluginTest extends AbstractPluginSnippetTest{

	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Property access",
			    '''
				Pong p = new Pong();
				Integer x;
				x = p.integerProperty ;''',
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong p = temp0;
				PrimitiveTypes::Integer x;
				PrimitiveTypes::Integer temp1 = p->integerProperty;
				x = temp1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access 2",
			    '''
				Pong p = new Pong();
				Integer x = p.integerProperty ;''',
				
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong p = temp0;
				PrimitiveTypes::Integer temp1 = p->integerProperty;
				PrimitiveTypes::Integer x = temp1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access 3",
			    '''
				Ping p = new Ping();
				Integer x = p->pong.integerProperty ;''',
				'''
				model::Comp::Ping temp0 = new model::Comp::Ping();
				model::Comp::Ping p = temp0;
				model::Comp::Pong temp1 = p->pong;
				PrimitiveTypes::Integer temp2 = temp1->integerProperty;
				PrimitiveTypes::Integer x = temp2;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access this",
			    '''Integer x = this.integerProperty;''',
				'''
				PrimitiveTypes::Integer temp0 = this->integerProperty;
				PrimitiveTypes::Integer x = temp0;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property write",
			    '''
				Pong p = new Pong();
				p.integerProperty = 1;''',
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong p = temp0;
				PrimitiveTypes::Integer temp1 = 1;
				p->integerProperty = temp1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property write this",
			    '''
				this.integerProperty = 1;''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				this->integerProperty = temp0;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call",
			    '''
			    Pong x = new Pong();
			    x.doIntegerVoid(1);''',
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				model::Comp::Pong x = temp0;
				PrimitiveTypes::Integer temp1 = 1;
				x.doIntegerVoid(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call additive",
			    '''this.doIntegerVoid(1+2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 2;
				PrimitiveTypes::Integer temp2 = temp0 + temp1;
				this.doIntegerVoid(temp2);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call multiplicative",
			    '''this.doIntegerVoid(1*2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 2;
				PrimitiveTypes::Integer temp2 = temp0 * temp1;
				this.doIntegerVoid(temp2);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call shift",
			    '''this.doIntegerVoid(1 >> 2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 2;
				PrimitiveTypes::Integer temp2 = temp0 >> temp1;
				this.doIntegerVoid(temp2);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call numeric unary",
			    '''this.doIntegerVoid(-1);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 =  - temp0;
				this.doIntegerVoid(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call postfix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(x++);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer x = temp0;
				PrimitiveTypes::Integer temp1 = x++;
				this.doIntegerVoid(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call prefix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(++x);''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer x = temp0;
				PrimitiveTypes::Integer temp1 = ++x;
				this.doIntegerVoid(temp1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call operation call",
			    '''
			    this.doIntegerVoid(this.returnInteger());''',
				'''
				PrimitiveTypes::Integer temp0 = this.returnInteger();
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch literal",
			    '''
				switch(1){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch variable",
			    '''
				Integer x = 1;
				switch(x){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer x = temp0;
				switch (x) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch addition",
			    '''
				switch(1+1){
				}''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 1;
				PrimitiveTypes::Integer temp2 = temp0 + temp1;
				switch (temp2) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch shift",
			    '''
				switch(1 >> 2){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 2;
				PrimitiveTypes::Integer temp2 = temp0 >> temp1;
				switch (temp2) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch bitwise or",
			    '''
				switch(1 | 2){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1;
				PrimitiveTypes::Integer temp1 = 2;
				PrimitiveTypes::Integer temp2 = temp0 | temp1;
				switch (temp2) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch operation parameter",
			    '''
				switch(parameter){}''',
				'''
				switch (parameter) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch property",
			    '''
				switch(this.integerProperty){}''',
				'''
				PrimitiveTypes::Integer temp0 = this->integerProperty;
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch operation call",
			    '''
				switch(this.returnInteger()){}''',
				'''
				PrimitiveTypes::Integer temp0 = this.returnInteger();
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			]
			
		)
	}
}

