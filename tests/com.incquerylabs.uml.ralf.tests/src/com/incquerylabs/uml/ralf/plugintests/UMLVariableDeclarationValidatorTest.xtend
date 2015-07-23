package com.incquerylabs.uml.ralf.plugintests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguagePluginInjectorProvider
import com.incquerylabs.uml.ralf.tests.util.TestModelUMLContextProvider
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
class UMLVariableDeclarationValidatorTest {
	
	@Inject
	IReducedAlfParser parser
	@Inject
	TestModelUMLContextProvider context
	
	@Test
	def localVariableUMLNull(){
		localVariableOK('''Pong x = null;''')
	}
	
	@Test
	def localVariableUMLNullSendSignal(){
		localVariableError(
		'''
			Pong p = null;
			ping_s s = new ping_s();
			send s => p->ping;''')
	}
	
	@Test
	def localVariableUMLNullSendSignalThis(){
		localVariableErrorThis(
		'''
			ping_s s = null;
			send s => this->ping;'''
		,"model::Comp::Pong")
	}
	
	def localVariableOKThis(String input, String thisElementFQN) {	
		context.elementFQN = thisElementFQN
		val result = parser.parse(input)
		assertTrue(result.toString, result.validationOK)
	}
	
	def localVariableErrorThis(String input, String thisElementFQN) {	
		context.elementFQN = thisElementFQN
		assertTrue("NO Validation errors found", parser.parse(input).hasError)
	}
	
	def localVariableOK(String input) {	
		val result = parser.parse(input)
		assertTrue(result.toString, result.validationOK)
	}
	
	def localVariableError(String input) {	
		assertTrue("NO Validation errors found", parser.parse(input).hasError)
	}
}