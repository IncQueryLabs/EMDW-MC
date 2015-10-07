package com.incquerylabs.uml.ralf;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.incquerylabs.uml.ralf.plugintests.RalfPlugintestsTestSuite;
import com.incquerylabs.uml.ralf.tests.modelvalidator.RalfModelvalidatorTestSuite;
import com.incquerylabs.uml.ralf.tests.parser.RalfParserTestSuite;
import com.incquerylabs.uml.ralf.tests.validator.RalfValidatorTestSuite;

@RunWith(Suite.class)
@SuiteClasses({ 
    RalfPlugintestsTestSuite.class,
    RalfModelvalidatorTestSuite.class,
    RalfParserTestSuite.class,
    RalfValidatorTestSuite.class})
public class RalfTestsTestSuite {}
