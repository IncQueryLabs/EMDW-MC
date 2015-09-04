package com.incquerylabs.uml.ralf.tests.parser;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ 
    AdditiveExpressionParserTest.class, 
    AffixExpressionParserTest.class,
    AuxiliaryExpressionParserTest.class,
    LiteralExpressionParserTest.class,
    PostfixExpressionParserTest.class})
public class RalfParserTestSuite {}
