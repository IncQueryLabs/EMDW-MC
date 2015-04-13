package com.incquerylabs.emdw.alf.generator.tests

import com.google.inject.Inject
import com.google.inject.Injector
import com.incquerylabs.emdw.alf.generator.AlfSnippetCompiler
import java.util.Collection
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
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter
import org.junit.runners.Parameterized.Parameters

@RunWith(Parameterized)
class AlfGeneratorTest {
	@Inject XtextResourceSet resourceSet
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Addition Expression",
				'''
				class SimpleTest {
					activity test() {
						1 + 2;
					}
				}''', 
				'''1 + 2'''
			],
			#[  "Simple local variable",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
					}
				}''',
				'''
					int x = 1 + 2;
				'''
			],
			#[  "Multiple additions",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
						let y : Integer = 1 + 2;
					}
				}''',
				'''
					int x = 1 + 2;
					int y = 1 + 2;
				'''
			],
			#[  "Local variable reference",
			    '''
				class SimpleTest {
					activity test() {
						let x : Integer = 1 + 2;
						let y : Integer = x + 2;
					}
				}''',
				'''
					int x = 1 + 2;
					int y = x + 2;
				'''
			],
			#[  "String concatenation",
			    '''
				class SimpleTest {
					activity test() {
						let x : String = "1" + "2";
					}
				}''',
				'''
					std::string x = "1" + "2";
				'''
			]
		)
	}

    @Parameter(0)
    public String name;

	@Parameter(1)
	public String input;
	
	@Parameter(2)
	public String expectedOutput;

	@Before def void setUp() throws Exception {
		var Injector injector = new AlfStandaloneSetup().createInjectorAndDoEMFRegistration()
		injector.injectMembers(this)
		EssentialOCLStandaloneSetup.doSetup
		OCL.initialize(resourceSet)
    	OCLstdlib.install()
    	OCLDelegateDomain.initialize(resourceSet)
	}

	@Test def void createSnippet() {
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
