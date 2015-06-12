package com.incquerylabs.emdw.alf.generator.tests

import com.google.inject.Inject
import com.google.inject.Injector
import com.incquerylabs.emdw.alf.generator.AlfSnippetCompiler
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.ocl.pivot.internal.delegate.OCLDelegateDomain
import org.eclipse.ocl.pivot.model.OCLstdlib
import org.eclipse.ocl.uml.OCL
import org.eclipse.ocl.xtext.essentialocl.EssentialOCLStandaloneSetup
import org.eclipse.papyrus.uml.alf.AlfMapper
import org.eclipse.papyrus.uml.alf.AlfStandaloneSetup
import org.eclipse.papyrus.uml.alf.UnitDefinition
import org.eclipse.xtext.resource.XtextResourceSet
import org.eclipse.xtext.util.StringInputStream
import org.junit.Assert
import org.junit.Before
import org.junit.BeforeClass
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractAlfGeneratorTest {
    @Inject protected XtextResourceSet resourceSet

    @Parameter(0)
    public String name;

    @Parameter(1)
    public String input;
    
    @Parameter(2)
    public String expectedOutput;
    
    static var Injector injector

    @BeforeClass static def void initEnvironment() throws Exception {
        injector = new AlfStandaloneSetup().createInjectorAndDoEMFRegistration()
        EssentialOCLStandaloneSetup.doSetup
        OCLstdlib.install()
    }
    
    @Before def void setUp() {
        injector.injectMembers(this)
        OCL.initialize(resourceSet)
        OCLDelegateDomain.initialize(resourceSet)
    }

    @Test def void t03_createSnippet() {
        var Resource resource = this.resourceSet.createResource(URI.createURI("temp.alf"))
        resource.load(new StringInputStream(input), #{})
        val AlfMapper mapper = new AlfMapper()
        mapper.map(resource.contents)
        if (resource.getContents().isEmpty()) {
            Assert.fail("The resource is not expected to be empty")
        } else {
            if (resource.getErrors().isEmpty()) {
                var UnitDefinition unit = resource.getContents().get(0) as UnitDefinition
                val output = new AlfSnippetCompiler().visit(unit)
                System.out.println(output)
                Assert.assertEquals(expectedOutput, output)
            } else {
                Assert.fail("The specification should not contain syntax errors")
            }
        }
        resource.unload()
    }

}
