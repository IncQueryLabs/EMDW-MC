package com.incquerylabs.uml.ralf.plugintests;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
    RalfValidatorPluginTestSuite.class,
    UMLSendSignalTest.class
    })
public class RalfPlugintestsTestSuite {}
