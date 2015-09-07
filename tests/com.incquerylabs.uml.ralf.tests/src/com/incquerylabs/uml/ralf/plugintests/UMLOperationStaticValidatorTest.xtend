package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters
import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.validation.ReducedAlfLanguageValidator

class UMLOperationStaticValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Static Operation Call",
			    '''Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: assignment",
			    '''
				Integer a;
				a = Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: variable",
			    '''
				Integer a;
				Pong::TestOperation(1, a);''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: Qualified name",
			    '''model::Comp::Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: Class local name",
			    '''Pong::staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: without class",
			    '''staticIntegerOperation();''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Static Operation Call: misspelled",
			    '''staticIntegerOperatio();''',
				"model::Comp::Pong::TestOperation",
			    #[
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION
			    ]
			],
			#[  "This in a static operation",
			    '''this;''',
				"model::Comp::Pong::staticIntegerOperation",
			    #[
			        ReducedAlfLanguageValidator.CODE_THIS_IN_STATIC
			    ]
			]
		)
	}
}