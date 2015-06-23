package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.google.inject.Injector
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import com.incquerylabs.uml.ralf.validation.ReducedAlfSystemValidator
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.junit.Test
import org.junit.runner.RunWith
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements

@RunWith(typeof(XtextRunner))
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class ReducedALFParserTest {

	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ReducedAlfSystemValidator validator

	@Inject
	Injector injector

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester


	@Test
	def testGood1() {
		val model = parseHelper.parse('''
		let i :Integer = 2;
		''')
		
		tester.validate(model).assertOK
	}



}