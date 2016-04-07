/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.example.util

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.descriptors.DummyUmlValueDescriptorFactory
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.XtextPackage
import org.eclipse.xtext.resource.impl.BinaryGrammarResourceFactoryImpl
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
class AbstractUnitTest {
	@Parameter(0)
    public String name;

    @Parameter(1)
    public String input;
    
    @Parameter(2)
    public String expectedOutput;
    
	@BeforeClass
	def static void init(){
		if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("ecore"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("ecore",
                    new EcoreResourceFactoryImpl());
        if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("xmi"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xmi",
                    new XMIResourceFactoryImpl());
        if (!Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().containsKey("xtextbin"))
            Resource.Factory.Registry.INSTANCE.getExtensionToFactoryMap().put("xtextbin",
                    new BinaryGrammarResourceFactoryImpl());
        if (!EPackage.Registry.INSTANCE.containsKey(XtextPackage.eNS_URI))
            EPackage.Registry.INSTANCE.put(XtextPackage.eNS_URI,
                    XtextPackage.eINSTANCE);
	}
	     
    @Test 
    def void t01_createSnippet() {
    	//Initiate components
    	//Create parser
    	val parser = new ReducedAlfParser
    	//Create uml context provider
    	//It is responsible for supplying the primitive and user defined UML types
	    val context = new SimpleUMLContextProvider()
	    //Snippet compiler that creates a snippet template tree based on the parsed code
	    //It needs an UML valueDescriptor factory which is used for determining which CPP element can be traced 
	    //back to what UML element
	    val compiler = new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory())
	    //Serializer component
	    val serializer = new ReducedAlfSnippetTemplateSerializer
	    //API class
	    val generator = new ReducedAlfGenerator
	    
	    //Parse the action code
       	val result = parser.parse(input, context)
       	//Create the snippet template based on the parsed abstract syntax tree
       	val snippet = generator.createSnippet(result, context, compiler)
       	//Create the snippet code based on the snippet template
       	val serializedSnippet = serializer.serialize(snippet)
       	//compare results
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
	
    }
}