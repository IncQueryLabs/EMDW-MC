package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.uml.ralf.api.ISnippetManager
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
class PrimitiveTypesSnippetTest {
		
	@Inject
	ISnippetManager manager
	
	
	@Test
	def numericUnaryExpressionTest(){
		snippetCompilerTest('''-4;''', '''-4;''')
	}
	
	@Test
	def booleanUnaryExpressionTest(){
		snippetCompilerTest('''!true;''', '''!true;''')
	}
	
	@Test
	def arithmeticExpressionTest(){
		snippetCompilerTest('''(1 + 1) * 2;''', '''(1 + 1) * 2;''')
	}
	
	@Test
	def arithmeticExpressionTest_UnnecessaryParentheses(){
		snippetCompilerTest('''(1 * 1) + 2;''', '''1 * 1 + 2;''')
	}
	
	@Test
	def variableDefinitionTest(){
		snippetCompilerTest('''Integer x = 1;''', '''PrimitiveTypes::Integer x = 1;''')
	}
	
	@Test
	def variableDefinitionTest_AffixIncrement(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			++x;'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			++x;''')
	}
	
	@Test
	def variableDefinitionTest_Complex(){
		snippetCompilerTest(
		'''
			Integer x = (1 + 2) * 3 + 4;
			++x;
			if (x > 3) {
				x--;
			} else {
				x++;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = (1 + 2) * 3 + 4;
			++x;
			if (x > 3) {
				x--;
			} else {
				x++;
			}''')
	}
	
	@Test
	def variableDefinitionTest_Complex2(){
		snippetCompilerTest(
		'''
			Integer x = (1 + 2) * 3 + 4;
			++x;
			if (x > -3) {
				x--;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = (1 + 2) * 3 + 4;
			++x;
			if (x > -3) {
				x--;
			}''')
	}
	
	@Test
	def variableDefinitionTest_Complex3(){
		snippetCompilerTest(
		'''
			Integer x = (1 + 2) * 3 + -4;
			++x;
			Integer y = x;
			y = x - 15;
			if ((x > 3) && !(y < -5)) {
				x--;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = (1 + 2) * 3 + -4;
			++x;
			PrimitiveTypes::Integer y = x;
			y = x - 15;
			if ((x > 3) && !(y < -5)) {
				x--;
			}''')
	}
	
	@Test
	def BlockTest_AffixIncrement(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			++x;'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			++x;''')
	}
	
	def snippetCompilerTest(String input, String expected) {	
		val snippet = manager.getSnippet(input)
		assertEquals("The created snippet does not match the expected result",expected,snippet)
	}
}

