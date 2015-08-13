package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class AffixExpressionValidatorTest extends AbstractValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "AffixExpression: Integer variable",
			    '''
				Integer x = 1;
				++x;''',
			    #[]
			],
			#[  "InvalidAffixExpression: Invalid variable type",
			    '''
				String x = "1";
				++x;''',
			    #[ReducedAlfSystem.PREFIXEXPRESSION]
			]
		)
	}
	

}