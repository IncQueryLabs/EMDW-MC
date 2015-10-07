package com.incquerylabs.uml.ralf.tests.util.basetests

import com.incquerylabs.uml.ralf.api.impl.ReducedAlfParser
import com.incquerylabs.uml.ralf.scoping.SimpleUMLContextProvider
import java.util.ArrayList
import java.util.List
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
				val unConsumedCodes = new ArrayList<String>()
		unConsumedCodes.addAll(issueCodes.toList)
		val unConsumedIssues = new ArrayList<Issue>()
		unConsumedIssues.addAll(issues.toList)
			
		for (Issue i : issues) {
			var String foundCode
			var found = false
			for (String e : unConsumedCodes){
				if(i.code == null){
					if (e.equals("null")) {
						foundCode = e;
						found = true;
					}
				}else{
					if (e.equals(i.code)) {
						foundCode = e;
						found = true;
					}
				}
			}
					
			if (found) {
				unConsumedCodes.remove(foundCode)
				unConsumedIssues.remove(i)
			}
		}
	
		if (unConsumedCodes.size() != 0){
			if(unConsumedIssues.size() != 0){
				fail(
				'''
				There are diagnostics missing for these predicates: «unConsumedCodes» and
				The following issues were produced unexpectedly: «FOR issue : unConsumedIssues SEPARATOR ', '»«IF issue.code == null»«"null"»«ELSE»«issue.code»«ENDIF»«ENDFOR»
				''');
			}else{
				fail('''There are diagnostics missing for these predicates: «unConsumedCodes»''');
			}
		}else{
			if(unConsumedIssues.size() != 0){
				fail('''The following issues were produced unexpectedly: «FOR issue : unConsumedIssues SEPARATOR ', '»«IF issue.code == null»«"null"»«ELSE»«issue.code»«ENDIF»«ENDFOR»''');
			}
		}
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