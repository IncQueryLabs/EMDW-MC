package com.incquerylabs.uml.ralf.tests.statements

import com.google.inject.Inject
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.reducedAlfLanguage.Statements
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator
import org.eclipse.emf.common.util.Diagnostic
import org.eclipse.xtext.junit4.InjectWith
import org.eclipse.xtext.junit4.XtextRunner
import org.eclipse.xtext.junit4.util.ParseHelper
import org.eclipse.xtext.junit4.validation.AssertableDiagnostics
import org.eclipse.xtext.junit4.validation.ValidationTestHelper
import org.eclipse.xtext.junit4.validation.ValidatorTester
import org.junit.FixMethodOrder
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters

@RunWith(typeof(XtextRunner))
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@InjectWith(typeof(ReducedAlfLanguageJUnitInjectorProvider))
class ForStatementValidatorTest {
	@Inject
	ParseHelper<Statements> parseHelper

	@Inject
	ValidatorTester<ReducedAlfLanguageValidator> tester
	
	@Inject extension ValidationTestHelper	
	
	
	@Test
	def forEachStatement_Literal() {
		forStatementError('''
		for(Integer i in 5){
			
		}''');
	}
	
	@Test
	def forEachStatement_LiteralReal() {
		forStatementError('''
		for(Integer i in 1.1){
			
		}''');
	}
	
	@Test
	def forEachStatement_LiteralBoolean() {
		forStatementError('''
		for(Integer i in true){
			
		}''');
	}
	
	@Test
	def forEachStatement_LiteralString() {
		forStatementError('''
		for(Integer i in "1"){
			
		}''');
	}
	
	@Test
	def forEachStatement_LiteralCollection() {
		forStatementOK('''
		for(String i in {"1"}){
			
		}''');
	}
	
	@Test
	def forEachStatement_LiteralCollection_Reference() {
		forStatementOK('''
		for(String i in {"1"}){
			i = "ASD";
		}''');
	}

	@Test
	@Ignore("Ignored due to a bug in the validator")
	def forEachStatement_LiteralCollection_Definition() {
		forStatementOK('''
		for(String i in {"1"}){
			i = "ASD";
		}
		String i = "1";''');
	}
	
	@Test
	def forEachStatement_LiteralCollection_DefinitionBefore() {
		forStatementError('''
		String i = "1";
		for(String i in {"1"}){
			i = "ASD";
		}
		''');
	}
	
	@Test
	def forEachStatement_Multiplicative() {
		forStatementError('''
		for(Integer i in 1*1){
			
		}''');
	}
	
	
	@Test
	def forEachStatement_Additive() {
		forStatementError('''
		for(Integer i in 1+1){
			
		}''');
	}
	
	@Test
	def forEachStatement_Shift() {
		forStatementError('''
		for(Integer i in 1>>1){
			
		}''');
	}
	
	@Test
	def forEachStatement_Relational() {
		forStatementError('''
		for(Integer i in 1>1){
			
		}''');
	}
	
	@Test
	def forEachStatement_Equality() {
		forStatementError('''
		for(Integer i in 1==1){
			
		}''');
	}
	
	@Test
	def forEachStatement_BitwiseOr() {
		forStatementError('''
		for(Integer i in 1|1){
			
		}''');
	}
	
	@Test
	def forEachStatement_BitwiseAnd() {
		forStatementError('''
		for(Integer i in 1&1){
			
		}''');
	}
	
	@Test
	def forEachStatement_BitwiseXor() {
		forStatementError('''
		for(Integer i in 1^1){
			
		}''');
	}
	
	@Test
	def forEachStatement_And() {
		forStatementError('''
		for(Integer i in true && false){
			
		}''');
	}
	
	@Test
	def forEachStatement_Or() {
		forStatementError('''
		for(Integer i in true || false){
			
		}''');
	}
	
	@Test
	def forEachStatement_BooleanUnary() {
		forStatementError('''
		for(Integer i in !true){
			
		}''');
	}
	
