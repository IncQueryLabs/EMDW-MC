package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore
class UMLVariableDeclarationValidatorTestIgnored extends AbstractPluginValidatorTest{
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Invalid Local Variable: Trying to send null",
			    '''
				Pong p = null;
				ping_s s = new ping_s();
				send s to p->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.NULLSUBTYPING]
			],
			#[  "Invalid Local Variable: Trying to send null using this",
			    '''
				ping_s s = null;
				send s to this->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.NULLSUBTYPING]
			]
		)
	}
}