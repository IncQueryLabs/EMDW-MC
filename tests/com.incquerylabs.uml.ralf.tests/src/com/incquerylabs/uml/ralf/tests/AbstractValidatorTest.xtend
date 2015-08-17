package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider
import java.util.ArrayList
import java.util.Arrays
import java.util.HashMap
import java.util.List
import java.util.Map.Entry
import org.eclipse.emf.ecore.EPackage
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.xmi.impl.EcoreResourceFactoryImpl
import org.eclipse.emf.ecore.xmi.impl.XMIResourceFactoryImpl
import org.eclipse.xtext.XtextPackage
import org.eclipse.xtext.resource.impl.BinaryGrammarResourceFactoryImpl
import org.eclipse.xtext.validation.Issue
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
abstract class AbstractValidatorTest {
	@Parameter(0)
    public String name

    @Parameter(1)
    public String input
    
    @Parameter(2)
    public List<String> issueCodes
	
	@Test
	public def validatorTest(){
		val parser = new ReducedAlfParser
	    val context = new SimpleUMLContextProvider()
    	val result = parser.parse(input, context)
		assertAll(result.errors, issueCodes)
	}
		
	protected def void assertAll(Iterable<Issue> issues, String... issueCodes) {
		val consumed = new HashMap<String, Boolean>();
		for (String s : issueCodes)
			consumed.put(s, Boolean.FALSE);
		for (Issue i : issues) {
			var found = false;
			for (Entry<String, Boolean> e : consumed.entrySet())
				if(i.code == null){
					consumed.put(e.getKey(), Boolean.TRUE);
					found = true;
				}else{
					if (!e.getValue() && e.getKey().equals(i.code)) {
						consumed.put(e.getKey(), Boolean.TRUE);
						found = true;
					}
				}
			if (!found) {
				if (issueCodes.length == 1){
					fail("Issue code " + issueCodes.get(0) + " does not match " + i);
				}
				else{
					fail("No issue code in " + Arrays.toString(issueCodes) + " matches " + i);
				}
			}
		}
		val unconsumed = new ArrayList<String>();
		for (Entry<String, Boolean> e : consumed.entrySet()){
			if (!e.getValue()){
				unconsumed.add(e.getKey());
			}	
		}
		if (unconsumed.size() != 0)
			fail("There are diagnostics missing for these predicates: " + unconsumed);
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