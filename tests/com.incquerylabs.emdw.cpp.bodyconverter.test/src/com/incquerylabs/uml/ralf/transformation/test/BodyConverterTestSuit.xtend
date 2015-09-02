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
	
    @AfterClass
    static def void printCodes() {
		println(BodyConverterTestSuit.codes)
    }
}