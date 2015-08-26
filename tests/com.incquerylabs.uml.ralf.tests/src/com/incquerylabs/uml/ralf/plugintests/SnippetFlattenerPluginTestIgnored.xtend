package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.AbstractPluginSnippetTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("These features are not yet functioning")
class SnippetFlattenerPluginTestIgnored extends AbstractPluginSnippetTest{

	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Operation call alternative",
			    '''this.doIntegerVoid(parameter => 2);''',
				'''
				this.doIntegerVoid(2);''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Static operation call",
			    '''
				Pong::staticIntegerOperation();''',
				'''
				PrimitiveTypes::Integer temp0 = this.returnInteger();
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			],
			#[  "Static operation call params",
			    '''
				Pong::staticParametricOperation(1, 2);''',
				'''
				PrimitiveTypes::Integer temp0 = this.returnInteger();
				switch (temp0) {
				}''',
				"model::Comp::Pong::doIntegerVoid"
			]
		)
	}
}

