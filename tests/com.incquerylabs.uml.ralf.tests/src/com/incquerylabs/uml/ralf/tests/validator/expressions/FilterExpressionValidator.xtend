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
			    '''Sequence<Integer>{1,2,3}.filter(s : s < 1);''',
			    #[]
			],
			#[  "FilterExpression: Real",
			    '''Sequence<Real>{1.1,2.2,3.3}.filter(s : s < 1.0);''',
			    #[]
			],
			#[  "FilterExpression: String",
			    '''Sequence<String>{"1","2","3"}.filter(s : s == "2");''',
			    #[]
			],
			#[  "FilterExpression: Boolean",
			    '''Sequence<Boolean>{true,false,true}.filter(s : s == true);''',
			    #[]
			],
			#[  "FilterExpression: Filter",
			    '''Sequence<Boolean>{true,false,true}.filter(s : s == true).filter(s : s == true);''',
			    #[]
			],
			#[  "InvalidFilterExpression: Invalid expression type",
			    '''Sequence<Integer>{1,2,3}.filter(s : s + 1);''',
			    #[ReducedAlfSystem.FILTEREXPRESSION]
			]
		)
	}	
}