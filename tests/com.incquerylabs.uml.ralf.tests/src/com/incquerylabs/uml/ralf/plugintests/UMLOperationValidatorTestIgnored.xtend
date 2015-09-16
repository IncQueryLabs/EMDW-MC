package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.runners.Parameterized.Parameters
import org.junit.Ignore

@Ignore("These features are not yet supported")
class UMLOperationValidatorTestIgnored extends AbstractPluginValidatorTest{
	def static getModelName(){
		return "/com.incquerylabs.uml.ralf.tests/model/model.uml"
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Invalid Integer Operation Call: Additive Invalid Type",
			    '''
				this.doIntegerVoid("1" + "1");''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Integer Operation Call: Operation Invalid Type",
			    '''
				this.doIntegerVoid(this.returnPong());''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Boolean Operation Call: Invalid Parameter",
			    '''this.doBooleanVoid("A");''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Pong Operation Call: Invalid Parameter",
			    '''
				Pong x = new Pong();
				this.doPongVoid(x.returnInteger());''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Pong Operation Call: Invalid Parameter, without this",
			    '''
				Pong x = new Pong();
				doPongVoid(x.returnInteger());''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Operation Call Multiple Parameters: invalid literals",
			    '''this.doMultipleReturnString("1", this);''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Operation Call Multiple Parameters: missing params",
			    '''this.doMultipleReturnString(this);''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Operation Call Optional Parameters: invalid parameter",
			    '''this.doDefaultValue("1");''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.OPERATIONTYPING]
			],
			#[  "Invalid Return Ping Signal Operation Call: Assignment",
			    '''
				Pong x = Pong();
				x = this.returnPingSignal();''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			],
			#[  "Invalid Return Ping Operation Call: Assignment, no this",
			    '''
				Pong x = Pong();
				x = returnPingSignal();''',
				"model::Comp::Pong::TestOperation",
			    #[ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.NAMEEXPRESSION,
			    	ReducedAlfSystem.ASSIGNMENTEXPRESSION]
			]
		)
	}
}