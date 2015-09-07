package com.incquerylabs.uml.ralf.transformation.test

import org.junit.AfterClass
import org.junit.runner.RunWith
import org.junit.runners.Suite
import org.junit.runners.Suite.SuiteClasses

@SuiteClasses(#[
	OperationConvertingTest,
	StateEntryConvertingTest,
	StateExitConvertingTest,
	TransitionConvertingTest,
	TransitionGuardConvertingTest
])
@RunWith(Suite)
class BodyConverterTestSuit {
	public static var codes = <String>newArrayList
	public static String wikiTable = '''
									UML fully qualified name | isOK | Exception / C++ code
									------------------------ | ---- | --------------------
									'''
	public static int operationSum
	public static int operationOk
	public static int stateEntrySum
	public static int stateEntryOk
	public static int stateExitSum
	public static int stateExitOk
	public static int transitionSum
	public static int transitionOk
	public static int transitionGuardSum
	public static int transitionGuardOk
	
    @AfterClass
    static def void printCodes() {
		println(
			'''
			«BodyConverterTestSuit.codes»
			
			'''
		)
		println(
			'''
			Action code type | Ok/Sum
			---------------- | ------
			Operation | «operationOk»/«operationSum»
			State entry | «stateEntryOk»/«stateEntrySum»
			State exit | «stateExitOk»/«stateExitSum»
			Transition | «transitionOk»/«transitionSum»
			Transition guard | «transitionGuardOk»/«transitionGuardSum»
			__SUM__ | __«okSum»__/__«sumSum»__
			
			«BodyConverterTestSuit.wikiTable»
			
			'''
		)
    }
    
    static def int getSumSum() {
    	return operationSum+stateEntrySum+stateExitSum+transitionSum+transitionGuardSum
    }
    
    static def int getOkSum() {
    	return operationOk+stateEntryOk+stateExitOk+transitionOk+transitionGuardOk
    }
}