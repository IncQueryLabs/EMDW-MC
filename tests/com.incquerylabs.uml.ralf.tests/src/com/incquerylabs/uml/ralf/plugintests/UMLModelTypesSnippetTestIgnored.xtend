package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("These features are not yet functioning")
class UMLModelTypesSnippetTestIgnored extends AbstractPluginSnippetTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Cast test",
			    '''
				Pong p = new Pong;
				Pong q = (Pong) p;''',
				
				'''''',
				"model::Comp::Pong::doIntegerVoid"
			]
		)
	}	
}

