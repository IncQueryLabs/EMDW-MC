package com.incquerylabs.uml.ralf.plugintests;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
    UMLAssociationValidatorTest.class, 
    UMLOpaqueOperationParameterValidatorTest.class,
    UMLOperationValidatorTest.class,
    UMLPropertyAccessValidatorTest.class,
    UMLPropertyAccessValidatorTestIgnored.class,
    UMLSigdataValidatorTest.class,
    UMLVariableDeclarationValidatorTest.class,
    UMLVariableDeclarationValidatorTestIgnored.class})
public class RalfValidatorPluginTestSuite {}
