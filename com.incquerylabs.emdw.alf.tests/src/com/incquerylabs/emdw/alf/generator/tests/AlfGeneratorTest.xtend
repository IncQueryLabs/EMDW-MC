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
import com.google.common.collect.Range
import com.google.common.collect.DiscreteDomain
import com.google.common.collect.ContiguousSet
import org.junit.FixMethodOrder
import org.junit.runners.MethodSorters

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
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
			#[  "10 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 10), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 10), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "100 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 100), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 100), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "200 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 200), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 200), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "500 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 500), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 500), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "1000 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 1000), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 1000), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "2000 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 2000), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 2000), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "5000 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 5000), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 5000), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
				'''
			],
			#[  "10000 additions",
			    '''
				class SimpleTest {
					activity test() {
					    «FOR i : ContiguousSet.create(Range.closed(1, 10000), DiscreteDomain.integers()) 
					    »let x«i» : Integer = 1 + 2;
					    «ENDFOR»
					}
				}''',
				'''
				    «FOR i : ContiguousSet.create(Range.closed(1, 10000), DiscreteDomain.integers()) 
				    »int x«i» = 1 + 2;
                    «ENDFOR»
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

	@Test def void t01_parseAlf() {
		var Resource resource = this.resourceSet.createResource(URI.createURI("temp.alf"))
		resource.load(new StringInputStream(input), #{})
		val AlfMapper mapper = new AlfMapper()
		mapper.map(resource.contents)
		if (resource.getContents().isEmpty()) {
			Assert.fail("The resource is not expected to be empty")
		} else {
			if (resource.getErrors().isEmpty()) {
				resource.getContents().get(0) as UnitDefinition
			} else {
				Assert.fail("The specification should not contain syntax errors")
			}
		}
		resource.unload()
	}
	@Test def void t02_createSnippetNoAssert() {
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
			} else {
				Assert.fail("The specification should not contain syntax errors")
			}
		}
		resource.unload()
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
