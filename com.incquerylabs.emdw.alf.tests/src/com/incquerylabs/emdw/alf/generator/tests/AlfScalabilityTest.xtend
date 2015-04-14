package com.incquerylabs.emdw.alf.generator.tests

import com.google.common.collect.ContiguousSet
import com.google.common.collect.DiscreteDomain
import com.google.common.collect.Range
import com.incquerylabs.emdw.alf.generator.AlfSnippetCompiler
import java.util.Collection
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.papyrus.uml.alf.AlfMapper
import org.eclipse.papyrus.uml.alf.UnitDefinition
import org.eclipse.xtext.util.StringInputStream
import org.junit.Assert
import org.junit.Test
import org.junit.runners.Parameterized.Parameters

class AlfScalabilityTest extends AbstractAlfGeneratorTest {
	
	static def String input(int size) '''
        class SimpleTest {
            activity test() {
                «FOR i : ContiguousSet.create(Range.closed(1, size), DiscreteDomain.integers()) 
                    »let x«i» : Integer = 1 + 2;
                «ENDFOR»
            }
        }'''
        
    static def String output(int size) '''
        «FOR i : ContiguousSet.create(Range.closed(1, size), DiscreteDomain.integers()) 
            »int x«i» = 1 + 2;
        «ENDFOR»
       '''
	
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
}
