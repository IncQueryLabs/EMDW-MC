package com.incquerylabs.uml.ralf.transformation.test

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

// TODO: target object (second parameter) should be reviewed
// TODO: expected output (third parameter) should be reviewed
class TransitionGuardConvertingTest extends AbstractPluginTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Plug-In Test: Send signal using the 'this' object",
				//This example test case uses the model of the Ping-Pong example. 
				//It parses the action code describing a ping signal being sent to the "ping" attribute (association end) of the current object.
				"::model::Comp::Pong::e3",
				ConversionType.TransitionGuard,
				'''
				long __ralf__0__long = this->count;
				bool __ralf__1__bool = __ralf__0__long < 42;
				__ralf__1__bool;
				'''
			]
		)
	}
}

