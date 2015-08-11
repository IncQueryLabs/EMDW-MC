package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.IReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import javax.inject.Inject
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

import static org.junit.Assert.*
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class PrimitiveTypesSnippetTest {
		
	@Inject
	IReducedAlfGenerator generator
	
	@Inject
	IReducedAlfParser parser
	
	@Inject
	ReducedAlfSnippetTemplateCompiler compiler
	
	ReducedAlfSnippetTemplateSerializer serializer = new ReducedAlfSnippetTemplateSerializer
	
	
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
	
	@Test
	def SwitchTest(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			switch (x){
				case 1 : x++; break;
				default : x++;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			switch (x) {
			case 1 : {
			x++;
			break;
			}
			default : {
			x++;
			}
			}''')
	}
	
	@Test
	def DoWhileTest(){
		snippetCompilerTest(
		'''
			Integer x = 1;	
			do{
				x++;
			} while (true);'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			do {
			x++;
			}while (true);''')
	}
	
	@Test
	def WhileTest(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			while (true) {
				x++;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			while (true) {
			x++;
			}''')
	}
	
	@Test
	def ForTest(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			for (Integer i = 0; i < 5; i++) {
				x++; 
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			for (PrimitiveTypes::Integer i = 0; i < 5; i++) {
			x++;
			}''')
	}
	
	@Test
	def IfTest_IfElse(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			if(true){
				x++;
			}
			else if (false){
				x++;
			}else if (true){
				x++;
			}else{
				x++;
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			if (true) {
			x++;
			} else if (false) {
			x++;
			} else if (true) {
			x++;
			} else {
			x++;
			}''')
	}
	
	@Test
	def IfTest_Nested(){
		snippetCompilerTest(
		'''
			Integer x = 1;
			if(true){
				x++;
			}else {
				if(false){
					x++;
				}else{
					if(true){
						x++;
					}
					else{
						x++;
					}
				}
			}'''
		, 
		'''
			PrimitiveTypes::Integer x = 1;
			if (true) {
			x++;
			} else {
			if (false) {
			x++;
			} else {
			if (true) {
			x++;
			} else {
			x++;
			}
			}
			}''')
	}
	

	
	def snippetCompilerTest(String input, String expected) {	
		val snippet = generator.createSnippet(input, parser,compiler)
		val serializedSnippet = serializer.serialize(snippet)
		assertEquals("The created snippet does not match the expected result",expected,serializedSnippet)
	}
}

