package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class FilterExpressionValidator extends AbstractValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "FilterExpression: Integer",
			    '''sequence<Integer>{1,2,3}->filter(s : s < 1);''',
			    #[]
			],
			#[  "FilterExpression: Real",
			    '''sequence<Real>{1.1,2.2,3.3}->filter(s : s < 1.0);''',
			    #[]
			],
			#[  "FilterExpression: String",
			    '''sequence<String>{"1","2","3"}->filter(s : s == "2");''',
			    #[]
			],
			#[  "FilterExpression: Boolean",
			    '''sequence<Boolean>{true,false,true}->filter(s : s == true);''',
			    #[]
			],
			#[  "FilterExpression: Filter",
			    '''sequence<Boolean>{true,false,true}->filter(s : s == true)->filter(s : s == true);''',
			    #[]
			],
			#[  "InvalidFilterExpression: Invalid expression type",
			    '''sequence<Integer>{1,2,3}->filter(s : s + 1);''',
			    #[ReducedAlfSystem.FILTEREXPRESSION]
			]
		)
	}	
}