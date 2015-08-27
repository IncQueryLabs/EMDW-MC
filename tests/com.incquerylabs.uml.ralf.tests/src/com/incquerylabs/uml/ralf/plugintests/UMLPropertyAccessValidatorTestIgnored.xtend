package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("These features are not yet supported.")
class UMLPropertyAccessValidatorTestIgnored extends AbstractPluginValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Property Access: Integer_This_Short",
			    '''
			    Integer a;
			    a = integerProperty;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Property Access: static property",
			    '''
			    Pong::staticIntegerProperty;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			]
		)
	}
}