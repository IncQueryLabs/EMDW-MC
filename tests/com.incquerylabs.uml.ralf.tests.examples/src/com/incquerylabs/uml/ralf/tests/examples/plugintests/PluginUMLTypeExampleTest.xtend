package com.incquerylabs.uml.ralf.tests.examples.plugintests

import com.google.inject.Injector
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.example.util.ReducedAlfLanguagePluginInjectorProvider
import com.incquerylabs.uml.ralf.tests.example.util.TestModelUMLContextProvider
import org.junit.Before
import org.junit.Test

import static org.junit.Assert.*

class PluginUMLTypeExampleTest {
	// Injector that creates the parser, the generator and the UML context provider
	Injector injector;
	IReducedAlfGenerator generator
	IReducedAlfParser parser
	//The UML context provider informs the parser about classes, types and signals defined in the UML model,
	//and the "this" object as well. (The object the action code under parsing belongs to.) 
	TestModelUMLContextProvider context
	
	@Before
	def void init() {
		// Get an injector instance from the provider defined by the user
		// In this provider, we can define that certain which interface is implemented by which class. 
		// If the specified interface is required, the injector will then create an instance of the specified class. 
		var provider = new ReducedAlfLanguagePluginInjectorProvider();
		injector = provider.injector
		generator = injector.getInstance(IReducedAlfGenerator)
		parser = injector.getInstance(IReducedAlfParser)
		context = injector.getInstance(TestModelUMLContextProvider)
	}
	
	@Test
	def sendSignalExampleTest(){
		//This example test case uses the model of the Ping-Pong example. 
		//It parses the action code describing a ping signal being sent to a new Pong object
		
		val input = '''
			Pong p = new Pong();
			ping_s s = new ping_s();
			send s to p->ping;'''
			
		val expected = '''
			model::Comp::Pong p = new model::Comp::Pong();
			model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
			p->ping->generate_event(s);'''
	
	    //Set context by adding an qualified name for a behavior
	    context.definedBehavior = "model::Comp::Pong::Pong_SM::Region1::s2::sendPong"
		//create AST
		val ast = parser.parse(input, context)
		//generate snippets
		val snippet = generator.createSnippet(ast)
		val serializer = new ReducedAlfSnippetTemplateSerializer
        val serializedSnippet = serializer.serialize(snippet)
		//compare results
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
	
	@Test
	def sendSignalExampleTest_This(){
		//This example test case uses the model of the Ping-Pong example. 
		//It parses the action code describing a ping signal being sent to the "ping" attribute (association end) of the current object.
		
		val input = '''
			send new ping_s() to this->ping;'''
			
		val expected = '''
			this->ping->generate_event(new model::Comp::Pong::ping_s());'''
		
		//As in this test case there is no editor attached to the UML model, the qualified name of the current type needs to be specified.
		//Hand the name of the current type to the context provider
		context.definedBehavior = "model::Comp::Pong::Pong_SM::Region1::s2::sendPong"
		
		//create AST
		val ast = parser.parse(input, context)
		//generate snippets
		val snippet = generator.createSnippet(ast)
		val serializer = new ReducedAlfSnippetTemplateSerializer
		val serializedSnippet = serializer.serialize(snippet)
		//compare results
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
}

