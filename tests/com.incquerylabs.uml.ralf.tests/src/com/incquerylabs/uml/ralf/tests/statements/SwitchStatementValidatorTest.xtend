package com.incquerylabs.uml.ralf.tests.statements

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class SwitchStatementValidatorTest extends AbstractValidatorTest{	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "SwitchExpression: IntegerLiteral",
			    '''
				switch(1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "InvalidSwitchExpression: RealLiteral",
			    '''
				switch(1.1){
					case 1.1 : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidSwitchExpression: BooleanLiteral",
			    '''
				switch(true){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "SwitchExpression: StringLiteral",
			    '''
				switch("1"){
					case "1" : {}
					default : {}
				}''',
			    #[]
			],
			#[  "InvalidSwitchExpression: InvalidType_Literal",
			    '''
				switch("1"){
					case 1 : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.EXPRESSIONASSIGNABLETOTYPE]
			],
			#[  "SwitchExpression: Integer variable",
			    '''
				String x = "";
				switch(x){
					case "1" : { break;}
					default : {}
				}''',
			    #[]
			],
			#[  "SwitchExpression: Multiplication",
			    '''
				switch(1*1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "InvalidSwitchExpression: Division",
			    '''
				switch(0.75 / 1){
					case 1 : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "SwitchExpression: shift",
			    '''
				switch(1>>1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "InvalidSwitchExpression: Relational",
			    '''
				switch(1>1){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidSwitchExpression: Equality",
			    '''
				switch(1==1){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "SwitchExpression: BitwiseOR",
			    '''
				switch(1|1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "SwitchExpression: BitwiseAnd",
			    '''
				switch(1&1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "SwitchExpression: BitwiseXOR",
			    '''
				switch(1^1){
					case 1 : {}
					default : {}
				}''',
			    #[]
			],
			#[  "InvalidSwitchExpression: ConditionalAND",
			    '''
				switch(true && false){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidSwitchExpression: ConditionalOR",
			    '''
				switch(true || false){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "InvalidSwitchExpression: BooleanUnary",
			    '''
				switch(!true){
					case true : {}
					default : {}
				}''',
			    #[ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING]
			],
			#[  "SwitchExpression: Assignment",
			    '''
				Integer x = 1;
				switch(x = 2){
					case 2 : {}
					default : {}
				}''',
			    #[]
			]
		)
	}	
}