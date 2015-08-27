package com.incquerylabs.uml.ralf.tests.example.util

import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfGenerator
import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.snippetcompiler.ReducedAlfSnippetTemplateCompiler
import com.incquerylabs.uml.ralf.tests.util.DummyUmlValueDescriptorFactory
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

import static org.junit.Assert.*

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractPluginTest {
    @Parameter(0)
    public String name;

    @Parameter(1)
    public String input;
    
    @Parameter(2)
    public String expectedOutput;
    
    @Parameter(3)
    public String thisName="";
		

    @Test 
    def void t01_createSnippet() {
    	//Initiate components
    	//Create parser
    	val parser = new ReducedAlfParser
    	//Create uml context provider
    	//It is responsible for supplying the primitive and user defined UML types
    	//in this case th UML model is loaded from an external resource
    	//Its path needs to be specified here
	    val context =  new TestModelUMLContextProvider("/com.incquerylabs.uml.ralf.tests.examples/model/model.uml");
	    //Snippet compiler that creates a snippet template tree based on the parsed code
	    //It needs an UML valueDescriptor factory which is used for determining which CPP element can be traced 
	    //back to what UML element
	    val compiler = new ReducedAlfSnippetTemplateCompiler(new DummyUmlValueDescriptorFactory(), context)
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
       	val snippet = generator.createSnippet(result, compiler)
       	//Create the snippet code based on the snippet template
       	val serializedSnippet = serializer.serialize(snippet)
       	//compare results
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
	
    }
}