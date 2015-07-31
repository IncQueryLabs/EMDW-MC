package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguagePluginInjectorProvider
import com.incquerylabs.uml.ralf.tests.util.TestModelUMLContextProvider
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguagePluginInjectorProvider))
class UMLModelTypesSnippetTest {
	@Inject
	IReducedAlfGenerator generator
	@Inject
	IReducedAlfParser parser
	@Inject
	TestModelUMLContextProvider context
	
	ReducedAlfSnippetTemplateSerializer serializer = new ReducedAlfSnippetTemplateSerializer
		
	@Test
	def PongTest(){
		snippetCompilerTest(
		'''Pong x = new Pong();'''
		, 
		'''model::Comp::Pong x = new model::Comp::Pong();''')
	}
	
	@Test
	def SendSignalTest(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			ping_s s = new ping_s();
			send s to p->ping;'''
		, 
		'''
			model::Comp::Pong p = new model::Comp::Pong();
			model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
			p->ping->generate_event(s);''')
	}
	
	@Test
	def SendSignalTest2(){
		snippetCompilerTest(
		'''
			send new ping_s() to this->ping;'''
		, 
		'''
			this->ping->generate_event(new model::Comp::Pong::ping_s());'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	

	def snippetCompilerTest(String input, String expected, String thisElementFQN) {	
		context.definedOperation = thisElementFQN
		
		val snippet = generator.createSnippet(input, context, parser)
		val serializedSnippet = serializer.serialize(snippet)	
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
	
	def snippetCompilerTest(String input, String expected) {
		val snippet = generator.createSnippet(input, context, parser)
		val serializedSnippet = serializer.serialize(snippet)	
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
}

