package com.incquerylabs.uml.ralf.tests.validator.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class WhileStatementValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Invalid While Statement: IntegerLiteral",
			    '''while(1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: RealLiteral",
			    '''while(1.1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "While Statement: BoolLiteral",
			    '''while(true){}''',
			    #[]
			],
			#[  "Invalid While Statement: StringLiteral",
			    '''while("1"){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: Multiplicative",
			    '''while(1*1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: Additive",
			    '''while(1+1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: Shift",
			    '''while(1>>1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "While Statement: Relational",
			    '''while(1>1){}''',
			    #[]
			],
			#[  "While Statement: Equality",
			    '''while(1==1){}''',
			    #[]
			],
			#[  "Invalid While Statement: Bitwise OR",
			    '''while(1|1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: Bitwise AND",
			    '''while(1&1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid While Statement: Bitwise XOR",
			    '''while(1^1){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "While Statement: Logical AND",
			    '''while(true && false){}''',
			    #[]
			],
			#[  "While Statement: Logical OR",
			    '''while(true || false){}''',
			    #[]
			],
			#[  "While Statement: Boolean Unary",
			    '''while(!false){}''',
			    #[]
			],
			#[  "Invalid While Statement: Assignment",
			    '''
			    Integer x = 1;
			    while(x = 2){}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			
			#[  "Invalid Do Statement: IntegerLiteral",
			    '''do{}while(1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: RealLiteral",
			    '''do{}while(1.1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Do Statement: BoolLiteral",
			    '''do{}while(true);''',
			    #[]
			],
			#[  "Invalid Do Statement: StringLiteral",
			    '''do{}while("1");''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: Multiplicative",
			    '''do{}while(1*1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: Additive",
			    '''do{}while(1+1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: Shift",
			    '''do{}while(1>>1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Do Statement: Relational",
			    '''do{}while(1>1);''',
			    #[]
			],
			#[  "Do Statement: Equality",
			    '''do{}while(1==1);''',
			    #[]
			],
			#[  "Do While Statement: Bitwise OR",
			    '''do{}while(1|1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: Bitwise AND",
			    '''do{}while(1&1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Invalid Do Statement: Bitwise XOR",
			    '''do{}while(1^1);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "Do Statement: Logical AND",
			    '''do{}while(true && false);''',
			    #[]
			],
			#[  "Do Statement: Logical OR",
			    '''do{}while(true || false);''',
			    #[]
			],
			#[  "Do Statement: Boolean Unary",
			    '''do{}while(!false);''',
			    #[]
			],
			#[  "Invalid Do Statement: Assignment",
			    '''
			    Integer x = 1;
			    do{}while(x = 2);''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			]
		)
	}
}