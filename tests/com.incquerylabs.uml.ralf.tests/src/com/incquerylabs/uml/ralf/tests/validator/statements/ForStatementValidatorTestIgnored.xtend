package com.incquerylabs.uml.ralf.tests.validator.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("Unsupported syntax")
class ForStatementValidatorTestIgnored extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "ForStatement: Range Literal",
			    '''for(i in 1 .. 5){}''',
			    #[]
			],
			#[  "ForStatement: Range Literal No space",
			    '''for(i in 1..5){}''',
			    #[]
			],
			#[  "Invalid ForStatement: Range Real Literal",
			    '''for(i in 0 .. 1.1){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid ForStatement: Range Boolean Literal",
			    '''for(i in 0 .. true){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid ForStatement: Range String Literal",
			    '''for(i in 0 .. "1"){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "ForStatement: Range Multiplicative",
			    '''for(i in 1 .. 1*1){}''',
			    #[]
			],
			#[  "ForStatement: Range Additive",
			    '''for(i in 1 .. 1+1){}''',
			    #[]
			],
			#[  "ForStatement: Range Shift",
			    '''for(i in 0 .. 1>>1){}''',
			    #[]
			],
			#[  "InvalidPostfixExpression: Invalid variable type",
			    '''
				String x = "1";
				x++;''',
			    #[ReducedAlfSystem.POSTFIXEXPRESSION]
			],
			#[  "Invalid ForStatement: Range Relational",
			    '''for(i in 0 .. 1>2){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid ForStatement: Range Equality",
			    '''for(i in 0 .. 1==2){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "ForStatement: Range Bitwise OR",
			    '''for(i in 0 .. 1|1){}''',
			    #[]
			],
			#[  "ForStatement: Range Bitwise AND",
			    '''for(i in 0 .. 1&1){}''',
			    #[]
			],
			#[  "ForStatement: Range Bitwise XOR",
			    '''for(i in 0 .. 1^1){}''',
			    #[]
			],
			#[  "Invalid ForStatement: Range And",
			    '''for(i in 0 .. true && false){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid ForStatement: Range Or",
			    '''for(i in 0 .. true || false){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid ForStatement: Range Boolean unary",
			    '''for(i in 0 .. !true){}''',
			    #[ReducedAlfSystem.LOOPVARIABLE, ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "ForStatement: Range Bitwise XOR",
			    '''
				Integer x = 1;
				for(i in 0 .. x = 2){}''',
			    #[]
			],
			#[  "ForEach Statement: Definition after statement",
			    '''
				for(String i in {"1"}){
					i = "ASD";
				}
				String i = "1";''',
			    #[]
			]
		)
	}
}