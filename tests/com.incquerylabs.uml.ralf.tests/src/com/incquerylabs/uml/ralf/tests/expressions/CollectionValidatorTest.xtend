package com.incquerylabs.uml.ralf.tests.expressions

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageJUnitInjectorProvider
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class CollectionValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	@Test
	def collectionConstructionIntegerLocal() {
		collectionOK(
		'''
		any x = bag<Integer> {1, 2};		
		'''
		)
	}
	
	@Test
	def collectionConstructionRealLocal() {
		collectionOK(
		'''
		any x = bag<Real> {1.1, 2.1};		
		'''
		)
	}
	
	@Test
	def collectionConstructionStringLocal() {
		collectionOK(
		'''
		any x = bag<String> {"1", "2"};		
		'''
		)
	}
	
	@Test
	def collectionConstructionBooleanLocal() {
		collectionOK(
		'''
		any x = bag<Boolean> {true, false};		
		'''
		)
	}
	
	@Test
	def collectionConstructionInvalidTypeLocal() {
		collectionTypingError(
		'''
		any x = bag<Integer> {1, "1"};		
		'''
		)
	}
	
	@Test
	def collectionConstructionIntegerLocal_NoCollectionDef() {
		collectionOK(
		'''
		any x = {1, 2};		
		'''
		)
	}
	
	@Test
	def collectionConstructionRealLocal_NoCollectionDef() {
		collectionOK(
		'''
		any x = {1.1, 2.1};		
		'''
		)
	}
	
	@Test
	def collectionConstructionStringLocal_NoCollectionDef() {
		collectionOK(
		'''
		any x = {"1", "2"};		
		'''
		)
	}
	
	@Test
	def collectionConstructionBooleanLocal_NoCollectionDef() {
		collectionOK(
		'''
		any x = {true, false};		
		'''
		)
	}
	
	@Test
	def collectionConstructionInvalidTypeLocal_NoCollectionDef() {
		collectionOK(
		'''
		any x = {1, "1"};		
		'''
		)
	}

	private def collectionOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	
	private def collectionTypingError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(ReducedAlfSystem.COLLECTIONSUBTYPING)
	}
}