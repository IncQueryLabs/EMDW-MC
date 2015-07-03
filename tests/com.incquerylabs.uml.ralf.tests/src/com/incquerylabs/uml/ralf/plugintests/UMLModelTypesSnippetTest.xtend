package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.api.ISnippetManager
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguagePluginInjectorProvider
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
	ISnippetManager manager
		
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
			send s => p.ping;'''
		, 
		'''
			model::Comp::Pong p = new model::Comp::Pong();
			model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
			p.ping->generate_event(s);''')
	}
	

	def snippetCompilerTest(String input, String expected) {	
		val snippet = manager.getSnippet(input)
		assertEquals("The created snippet does not match the expected result",expected,snippet)
	}
}

