package com.incquerylabs.uml.ralf.tests

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.tests.util.ReducedAlfLanguageCustomInjectorProvider
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
@InjectWith(typeof(ReducedAlfLanguageCustomInjectorProvider))
class AdditiveExpressionValidatorTest {
	
	@Inject
	ParseHelper<Statements> parseHelper
	
	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper
	
	//Addition Expression
		//Expected: OK
	
	@Test
	def additionExpressionInteger() {
		val model = parseHelper.parse('''1 + 2;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def additionExpressionReal() {
		val model = parseHelper.parse('''1.3 + 2.3;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def additionExpressionRealInteger() {
		val model = parseHelper.parse('''1.3 + 2;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def additionExpressionIntegerReal() {
		val model = parseHelper.parse('''1 + 2.3;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def additionExpressionString() {
		val model = parseHelper.parse('''"1" + "2";''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
		
		//Expected: Validation ERROR
		
	@Test
	def additionExpressionIntegerString() {
		val model = parseHelper.parse('''1 + "2";''')
		tester.validate(model).assertError(0)		
	}
	
	@Test
	def additionExpressionRealString() {
		val model = parseHelper.parse('''1.3 + "2";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionStringInteger() {
		val model = parseHelper.parse('''"1" + 2;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionStringReal() {
		val model = parseHelper.parse('''"1" + 2.3;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionBooleanReal() {
		val model = parseHelper.parse('''true + 2.3;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionBooleanInteger() {
		val model = parseHelper.parse('''true + 2;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionBooleanString() {
		val model = parseHelper.parse('''true + "2";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionStringBoolean() {
		val model = parseHelper.parse('''"1" + true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionRealBoolean() {
		val model = parseHelper.parse('''1.3 + true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionIntegerBoolean() {
		val model = parseHelper.parse('''1 + true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def additionExpressionBoolean() {
		val model = parseHelper.parse('''false + true;''')
		tester.validate(model).assertError(0)
	}
	
	//Subtraction
	//Exprected: OK
	
	@Test
	def subtractionExpressionInteger() {
		val model = parseHelper.parse('''1 - 2;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def subtractionExpressionReal() {
		val model = parseHelper.parse('''1.3 - 2.3;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def subtractionExpressionRealInteger() {
		val model = parseHelper.parse('''1.3 - 2;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
	
	@Test
	def subtractionExpressionIntegerReal() {
		val model = parseHelper.parse('''1 - 2.3;''')
		tester.validate(model).assertOK
		model.assertNoErrors
	}
		
		//Expected: Validation ERROR
		
		
	@Test
	def subtractionExpressionString() {
		val model = parseHelper.parse('''"1" - "2";''')
		tester.validate(model).assertError(0)
	}
		
	@Test
	def subtractionExpressionIntegerString() {
		val model = parseHelper.parse('''1 - "2";''')
		tester.validate(model).assertError(0)		
	}
	
	@Test
	def subtractionExpressionRealString() {
		val model = parseHelper.parse('''1.3 - "2";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionStringInteger() {
		val model = parseHelper.parse('''"1" - 2;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionStringReal() {
		val model = parseHelper.parse('''"1" - 2.3;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionBooleanReal() {
		val model = parseHelper.parse('''true - 2.3;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionBooleanInteger() {
		val model = parseHelper.parse('''true - 2;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionBooleanString() {
		val model = parseHelper.parse('''true - "2";''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionStringBoolean() {
		val model = parseHelper.parse('''"1" - true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionRealBoolean() {
		val model = parseHelper.parse('''1.3 - true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionIntegerBoolean() {
		val model = parseHelper.parse('''1 - true;''')
		tester.validate(model).assertError(0)
	}
	
	@Test
	def subtractionExpressionBoolean() {
		val model = parseHelper.parse('''false - true;''')
		tester.validate(model).assertError(0)
	}
	

}