package com.incquerylabs.uml.ralf.tests.util.basetests

import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.tests.util.RAlfTestAssertions
import com.incquerylabs.uml.ralf.tests.util.context.TestModelUMLContextProvider
import java.util.List
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.XtextPackage
import org.eclipse.xtext.resource.impl.BinaryGrammarResourceFactoryImpl
import org.eclipse.xtext.validation.Issue
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractPluginValidatorTest {
	@Parameter(0)
    public String name

    @Parameter(1)
    public String input
    
    @Parameter(2)
    public String thisName=""
        
    @Parameter(3)
    public List<String> issueCodes
    
    private static ReducedAlfParser parser
    protected static String modelName
    private static TestModelUMLContextProvider context
	
	@Test
	public def validatorPluginTest(){
	    if(!thisName.equals("")){
    		context.definedOperation = thisName
    	}
    	//Parse the action code
       	val result = parser.parse(input, context)    	
		assertAll(result.errors, issueCodes)
	}
		
	protected def void assertAll(Iterable<Issue> issues, String... issueCodes) {
		RAlfTestAssertions::assertAll(issues, issueCodes)
	}
	
	//@BeforeClass
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
                    
        parser = new ReducedAlfParser
	    context =  new TestModelUMLContextProvider(modelName);
	}
}