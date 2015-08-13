package com.incquerylabs.uml.ralf.tests.examples.plugintests

import com.incquerylabs.uml.ralf.tests.example.util.AbstractPluginTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class PluginUMLTypeExampleTest extends AbstractPluginTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Plug-In Test: Send signal using a new Pong instance",
				//This example test case uses the model of the Ping-Pong example. 
				//It parses the action code describing a ping signal being sent to a new Pong object
			    '''
				Pong p = new Pong();
				ping_s s = new ping_s();
				send s to p->ping;''',
				'''
				model::Comp::Pong p = new model::Comp::Pong();
				model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
				p->ping->generate_event(s);''',
				""
			]
		)
	}
}

