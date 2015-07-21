package com.incquerylabs.uml.ralf.tests.examples.junittests

import com.google.inject.Injector
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class JUnitPrimitiveTypeExampleTest {
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
		val input = '''
		Integer x = (1 + 2) * 3 + -4;
		++x;
		Integer y = x;
		y = x - 15;
		if ((x > 3) && !(y < -5)) {
			x--;
		}'''
		
		val expected = '''
		PrimitiveTypes::Integer x = (1 + 2) * 3 + -4;
		++x;
		PrimitiveTypes::Integer y = x;
		y = x - 15;
		if ((x > 3) && !(y < -5)) {
			x--;
		}'''
		
		//create AST
		val ast = parser.parse(input)
		//generate snippet from AST
		val serializer = new ReducedAlfSnippetTemplateSerializer
		val snippet = generator.createSnippet(ast)
		val serializedSnippet = serializer.compile(snippet)
		assertEquals("The created snippet does not match the expected result", expected, serializedSnippet)
	}
}

