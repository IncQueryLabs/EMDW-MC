package com.incquerylabs.uml.ralf.tests

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
class SnippetFlattenerPluginTest {
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
	def PropertyAccess(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			Integer x;
			x = p.integerProperty ;'''
		, 
		'''
		model::Comp::Pong temp0 = new model::Comp::Pong();
		model::Comp::Pong p = temp0;
		PrimitiveTypes::Integer x;
		PrimitiveTypes::Integer temp1 = p->integerProperty;
		x = temp1;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	def PropertyAccess2(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			Integer x = p.integerProperty ;'''
		, 
		'''
		model::Comp::Pong temp2 = new model::Comp::Pong();
		model::Comp::Pong p = temp2;
		PrimitiveTypes::Integer temp3 = p->integerProperty;
		PrimitiveTypes::Integer x = temp3;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	def PropertyAccess3(){
		snippetCompilerTest(
		'''
			Ping p = new Ping();
			Integer x = p->pong.integerProperty ;'''
		, 
		'''
		model::Comp::Ping temp4 = new model::Comp::Ping();
		model::Comp::Ping p = temp4;
		model::Comp::Pong temp5 = p->pong;
		PrimitiveTypes::Integer temp6 = temp5->integerProperty;
		PrimitiveTypes::Integer x = temp6;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	def PropertyAccess_This(){
		snippetCompilerTest(
		'''
			Integer x = this.integerProperty;'''
		, 
		'''
		PrimitiveTypes::Integer temp7 = this->integerProperty;
		PrimitiveTypes::Integer x = temp7;'''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	@Ignore("Property write does not work at this point")
	def PropertyWrite(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			p.integerProperty = 1;'''
		, 
		''''''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	@Ignore("Property write does not work at this point")
	def PropertyWrite_This(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			this.integerProperty = 1;'''
		, 
		''''''
		,
		"model::Comp::Pong::doIntegerVoid")
	}
	
	@Test
	def OperationCall(){
		snippetCompilerTest(
		'''
			Pong p = new Pong();
			Integer x;
			x = p.integerProperty ;'''
		, 
		'''
		model::Comp::Pong temp0 = new model::Comp::Pong();
		model::Comp::Pong p = temp0;
		PrimitiveTypes::Integer x;
		PrimitiveTypes::Integer temp1 = p->integerProperty;
		x = temp1;'''
		,
		"model::Comp::Pong::doIntegerVoid")
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

