package com.incquerylabs.uml.ralf.tests

import com.google.common.collect.ContiguousSet
import com.google.common.collect.DiscreteDomain
import com.google.common.collect.Range
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.descriptors.DummyUmlValueDescriptorFactory
import java.util.Collection
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.XtextPackage
import org.eclipse.xtext.resource.impl.BinaryGrammarResourceFactoryImpl
import org.junit.BeforeClass
import org.junit.FixMethodOrder
import org.junit.Ignore
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter
import org.junit.runners.Parameterized.Parameters

import static org.junit.Assert.*

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
@Ignore("Performance test")
class ScalabilityUnitTest {
    @Parameter(0)
    public String name;

    @Parameter(1)
    public String input;
    
    @Parameter(2)
    public String expectedOutput;
	
	static def String input(int size) '''
        «FOR i : ContiguousSet.create(Range.closed(1, size), DiscreteDomain.integers()) 
           »Integer x«i» = 1 + 2;
        «ENDFOR»
        '''
        
    static def String output(int size) '''
        «FOR i : ContiguousSet.create(Range.closed(1, size), DiscreteDomain.integers()) 
            SEPARATOR '\n'»PrimitiveTypes::Integer x«i» = 1 + 2;«ENDFOR»'''
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Simple local variable",
			    input(1),
				output(1)
			],
			#[  "10 additions",
			    input(10),
				output(10)
			],
			#[  "100 additions",
			    input(100),
				output(100)
			],
			#[  "200 additions",
			    input(200),
				output(200)
			],
			#[  "500 additions",
			    input(500),
			    output(500)
			],
			#[  "1000 additions",
			    input(1000),
			    output(1000)
			],
			#[  "2000 additions",
			    input(2000),
			    output(2000)
			],
			#[  "5000 additions",
			    input(5000),
			    output(5000)
			],
			#[  "10000 additions",
			    input(10000),
				output(10000)
			]
		)
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


    @Test def void t00_parse() {
	    val parser = new ReducedAlfParser
	    val context = new SimpleUMLContextProvider()
    	val result = parser.parse(input, context)
    	assertTrue(result.validationOK)
    }

    @Test 
    def void t01_createSnippet() {
    	val parser = new ReducedAlfParser
	    val context = new SimpleUMLContextProvider()
	    val compiler = new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory())
	    val serializer = new ReducedAlfSnippetTemplateSerializer
	    val generator = new ReducedAlfGenerator
	    
       	val result = parser.parse(input, context)
       	val snippet = generator.createSnippet(result, context, compiler)
       	val serializedSnippet = serializer.serialize(snippet)
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
	
    }
}