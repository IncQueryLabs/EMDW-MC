package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class UMLAssociationValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Association Access: OK",
			    '''
			    Pong p = new Pong();
			    p->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: OK_this",
			    '''
			    this->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: PropertyAccess",
			    '''
			    this.pongProperty->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Association Access: OperationCall",
			    '''
			    returnPong()->ping;''',
				"model::Comp::Pong::TestOperation",
			    #[]
			],
			#[  "Invalid Association Access: Null",
			    '''
			    Pong p = new Pong();
			    p->pong;''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.ASSOCIATIONACCESSEXPRESSION]
			]
		)
	}
	
}