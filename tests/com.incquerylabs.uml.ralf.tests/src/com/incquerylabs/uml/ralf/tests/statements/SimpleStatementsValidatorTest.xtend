package com.incquerylabs.uml.ralf.tests.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class SimpleStatementsValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "EmptyStatement",
			    ''';''',
			    #[]
			],
			#[  "EmptyStatement: Comment",
			    '''/*Integer x = false*/;''',
			    #[]
			],
			#[  "ExpressionStatement: IntegerLiteral",
			    '''1;''',
			    #[]
			],
			#[  "ExpressionStatement: RealLiteral",
			    '''1.1;''',
			    #[]
			],
			#[  "ExpressionStatement: BooleanLiteral",
			    '''false;''',
			    #[]
			],
			#[  "ExpressionStatement: StringLiteral",
			    '''"1";''',
			    #[]
			],
			#[  "ExpressionStatement: Multiplication",
			    '''1*1;''',
			    #[]
			],
			#[  "ExpressionStatement: Addition",
			    '''1+1;''',
			    #[]
			],
			#[  "ExpressionStatement: Shift",
			    '''1>>1;''',
			    #[]
			],
			#[  "ExpressionStatement: Relation",
			    '''1>1;''',
			    #[]
			],
			#[  "ExpressionStatement: Equality",
			    '''1==1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseOR",
			    '''1|1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseAND",
			    '''1&1;''',
			    #[]
			],
			#[  "ExpressionStatement: BitwiseXOR",
			    '''1^1;''',
			    #[]
			],
			#[  "ExpressionStatement: ConditionalAND",
			    '''true && false;''',
			    #[]
			],
			#[  "ExpressionStatement: ConditionalOR",
			    '''true || false;''',
			    #[]
			],
			#[  "ExpressionStatement: BooleanUnary",
			    '''!true;''',
			    #[]
			],
			#[  "ExpressionStatement: Assignment",
			    '''
				Integer x = 1;
				x = 2;''',
			    #[]
			],
			#[  "BreakStatement: BreakSwitch",
			    '''
				Integer x =1;
				switch(x){
					case 1: break;
				}''',
			    #[]
			],
			#[  "BreakStatement: BreakSwitch2",
			    '''
				Integer x =1;
				switch(x){
					case 1: {break;}
				}''',
			    #[]
			],
			#[  "BreakStatement: While",
			    '''
				while(true){
					break;
				}''',
			    #[]
			],
			#[  "BreakStatement: Do...While",
			    '''
				do{
					break;
				}while(true);''',
			    #[]
			],
			#[  "BreakStatement: For",
			    '''
				for(Integer i in { 9 }){
					break;
				}''',
			    #[]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_Statements",
			    '''break;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_Block",
			    '''{break;}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidBreakStatement: InvalidBreak_in_If",
			    '''
				if(true){
					break;
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "ReturnStatement: void return",
			    '''return;''',
			    #[]
			],
			#[  "InvalidReturnStatement: IntegerLiteral",
			    '''return 1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: RealLiteral",
			    '''return 1.1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: BooleanLiteral",
			    '''return false;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: StringLiteral",
			    '''return "1";''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Multiplication",
			    '''return 1*1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Addition",
			    '''return 1+1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Shift",
			    '''return 1>>1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Relational",
			    '''return 1>1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Equality",
			    '''return 1==1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: BitwiseOR",
			    '''return 1|1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: BitwiseAND",
			    '''return 1&1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: BitwiseXOR",
			    '''return 1^1;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: ConditionalAND",
			    '''return true && false;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: ConditionalOR",
			    '''return true || false;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: BooleanUnary",
			    '''return !true;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidReturnStatement: Assignment",
			    '''
				Integer x = 1;
				return x = 2;''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			]
		)
	}
}