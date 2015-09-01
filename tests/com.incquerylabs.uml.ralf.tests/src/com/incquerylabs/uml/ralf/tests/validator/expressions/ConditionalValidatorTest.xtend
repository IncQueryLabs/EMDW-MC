package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class ConditionalValidatorTest extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "AndExpression: Multiple",
			    '''false && true && true;''',
			    #[]
			],
			#[  "AndExpression: Boolean literal",
			    '''false && true;''',
			    #[]
			],
			#[  "AndExpression: Relation parenthesis",
			    '''true && (2>3);''',
			    #[]
			],
			#[  "AndExpression: Relation",
			    '''true && 2>3;''',
			    #[]
			],
			#[  "AndExpression: Boolean variable",
			    '''
				Boolean x = true;
				x && false;''',
			    #[]
			],
			#[  "AndExpression: 2 Boolean variables",
			    '''
				Boolean x = true;
				Boolean y = true;
				x && y;''',
			    #[]
			],
			#[  "InvalidAndExpression: Invalid variable type",
			    '''true && -2;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			],
			#[  "InvalidAndExpression: Invalid variable type",
			    '''true && 2*3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidAndExpression: Invalid variable type",
			    '''true && 2+3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidAndExpression: Invalid variable type",
			    '''true && 2>>3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidAndExpression: Invalid variable type",
			    '''1 && 2;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			],
			#[  "OrExpression: Multiple",
			    '''false || true || true;''',
			    #[]
			],
			#[  "OrExpression: Boolean literal",
			    '''false || true;''',
			    #[]
			],
			#[  "OrExpression: Relation parenthesis",
			    '''true || (2>3);''',
			    #[]
			],
			#[  "OrExpression: Relation",
			    '''true || 2>3;''',
			    #[]
			],
			#[  "OrExpression: Boolean variable",
			    '''
				Boolean x = true;
				x || false;''',
			    #[]
			],
			#[  "OrExpression: 2 Boolean variables",
			    '''
				Boolean x = true;
				Boolean y = true;
				x || y;''',
			    #[]
			],
			#[  "OrExpression: And expression",
			    '''true || true && false;''',
			    #[]
			],
			#[  "InvalidOrExpression: Invalid variable type",
			    '''true || -2;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			],
			#[  "InvalidOrExpression: Invalid variable type",
			    '''true || 2*3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidOrExpression: Invalid variable type",
			    '''true || 2+3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidOrExpression: Invalid variable type",
			    '''true || 2>>3;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			]
			,
			#[  "InvalidOrExpression: Invalid variable type",
			    '''1 || 2;''',
			    #[ReducedAlfSystem.CONDITIONALLOGICALEXPRESSION]
			],
			#[  "ConditionalTestExpression: Integer literal",
			    '''(true) ? 1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Boolean literal",
			    '''(true) ? true : false;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Real literal",
			    '''(true) ? 1.1 : 2.1;''',
			    #[]
			],
			#[  "ConditionalTestExpression: String literal",
			    '''(true) ? "1" : "2";''',
			    #[]
			],
			#[  "ConditionalTestExpression: PostFix increment",
			    '''
				Integer x = 1;
				(true) ? x++ : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Prefix increment",
			    '''
				Integer x = 1;
				(true) ? ++x : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Multiplication",
			    '''(true) ? 1*1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Addition",
			    '''(true) ? 1+1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Shift",
			    '''(true) ? 1>>1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Conditional",
			    '''(true) ? 1>1 : true;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Equality",
			    '''(true) ? 1==1 : true;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Bitwise OR",
			    '''(true) ? 1|1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Bitwise AND",
			    '''(true) ? 1&1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Bitwise XOR",
			    '''(true) ? 1^1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Conditional AND",
			    '''(true) ? true && false : true;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Conditional OR",
			    '''(true) ? true || false : true;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Conditional test",
			    '''(true) ? (true) ? true : false : true;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Condition: Boolean unary",
			    '''(!true) ? 1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Condition: relational",
			    '''(1>2) ? 1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Condition: equality",
			    '''(2==1) ? 1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Condition: And expression",
			    '''(true && false) ? 1 : 2;''',
			    #[]
			],
			#[  "ConditionalTestExpression: Condition: or expression",
			    '''(true || false) ? 1 : 2;''',
			    #[]
			],
			#[  "InvalidConditionalTestExpression: Condition: Integer literal",
			    '''(1) ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			],
			#[  "InvalidConditionalTestExpression: Condition: String literal",
			    '''("1") ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			],
			#[  "InvalidConditionalTestExpression: Condition: Postfix increment",
			    '''
				Integer x = 1;
				(x++) ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			],
			#[  "InvalidConditionalTestExpression: Condition: Prefix increment",
			    '''
				Integer x = 1;
				(++x) ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			],
			#[  "InvalidConditionalTestExpression: Condition: addition",
			    '''(1+2) ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			],
			#[  "InvalidConditionalTestExpression: Condition: shift expression",
			    '''(1>>2) ? 1 : 2;''',
			    #[ReducedAlfSystem.CONDITIONALTESTEXPRESSION]
			]
		)
	}
}
	