	@Test
	def forEachStatement_Assignment() {
		forStatementError('''
		Integer x = 1;
		for(Integer i in x = 2){
			
		}
		''');
	}
	
	@Test
	@Ignore("These test cases can be useful with issue #226")
	def forEachStatement_Reassignment() {
		forStatementError('''
		Integer i = 1;
		for(i in { 5 }){
			
		}
		''');
	}
	
	@Test
	@Ignore("These test cases can be useful with issue #226")
	def forEachStatement_Reassignment2() {
		forStatementOK('''
		Integer i = 1;
		for(i in { 5 }){
			
		}
		''');
	}
	
	//Syntax: for(i in 0 .. 1){}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Literal() {
		forStatementOK('''
		for(i in 1 .. 5){
			
		}''');
	}
	
	@Test
	@Ignore("At this point the for(i in 1..2) without whitespace characters is not supported")
	def forEachStatement_Range_LiteralNoSpace() {
		forStatementOK('''
		for(i in 1..5){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_LiteralReal() {
		forStatementError('''
		for(i in 0 .. 1.1){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_LiteralBoolean() {
		forStatementError('''
		for(i in 0 .. true){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_LiteralString() {
		forStatementError('''
		for(i in 0 .. "1"){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}

	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Multiplicative() {
		forStatementOK('''
		for(i in 0 .. 1*1){
			
		}''');
	}
	
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Additive() {
		forStatementOK('''
		for(i in 0 .. 1+1){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Shift() {
		forStatementOK('''
		for(i in 0 .. 1>>1){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Relational() {
		forStatementError('''
		for(i in 0 .. 1>1){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Equality() {
		forStatementError('''
		for(i in 0 .. 1==1){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_BitwiseOr() {
		forStatementOK('''
		for(i in 0 .. 1|1){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatementSyntax_Range_BitwiseAnd() {
		forStatementOK('''
		for(i in 0 .. 1&1){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_BitwiseXor() {
		forStatementOK('''
		for(i in 0 .. 1^1){
			
		}''');
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_And() {
		forStatementError('''
		for(i in 0 .. true && false){
			
		}''',
		  ReducedAlfSystem.LOOPVARIABLE,
		  ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Or() {
		forStatementError('''
		for(i in 0 .. true || false){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_BooleanUnary() {
		forStatementError('''
		for(i in 0 .. !true){
			
		}''',
          ReducedAlfSystem.LOOPVARIABLE,
          ReducedAlfSystem.SIMPLETYPEREFERENCESUBTYPING);
	}
	
	@Test
	@Ignore("Ranges are not supported currently")
	def forEachStatement_Range_Assignment() {
		forStatementOK('''
		Integer x = 1;
		for(i in 0 .. x = 2){
			
		}
		''');
	}
	
	// for(i : 5) syntax
	
	@Test
	def forStatement_Simple() {
	    forStatementOK('''
	    for (Integer i = 0; i < 5; i++) {
	        
	    }
	    ''')
	}
	
	@Test
    def forStatement_PredefinedLoopVariable() {
        forStatementOK('''
        Integer i = 0;
        for (; i < 5; i++) {
            
        }
        ''')
    }
    
    @Test
    def forStatement_InfiniteLoop() {
        forStatementOK('''
        for (; true; ) {
            
        }
        ''')
    }
    
    @Test
    def forStatement_NoLoop() {
        forStatementOK('''
        for (; false; ) {
            
        }
        ''')
    }
	
	@Test
    def forStatement_InvalidCondition() {
        forStatementError('''
        for (Integer i = 0; i; i++) {
            
        }
        ''')
    }
    
	private def forStatementOK(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertAll()
		model.assertNoErrors
	}
	
	private def forStatementError(String code){
		val model = parseHelper.parse(code)
		tester.validate(model).assertError(0)
	}
	
	private def forStatementError(String code, String... errorCodes) {
	    val model = parseHelper.parse(code)
	    
        tester.validate(model).assertAll(errorCodes.map[AssertableDiagnostics.diagnostic(Diagnostic.ERROR, it, "")])
	}
}