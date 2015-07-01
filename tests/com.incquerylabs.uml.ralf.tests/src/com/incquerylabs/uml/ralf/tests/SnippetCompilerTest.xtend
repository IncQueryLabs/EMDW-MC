package com.incquerylabs.uml.ralf.tests

import com.google.inject.Injector
import com.incquerylabs.uml.ralf.api.impl.SnippetManagerImpl
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*
import com.google.inject.Module
import com.google.inject.Binder
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetCompiler

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class SnippetCompilerTest {
		
	Injector injector
	
	//TODO: more test cases
	
	@Inject
	def setInjector(Injector injector){
		this.injector = injector.createChildInjector(new Module{
			
			override configure(Binder binder) {
				binder.bind(ReducedAlfSnippetCompiler).toInstance(new ReducedAlfSnippetCompiler())
			}
			
		})
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
		snippetCompilerTest('''Integer x = 1;''', '''Integer x = 1;''')
	}
	
	@Test
	def variableDefinitionTest_AffixIncrement(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			++x;'''
		, 
		'''
			Integer x = 1;
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
			Integer x = (1 + 2) * 3 + 4;
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
			if (x > 3) {
				x--;
			}'''
		, 
		'''
			Integer x = (1 + 2) * 3 + 4;
			++x;
			if (x > 3) {
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
			if ((x > 3) && !(y < 5)) {
				x--;
			}'''
		, 
		'''
			Integer x = (1 + 2) * 3 + -4;
			++x;
			Integer y = x;
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
			Integer x = 1;
			++x;''')
	}
	
	def snippetCompilerTest(String input, String expected) {	
		val manager = new SnippetManagerImpl;
		injector.injectMembers(manager);
		val snippet = manager.getSnippet(input)
		assertEquals("The created snippet does not match the expected result",expected,snippet)
	}
}

