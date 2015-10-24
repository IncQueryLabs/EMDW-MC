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
				PrimitiveTypes::Integer x = (value{(value{1} + value{2})} + value{3});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Multiple addition real",
			    '''Real x = 1.1 * 2.2 *3.3;''',
				'''
				PrimitiveTypes::Real x = (value{(value{1.1} * value{2.2})} * value{3.3});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Multiple string concat",
			    '''String x = "1.1" + "2.2" + "3.3";''',
				'''
				PrimitiveTypes::String x = (value{(value{"1.1"} + value{"2.2"})} + value{"3.3"});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Mixed arithmetics",
			    '''Real x = 1 * 1.1 / 3;''',
				'''
				PrimitiveTypes::Real x = (value{(value{1} * value{1.1})} / value{3});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Property access",
			    '''
				Pong p = new Pong();
				Integer x;
				x = p.integerProperty ;''',
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				PrimitiveTypes::Integer x = default;
				value{x} = p->integerProperty;''',
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
				this.doIntegerVoid((value{1} + value{2}));''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call additive_alternative_syn",
			    '''this.doIntegerVoid(parameter => 1+2);''',
				'''
				this.doIntegerVoid((value{1} + value{2}));''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call alternative_syn_reorder",
			    '''this.doIntegerVoid(parameter2 => 1, parameter => 2);''',
				'''this.doIntegerVoid(2, 1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call multiplicative",
			    '''this.doIntegerVoid(1*2);''',
				'''
				this.doIntegerVoid((value{1} * value{2}));''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call shift",
			    '''this.doIntegerVoid(1 >> 2);''',
				'''
				this.doIntegerVoid(value{1} >> value{2});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call numeric unary",
			    '''this.doIntegerVoid(-1);''',
				'''
				this.doIntegerVoid(-1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call numeric unary_alternative_syn",
			    '''this.doIntegerVoid(parameter => -1);''',
				'''
				this.doIntegerVoid(-1);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call postfix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(x++);''',
				'''
				PrimitiveTypes::Integer x = 1;
				this.doIntegerVoid(value{x}++);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call prefix increment",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(++x);''',
				'''
				PrimitiveTypes::Integer x = 1;
				this.doIntegerVoid(++value{x});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call prefix increment_alternative_syn",
			    '''
			    Integer x = 1;
			    this.doIntegerVoid(parameter => ++x);''',
				'''
				PrimitiveTypes::Integer x = 1;
				this.doIntegerVoid(++value{x});''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call operation call",
			    '''
			    this.doIntegerVoid(this.returnInteger());''',
				'''
				this.doIntegerVoid(this.returnInteger());''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call operation call_alternative_syn",
			    '''
			    this.doIntegerVoid(parameter => this.returnInteger());''',
				'''
				this.doIntegerVoid(this.returnInteger());''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call new",
			    '''this.doPongVoid(new Pong());''',
				'''
				this.doPongVoid(new model::Comp::Pong());''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call new_alternative_syn",
			    '''this.doPongVoid(parameter => new Pong());''',
				'''
				this.doPongVoid(new model::Comp::Pong());''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Operation call Static",
			    '''Pong::staticIntegerOperation();''',
				'''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static_Assignment",
			    '''
				Integer a;
				a = Pong::staticIntegerOperation();''',
				'''
				PrimitiveTypes::Integer a = default;
				value{a} = model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static_Variable",
			    '''
				Integer a;
				Pong::StaticTestOperation(1, a);''',
				'''
				PrimitiveTypes::Integer a = default;
				model::Comp::Pong::StaticTestOperation(1, a);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static_Variable_Alternative_Syn",
			    '''
				Integer a;
				Pong::StaticTestOperation(outParameter => 1, inParameter => a);''',
				'''
				PrimitiveTypes::Integer a = default;
				model::Comp::Pong::StaticTestOperation(a, 1);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static Qualified name",
			    '''model::Comp::Pong::staticIntegerOperation();''',
				'''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static Class local name",
			    '''Pong::staticIntegerOperation();''',
				'''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Operation call Static without class",
			    '''staticIntegerOperation();''',
				'''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation"
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
				switch ((value{1} + value{1})) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch shift",
			    '''
				switch(1 >> 2){}''',
				'''
				switch (value{1} >> value{2}) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch bitwise or",
			    '''
				switch(1 | 2){}''',
				'''
				switch ((value{1} | value{2})) {
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
				switch (this->integerProperty) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch operation call",
			    '''
				switch(this.returnInteger()){}''',
				'''
				switch (this.returnInteger()) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Switch assignment",
			    '''
				Integer x = 0;
				switch(x=1){}''',
				'''
				PrimitiveTypes::Integer x = 0;
				switch (value{x} = 1) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Arithmetic inline",
			    '''
				Integer x = 1;
				(x + 1) * 2;''',
				'''
				PrimitiveTypes::Integer x = 1;
				(value{(value{x} + value{1})} * value{2});''',
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
			#[  "Flattened Assignment",
			    '''
			    Integer i;
			    this.doIntegerVoid(i = 1);''',
			    '''
				PrimitiveTypes::Integer i = default;
				this.doIntegerVoid(value{i} = 1);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Flattened Assignment_property",
			    '''
			    Integer i;
			    this.doIntegerVoid(this.integerProperty = 1);''',
			    '''
				PrimitiveTypes::Integer i = default;
				this.doIntegerVoid(this->integerProperty = 1);''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Not Flattened Shift",
			    '''1 >> 2;''',
			    '''value{1} >> value{2};''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Not Flattened Relational",
			    '''1 > 2;''',
			    '''(value{1} > value{2});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Not Flattened Equality",
			    '''1 == 2;''',
			    '''(value{1} == value{2});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Not Flattened Logical",
			    '''true && false;''',
			    '''(value{true} && value{false});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Not Flattened bitwise or",
			    '''1 & 2;''',
			    '''(value{1} & value{2});''',
				"model::Comp::Pong::TestOperation"
			],
			#[  "Flattened Conditional test",
			    '''
			    this.doIntegerVoid((true || false) ? 1 : 2);''',
			    '''
				this.doIntegerVoid(((value{(value{true} || value{false})}) ? (value{1}) : (value{2})));''',
				"model::Comp::Pong::TestOperation"
			]
		)
	}
}

