package com.incquerylabs.uml.ralf.tests.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.AbstractValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("Collections are not working")
class CollectionValidatorTest extends AbstractValidatorTest{

	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Collection: Integer",
			    '''set<Integer> x = set<Integer> {1, 2};''',
			    #[]
			],
			#[  "Collection: Real",
			    '''set<Real> x = set<Real> {1.1, 2.1};''',
			    #[]
			],
			#[  "Collection: String",
			    '''set<String> x = set<String> {"1", "2"};	''',
			    #[]
			],
			#[  "Collection: Boolean",
			    '''set<Boolean> x = set<Boolean> {true, false};''',
			    #[]
			],
			#[  "Collection: Integer, no explicit collection type",
			    '''set<Integer> x = {1, 2};''',
			    #[]
			],
			#[  "Collection: Real, no explicit collection type",
			    '''set<Real> x = {1.1, 2.1};''',
			    #[]
			],
			#[  "Collection: String, no explicit collection type",
			    '''set<String> x = {"1", "2"};	''',
			    #[]
			],
			#[  "Collection: Boolean, no explicit collection type",
			    '''set<Boolean> x = {true, false};''',
			    #[]
			],
			#[  "InvalidCollection: Invalid type",
			    '''set<Integer> x = set<Integer> {1, "2"};''',
			    #[ReducedAlfSystem.COLLECTIONSUBTYPING]
			],
			#[  "InvalidCollection: Invalid type, no explicit collection type",
			    '''set<Integer> x = {1, "2"};''',
			    #[ReducedAlfSystem.COLLECTIONSUBTYPING]
			]
		)
	}
}