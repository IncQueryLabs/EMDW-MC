package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class PostfixExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "PostfixExpression: Integer variable",
			    '''
				Integer x = 1;
				x++;''',
			    #[]
			],
			#[  "InvalidPostfixExpression: Invalid variable type",
			    '''
				String x = "1";
				x++;''',
			    #[ReducedAlfSystem.POSTFIXEXPRESSION]
			]
		)
	}
}