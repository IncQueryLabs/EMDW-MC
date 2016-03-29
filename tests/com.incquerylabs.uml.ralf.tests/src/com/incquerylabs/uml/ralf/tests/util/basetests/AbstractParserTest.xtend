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
package com.incquerylabs.uml.ralf.tests.util.basetests

import com.google.inject.Binder
import com.google.inject.Guice
import com.google.inject.Module
import com.incquerylabs.uml.ralf.ReducedAlfLanguageRuntimeModule
import com.incquerylabs.uml.ralf.api.IReducedAlfParser
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.IUMLContextProvider
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider
import java.io.StringReader
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.GrammarUtil
import org.eclipse.xtext.IGrammarAccess
import org.eclipse.xtext.ParserRule
import org.eclipse.xtext.XtextPackage
import org.eclipse.xtext.parser.IParser
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
abstract class AbstractParserTest {
	@Parameter(0)
    public String name

    @Parameter(1)
    public String input
    
    @Parameter(2)
    public String rulename
    
    @Parameter(3)
    public Boolean hasErrors
	
	@Test
	public def validatorTest(){
		val injector = createInjector
		val grammarAccess = injector.getInstance(IGrammarAccess)
		val parser = injector.getInstance(IParser)
		val grammar = grammarAccess.getGrammar();
		val rule = GrammarUtil.findRuleForName(grammar,rulename) as ParserRule ;
		
		val result = parser.parse(rule, new StringReader(input));
		assertEquals('''Errors expected:«hasErrors», result: «result.hasSyntaxErrors»''', hasErrors, result.hasSyntaxErrors)
	}
		
	private def createInjector(){
		  //Create the base rALF module
        val runtimeModule =  new ReducedAlfLanguageRuntimeModule() as Module;
        //create a new module that binds the API classes
        val customizations = new Module() {
            override configure(Binder binder) {
                val provider = new SimpleUMLContextProvider();
                binder.bind(IUMLContextProvider).toInstance(provider);
                binder.bind(IReducedAlfParser).to(ReducedAlfParser);
            }
        };
        //create a new injector based off the modules
        return Guice.createInjector(runtimeModule, customizations);
	}
	
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
}