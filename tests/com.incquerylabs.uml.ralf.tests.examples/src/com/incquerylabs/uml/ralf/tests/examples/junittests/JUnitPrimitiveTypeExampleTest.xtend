package com.incquerylabs.uml.ralf.tests.examples.junittests

import com.incquerylabs.uml.ralf.tests.example.util.AbstractUnitTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class JUnitPrimitiveTypeExampleTest extends AbstractUnitTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Simple JUnit Test with Primitive Types",
			    '''
				Integer x = (1 + 2) * 3 + -4;
				++x;
				Integer y = x;
				y = x - 15;
				if ((x > 3) && !(y < -5)) {
					x--;
				}''',
				'''
				PrimitiveTypes::Integer x = (1 + 2) * 3 + -4;
				++x;
				PrimitiveTypes::Integer y = x;
				y = x - 15;
				if ((x > 3) && !(y < -5)) {
				x--;
				}'''
			]
		)
	}
}

