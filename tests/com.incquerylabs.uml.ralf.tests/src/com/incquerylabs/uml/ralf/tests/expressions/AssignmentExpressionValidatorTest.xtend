package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AssignmentExpressionValidatorTest extends AbstractValidatorTest{
			
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "AssignmentExpression: Integer variable",
			    '''
				Integer x = 1;
				x = 1;''',
			    #[]
			],
			#[  "AssignmentExpression: Boolean variable",
			    '''
				Boolean x = true;
				x = false;''',
			    #[]
			],
			#[  "AssignmentExpression: Real variable",
			    '''
				Real x = 1.1;
				x = 1.2;''',
			    #[]
			],
			#[  "AssignmentExpression: String variable",
			    '''
				String x = "";
				x = "2";''',
			    #[]
			],
			#[  "AssignmentExpression: 2 variables",
			    '''
				Integer x = 1;
				Integer y = 2;
				y = x;''',
			    #[]
			],
			#[  "InvalidAssignmentExpression: Invalid variable type",
			    '''
				String x = "1";
				Integer y = 2;
				y = x;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "AssignmentExpression: PostFix Increment",
			    '''
				Integer x = 1;
				Integer y = 1;
				y = x++;''',
			    #[]
			],
			#[  "AssignmentExpression: Prefix Increment",
			    '''
				Integer x = 1;
				Integer y = 1;
				y = ++x;''',
			    #[]
			],
			#[  "AssignmentExpression: Multiplication",
			    '''
				Integer x = 1;
				x = 1*1;''',
			    #[]
			],
			#[  "AssignmentExpression: Invalid result type",
			    '''
				Integer x = 1;
				x = 0.5 /1;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "AssignmentExpression: Addition",
			    '''
				Integer x = 1;
				x = 1+1;''',
			    #[]
			],
			#[  "AssignmentExpression: Shift",
			    '''
				Integer x = 1;
				x = 1>>1;''',
			    #[]
			],
			#[  "AssignmentExpression: Relational",
			    '''
				Boolean x = true;
				x = 1>1;''',
			    #[]
			],
			#[  "AssignmentExpression: Equality",
			    '''
				Boolean x = true;
				x = 1==1;''',
			    #[]
			],
			#[  "AssignmentExpression: Bitwise OR",
			    '''
				Integer x = 1;
				x = 1|1;''',
			    #[]
			],
			#[  "AssignmentExpression: Bitwise AND",
			    '''
				Integer x = 1;
				x = 1&1;''',
			    #[]
			],
			#[  "AssignmentExpression: Bitwise XOR",
			    '''
				Integer x = 1;
				x = 1^1;''',
			    #[]
			],
			#[  "AssignmentExpression: Conditional AND",
			    '''
				Boolean x = true;
				x = true && false;''',
			    #[]
			],
			#[  "AssignmentExpression: Conditional OR",
			    '''
				Boolean x = true;
				x = true || false;''',
			    #[]
			],
			#[  "AssignmentExpression: Conditional test",
			    '''
				Integer x = 1;
				x = (true) ? 2 : 3;''',
			    #[]
			],
			#[  "InvalidAssignmentExpression: Integer null",
			    '''
				Integer x = 1;
				x = null;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "InvalidAssignmentExpression: Real null",
			    '''
				Real x = 1.1;
				x = null;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "InvalidAssignmentExpression: String null",
			    '''
				String x = "1";
				x = null;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "InvalidAssignmentExpression: Boolean null",
			    '''
				Boolean x = true;
				x = null;''',
			    #[ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[
			    "InvalidAssignmentExpression: Integer Literal Assignment",
			    '''1 = 2;''',
			    #[ReducedAlfLanguageValidator.CODE_INVALID_LHS]
			],
			#[
			    "InvalidAssignmentExpression: String Literal Assignment",
			    '''"1" = "2";''',
			    #[ReducedAlfLanguageValidator.CODE_INVALID_LHS]
			],
			#[
			    "InvalidAssignmentExpression: Real Literal Assignment",
			    '''1.1 = 2.2;''',
			    #[ReducedAlfLanguageValidator.CODE_INVALID_LHS]
			],
			#[
			    "InvalidAssignmentExpression: Boolean Literal Assignment",
			    '''true = false;''',
			    #[ReducedAlfLanguageValidator.CODE_INVALID_LHS]
			],
			#[
			    "InvalidAssignmentExpression: Integer Literal Assignment",
			    '''1 = 2;''',
			    #[ReducedAlfLanguageValidator.CODE_INVALID_LHS]
			]
		)
	}			
}