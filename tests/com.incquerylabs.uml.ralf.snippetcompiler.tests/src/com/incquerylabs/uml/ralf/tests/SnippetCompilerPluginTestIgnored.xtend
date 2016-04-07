/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("These features are not yet functioning")
class SnippetCompilerPluginTestIgnored extends AbstractPluginSnippetTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Cast test",
			    '''
				Pong p = new Pong;
				Pong q = (Pong) p;''',
				
				'''''',
				"model::Comp::Pong::doIntegerVoid"
			]
		)
	}	
}

