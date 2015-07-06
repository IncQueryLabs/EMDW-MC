package com.incquerylabs.uml.ralf.tests.example

import com.google.inject.Injector
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class ExampleTest {
	// Injector that creates the parser and the generator
	Injector injector;
	IReducedAlfGenerator generator
	IReducedAlfParser parser

	@Before
	def void init() {
		// Get an injector instance from the provider defined by the user
		// In this provider, we can define that certain which interface is implemented by which class. 
		// If the specified interface is required, the injector will then create an instance of the specified class. 
		var provider = new ReducedAlfLanguageJUnitInjectorProvider();
		injector = provider.injector
		generator = injector.getInstance(IReducedAlfGenerator)
		parser = injector.getInstance(IReducedAlfParser)

	}

	@Test
	def exampleTestCase() {
		snippetCompilerTest(
		'''
		Integer x = (1 + 2) * 3 + -4;
		++x;
		Integer y = x;
		y = x - 15;
		if ((x > 3) && !(y < -5)) {
			x--;
		}''', '''
		PrimitiveTypes::Integer x = (1 + 2) * 3 + -4;
		++x;
		PrimitiveTypes::Integer y = x;
		y = x - 15;
		if ((x > 3) && !(y < -5)) {
			x--;
		}''')
	}

	def snippetCompilerTest(String input, String expected) {
		//the usage of the generator can be seen here.
		val snippet = generator.createSnippet(input, parser)
		assertEquals("The created snippet does not match the expected result", expected, snippet)
	}
}

