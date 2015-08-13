package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguagePluginInjectorProvider
import com.incquerylabs.uml.ralf.tests.util.TestModelUMLContextProvider
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Ignore
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
	@Inject
	ReducedAlfSnippetTemplateCompiler compiler
	
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
	
	@Test
	def NullTest(){
		snippetCompilerTest(
		'''
			Pong p = null;
			p = new Pong();
			ping_s s = new ping_s();
			send s to p->ping;'''
		, 
		'''
			model::Comp::Pong p = 0;
			p = new model::Comp::Pong();
			model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
			p->ping->generate_event(s);''')
	}
	
	@Test
	@Ignore("TODO: FILTER")
	def FilterTest(){
		snippetCompilerTest(
		'''
			Integer x = 
			'''
		, 
		'''
			model::Comp::Pong p = 0;
			p = new model::Comp::Pong();
			model::Comp::Pong::ping_s s = new model::Comp::Pong::ping_s();
			p->ping->generate_event(s);''')
	}
	
	@Test
	@Ignore("Casting not yet supported")
	def CastTest(){
		snippetCompilerTest(
		'''
			Pong p = new Pong;
			Pong q = (Pong) p'''
		, 
		'''
			model::Comp::Pong p = new model::Comp::Pong();
			model::Comp::Pong q = (model::Comp::Pong) p;''')
	}
	
	@Test
	@Ignore("Property assignments do not work properly at this point")
	def PropertyAssignmentTest(){
		snippetCompilerTest(
		'''
			Integer i = 1;
			i = 2;
			Pong p = new Pong();
			p.integerProperty = 1;'''
		, 
		'''
			PrimitiveTypes::Integer i = 1;
			i = 2;
			model::Comp::Pong p = new model::Comp::Pong();
			p->integerProperty = 1;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	@Ignore("Property assignments do not work properly at this point")
	def PropertyAssignmentTest1(){
		snippetCompilerTest(
		'''
			Integer i = 1;
			i = 2;
			Pong p = new Pong();
			Pong q = new Pong();
			p = q;
			p.integerProperty = 1;'''
		, 
		'''
			PrimitiveTypes::Integer i = 1;
			i = 2;
			model::Comp::Pong p = new model::Comp::Pong();
			model::Comp::Pong q = new model::Comp::Pong();
			p = q;
			p->integerProperty = 1;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	@Ignore("Not supported at this time")
	def operationIntegerParameterLiteral(){
		snippetCompilerTest(
		'''
			this.doIntegerVoid(1);'''
		,
		'''
		'''
		,
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	@Ignore("Not supported at this time")
	def operationIntegerParameterVariable(){
		snippetCompilerTest(
		'''
			Integer x = 2;
			this.doIntegerVoid(x);'''
		,
		''''''
		,
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	@Ignore("Not supported at this time")
	def operationIntegerParameterVariable_AltSyntax(){
		snippetCompilerTest(
		'''
			Integer x = 2;
			this.doIntegerVoid(parameter => x);
		'''
		,
		''''''
		,
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	@Ignore("Not supported at this time")
	def inParameterIntegerAssignment(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			x = inParameter;'''
		,
		''''''
		,
		"model::Comp::Pong::TestOperation")
	}
	
	@Test
	@Ignore("Not supported at this time")
	def outParameterIntegerAssignment_Literal(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			outParameter = x;'''
		,
		''''''
		,
		"model::Comp::Pong::TestOperation")
	}
	
	def snippetCompilerTest(String input, String expected, String thisElementFQN) {	
		context.definedOperation = thisElementFQN
		
		val snippet = generator.createSnippet(input, context, parser, compiler)
		val serializedSnippet = serializer.serialize(snippet)	
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
	
	def snippetCompilerTest(String input, String expected) {
		val snippet = generator.createSnippet(input, context, parser, compiler)
		val serializedSnippet = serializer.serialize(snippet)	
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
	

}

