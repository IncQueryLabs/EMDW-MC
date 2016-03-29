/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.util

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.context.TestModelUMLContextProvider
import com.incquerylabs.uml.ralf.tests.util.descriptors.DummyUmlValueDescriptorFactory
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.junit.BeforeClass
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

import static org.junit.Assert.*

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractPluginSnippetTest {
    @Parameter(0)
    public String name;

    @Parameter(1)
    public String input;
    
    @Parameter(2)
    public String expectedOutput;
    
    @Parameter(3)
    public String thisName="";
		
	private static ReducedAlfParser parser
    private static TestModelUMLContextProvider context


    @Test 
    def void t01_createSnippet() {
	    val compiler = new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory())
	    //Serializer component
	    val serializer = new ReducedAlfSnippetTemplateSerializer
	    //API class
	    val generator = new ReducedAlfGenerator
	    
	    //As in this test case there is no editor attached to the UML model, the qualified name of the current type needs to be specified.
	    if(!thisName.equals("")){
    		context.definedOperation = thisName
    	}
    	
    	//Parse the action code
       	val result = parser.parse(input, context)
       	//Create the snippet template based on the parsed abstract syntax tree
       	val snippet = generator.createSnippet(result, context, compiler)
       	//Create the snippet code based on the snippet template
       	val serializedSnippet = serializer.serialize(snippet).purgeRalfComments
       	//compare results
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
    }
    
    @BeforeClass
	def static void init(){      
		Logger.getLogger(ReducedAlfSnippetTemplateCompiler.package.name).level = Level.TRACE 
        parser = new ReducedAlfParser
	    context =  new TestModelUMLContextProvider("/com.incquerylabs.uml.ralf.snippetcompiler.tests/model/model.uml");
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
	
}