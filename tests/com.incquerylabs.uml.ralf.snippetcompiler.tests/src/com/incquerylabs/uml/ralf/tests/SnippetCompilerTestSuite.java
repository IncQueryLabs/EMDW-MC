package com.incquerylabs.uml.ralf.tests;

import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

@RunWith(Suite.class)
@SuiteClasses({ SnippetCompilerPluginTest.class, SnippetFlattenerPluginTest.class, 
    SnippetCompilerPluginTestIgnored.class, SnippetFlattenerPluginTestIgnored.class})
public class SnippetCompilerTestSuite {

}
