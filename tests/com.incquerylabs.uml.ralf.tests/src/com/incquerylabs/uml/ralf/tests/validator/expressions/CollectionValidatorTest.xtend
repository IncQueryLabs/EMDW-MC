/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.validator.expressions

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class CollectionValidatorTest extends AbstractValidatorTest{

	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Collection: Integer",
			    '''Set<Integer> x = Set<Integer> {1, 2};''',
			    #[]
			],
			#[  "Collection: Real",
			    '''Set<Real> x = Set<Real> {1.1, 2.1};''',
			    #[]
			],
			#[  "Collection: String",
			    '''Set<String> x = Set<String> {"1", "2"};	''',
			    #[]
			],
			#[  "Collection: Boolean",
			    '''Set<Boolean> x = Set<Boolean> {true, false};''',
			    #[]
			],
			#[  "Collection: Integer, no explicit collection type",
			    '''Set<Integer> x = {1, 2};''',
			    #[]
			],
			#[  "Collection: Real, no explicit collection type",
			    '''Set<Real> x = {1.1, 2.1};''',
			    #[]
			],
			#[  "Collection: String, no explicit collection type",
			    '''Set<String> x = {"1", "2"};	''',
			    #[]
			],
			#[  "Collection: Boolean, no explicit collection type",
			    '''Set<Boolean> x = {true, false};''',
			    #[]
			],
			#[  "InvalidCollection: Invalid type",
			    '''Set<Integer> x = Set<Integer> {1, "2"};''',
			    #[ReducedAlfSystem.COLLECTIONCONSTRUCTIONEXPRESSION, ReducedAlfSystem.COLLECTIONCONSTRUCTIONEXPRESSION]
			],
			#[  "InvalidCollection: Invalid type, no explicit collection type",
			    '''Set<Integer> x = {1, "2"};''',
			    #[ReducedAlfSystem.COLLECTIONCONSTRUCTIONEXPRESSION, ReducedAlfSystem.COLLECTIONCONSTRUCTIONEXPRESSION]
			]
		)
	}
}