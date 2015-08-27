package com.incquerylabs.uml.ralf.tests.examples.plugintests

import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.reducedAlfLanguage.SendSignalStatement
import com.incquerylabs.uml.ralf.tests.example.util.AbstractPluginTest
import com.incquerylabs.uml.ralf.tests.example.util.TestModelUMLContextProvider
import java.util.Collection
import org.eclipse.uml2.uml.UMLPackage
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

import static org.junit.Assert.assertEquals

class PluginThisExampleTest extends AbstractPluginTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Plug-In Test: Send signal using the 'this' object",
				//This example test case uses the model of the Ping-Pong example. 
				//It parses the action code describing a ping signal being sent to the "ping" attribute (association end) of the current object.
			    '''send new ping_s() to this->ping;''',
				'''this->ping->generate_event(new model::Comp::Pong::ping_s());''',
				//As in this test case there is no editor attached to the UML model, the qualified name of the current operation needs to be specified.
				//Hand the name of the current type to the context provider
				"model::Comp::Pong::doIntegerVoid"
			]
		)
	}
	
	@Test
	def void testType() {
	           //Initiate components
        val parser = new ReducedAlfParser
        val context =  new TestModelUMLContextProvider("/com.incquerylabs.uml.ralf.tests.examples/model/model.uml");
        val result = parser.parse(input, context)
        val signalExpression = (result.model.statement.get(0) as SendSignalStatement).signal
        // The typesystem can calculate the type of any expression
        // The returned result might hold information about type errors
        // Finally, an internal IUMLTypeReference is used to be able to store extra information, e.g. about collections
        val signalType = result.typeSystem.type(signalExpression).value.umlType
        assertEquals("ping_s", signalType.name)
	}
}

