package com.incquerylabs.uml.ralf.tests.validator.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class ForStatementValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
		    #[
		        "ForEach Statement: Missing type parameter for declaration",
		        '''for(i in {1, 2, 3}){}''',
		        #[]
		    ],
			#[  "ForEach Statement: Integer literal",
			    '''for(Integer i in 5){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Real literal",
			    '''for(Integer i in 1.1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Boolean literal",
			    '''for(Integer i in true){}''',
			    #["null"]
			],
			#[  "ForEach Statement: String literal",
			    '''for(Integer i in "1"){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Literal collection",
			    '''for(String i in {"1"}){}''',
			    #[]
			],
			#[  "ForEach Statement: String collection",
			    '''
				for(String i in {"1"}){
					i = "ASD";
				}''',
			    #[]
			],
			#[  "ForEach Statement: Definition before statement",
			    '''
				String i = "1";
				for(String i in {"1"}){
					i = "ASD";
				}''',
			    #["null"]
			],
			#[  "ForEach Statement: Multiplicative",
			    '''for(Integer i in 1*1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Additive",
			    '''for(Integer i in 1+1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Shift",
			    '''for(Integer i in 1 >> 1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Relational",
			    '''for(Integer i in 1*1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Equality",
			    '''for(Integer i in 1==1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Bitwise OR",
			    '''for(Integer i in 1|1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Bitwise AND",
			    '''for(Integer i in 1&1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Bitwise XOR",
			    '''for(Integer i in 1^1){}''',
			    #["null"]
			],
			#[  "ForEach Statement: AND",
			    '''for(Integer i in true && false){}''',
			    #["null"]
			],
			#[  "ForEach Statement: OR",
			    '''for(Integer i in true || false){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Boolean unary",
			    '''for(Integer i in !true){}''',
			    #["null"]
			],
			#[  "ForEach Statement: Assignment",
			    '''
			    Integer x = 1;
			    for(Integer i in x=2){}''',
			    #["null"]
			],
			#[  "For Statement: simple",
			    '''for (Integer i = 0; i < 5; i++) {}''',
			    #[]
			],
			#[  "For Statement: predefined loop variable",
			    '''
				Integer i = 0;
				for (; i < 5; i++) {}''',
			    #[]
			],
			#[  "For Statement: infinite loop",
			    '''for (; true; ) {}''',
			    #[]
			],
			#[  "For Statement: no loop",
			    '''for (; false; ) {}''',
			    #[]
			],
			#[  "For Statement: invalid condition",
			    '''for (Integer i = 0; i; i++) {}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			]
		)
	}
}