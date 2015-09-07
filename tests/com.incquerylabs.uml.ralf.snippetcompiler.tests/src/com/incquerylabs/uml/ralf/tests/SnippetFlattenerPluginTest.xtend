package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class SnippetFlattenerPluginTest extends AbstractPluginSnippetTest{

	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Multiple addition",
			    '''Integer x = 1+2+3;''',
				'''
				PrimitiveTypes::Integer temp0 = 1 + 2;
				PrimitiveTypes::Integer x = temp0 + 3;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Multiple addition real",
			    '''Real x = 1.1 * 2.2 *3.3;''',
				'''
				PrimitiveTypes::Real temp0 = 1.1 * 2.2;
				PrimitiveTypes::Real x = temp0 * 3.3;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Multiple string concat",
			    '''String x = "1.1" + "2.2" + "3.3";''',
				'''
				PrimitiveTypes::String temp0 = "1.1" + "2.2";
				PrimitiveTypes::String x = temp0 + "3.3";''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Mixed arithmetics",
			    '''Real x = 1 * 1.1 / 3;''',
				'''
				PrimitiveTypes::Real temp0 = 1 * 1.1;
				PrimitiveTypes::Real x = temp0 / 3;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access",
			    '''
				Pong p = new Pong();
				Integer x;
				x = p.integerProperty ;''',
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				PrimitiveTypes::Integer x;
				PrimitiveTypes::Integer temp0 = p->integerProperty;
				x = temp0;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access 2",
			    '''
				Pong p = new Pong();
				Integer x = p.integerProperty ;''',
				
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				PrimitiveTypes::Integer x = p->integerProperty;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access 3",
			    '''
				Ping p = new Ping();
				Integer x = p->pong.integerProperty ;''',
				'''
				model::Comp::Ping p = new model::Comp::Ping();
				model::Comp::Pong temp0 = p->pong;
				PrimitiveTypes::Integer x = temp0->integerProperty;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access this",
			    '''Integer x = this.integerProperty;''',
				'''PrimitiveTypes::Integer x = this->integerProperty;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property write",
			    '''
				Pong p = new Pong();
				p.integerProperty = 1;''',
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				p->integerProperty = 1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property write this",
			    '''
				this.integerProperty = 1;''',
				'''this->integerProperty = 1;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call",
			    '''
			    Pong x = new Pong();
			    x.returnInteger();''',
				'''
				model::Comp::Pong x = new model::Comp::Pong();
				x.returnInteger();''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call additive",
			    '''this.doIntegerVoid(1+2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1 + 2;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call multiplicative",
			    '''this.doIntegerVoid(1*2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1 * 2;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call shift",
			    '''this.doIntegerVoid(1 >> 2);''',
				'''
				PrimitiveTypes::Integer temp0 = 1 >> 2;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call numeric unary",
			    '''this.doIntegerVoid(-1);''',
				'''
				PrimitiveTypes::Integer temp0 = -1;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call postfix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(x++);''',
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Integer temp0 = x++;
				this.doIntegerVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call prefix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(++x);''',
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Integer temp0 = ++x;
				this.doIntegerVoid(temp0);''',
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
			#[  "Operation call new",
			    '''this.doPongVoid(new Pong());''',
				'''
				model::Comp::Pong temp0 = new model::Comp::Pong();
				this.doPongVoid(temp0);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch literal",
			    '''
				switch(1){}''',
				'''
				switch (1) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch variable",
			    '''
				Integer x = 1;
				switch(x){}''',
				'''
				PrimitiveTypes::Integer x = 1;
				switch (x) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch addition",
			    '''
				switch(1+1){
				}''',
				'''
				PrimitiveTypes::Integer temp0 = 1 + 1;
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch shift",
			    '''
				switch(1 >> 2){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1 >> 2;
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch bitwise or",
			    '''
				switch(1 | 2){}''',
				'''
				PrimitiveTypes::Integer temp0 = 1 | 2;
				switch (temp0) {
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
			],
			#[  "Switch assignment",
			    '''
				Integer x = 0;
				switch(x=1){}''',
				'''
				PrimitiveTypes::Integer x = 0;
				PrimitiveTypes::Integer temp0 = (x = 1);
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Arithmetic inline",
			    '''
				Integer x = 1;
				(x + 1) * 2;''',
				'''
				PrimitiveTypes::Integer x = 1;
				PrimitiveTypes::Integer temp0 = x + 1;
				temp0 * 2;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Postfix expression on property this",
			    '''this.integerProperty++;''',
				'''this->integerProperty++;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Prefix expression on property this",
			    '''++this.integerProperty;''',
				'''++this->integerProperty;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Postfix expression on property",
			    '''
			    Pong x = new Pong();
			    x.integerProperty++;''',
				'''
				model::Comp::Pong x = new model::Comp::Pong();
				x->integerProperty++;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Prefix expression on property",
			    '''
			    Pong x = new Pong();
			    ++x.integerProperty;''',
				'''
				model::Comp::Pong x = new model::Comp::Pong();
				++x->integerProperty;''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Postfix expression on association",
			    '''
			    Ping x = new Ping();
			    x->pong.integerProperty++;''',
				'''
				model::Comp::Ping x = new model::Comp::Ping();
				model::Comp::Pong temp0 = x->pong;
				temp0->integerProperty++;''',
				"model::Comp::Pong::doIntegerVoid"
			]
			
			
			
		)
	}
}

