package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
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
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class SnippetFlattenerTest {
		
	@Inject
	IReducedAlfGenerator generator
	
	@Inject
	IReducedAlfParser parser
	
	@Inject
	ReducedAlfSnippetTemplateCompiler compiler
	
	ReducedAlfSnippetTemplateSerializer serializer = new ReducedAlfSnippetTemplateSerializer
	
	
	@Test
	def flattenerTest(){
		snippetCompilerTest('''{Integer x = 1+2+3;}''',
		'''
		PrimitiveTypes::Integer temp0 = 1;
		PrimitiveTypes::Integer temp1 = 2;
		PrimitiveTypes::Integer temp2 = temp0 + temp1;
		PrimitiveTypes::Integer temp3 = 3;
		PrimitiveTypes::Integer temp4 = temp2 + temp3;
		PrimitiveTypes::Integer x = temp4;''')
	}
	
	@Test
	def flattenerTest_Real(){
		snippetCompilerTest('''Real x = 1.1 * 2.2 *3.3;''',
		'''
		PrimitiveTypes::Real temp10 = 1.1;
		PrimitiveTypes::Real temp11 = 2.2;
		PrimitiveTypes::Real temp12 = temp10 * temp11;
		PrimitiveTypes::Real temp13 = 3.3;
		PrimitiveTypes::Real temp14 = temp12 * temp13;
		PrimitiveTypes::Real x = temp14;''')
	}
	
	@Test
	def flattenerTest_String(){
		snippetCompilerTest('''String x = "1.1" + "2.2" + "3.3";''',
		'''
		PrimitiveTypes::String temp15 = 1.1;
		PrimitiveTypes::String temp16 = 2.2;
		PrimitiveTypes::String temp17 = temp15 + temp16;
		PrimitiveTypes::String temp18 = 3.3;
		PrimitiveTypes::String temp19 = temp17 + temp18;
		PrimitiveTypes::String x = temp19;''')
	}
	
	@Test
	def flattenerTest_Mixed(){
		snippetCompilerTest('''Real x = 1 * 1.1 / 3;''',
		'''
		PrimitiveTypes::Integer temp5 = 1;
		PrimitiveTypes::Real temp6 = 1.1;
		PrimitiveTypes::Real temp7 = temp5 * temp6;
		PrimitiveTypes::Integer temp8 = 3;
		PrimitiveTypes::Real temp9 = temp7 / temp8;
		PrimitiveTypes::Real x = temp9;''')
	}


	
	def snippetCompilerTest(String input, String expected) {	
		val snippet = generator.createSnippet(input, parser,compiler)
		val serializedSnippet = serializer.serialize(snippet)
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
}

