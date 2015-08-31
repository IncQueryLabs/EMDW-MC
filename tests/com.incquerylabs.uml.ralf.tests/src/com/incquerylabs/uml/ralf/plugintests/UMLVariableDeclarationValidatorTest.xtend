package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLVariableDeclarationValidatorTest extends AbstractPluginValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Local Variable: OK",
			    '''Pong x = new Pong();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Local Variable: Null",
			    '''Pong x = null;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			]
		)
	}
}