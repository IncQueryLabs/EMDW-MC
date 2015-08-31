package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.ReducedAlfSystem
import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.Ignore
import org.junit.runners.Parameterized.Parameters

@Ignore("The current state of the context provider does not allow these test cases to function properly")
class UMLSigdataValidatorTest extends AbstractPluginValidatorTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Signal Data Access: OK",
			    '''
			    this;
			    sigdata.integerAttribute;''',
				"model::Comp::Pong::Pong_SM::Region1::e2::sendPong",
			    #[]
			],
			#[  "Signal Data Access: association access",
			    '''
			    sigdata.pongAttribute->ping;''',
				"sendPong",
			    #[]
			],
			#[  "Signal Data Access: property access",
			    '''
			    sigdata.pongAttribute.integerProperty;''',
				"sendPong",
			    #[]
			],
			#[  "Signal Data Access: assignment",
			    '''
			    ping_s s;
			    s = sigdata;
			    ''',
				"sendPong",
			    #[]
			],
			#[  "Invalid Signal Data Access: not appropriate attribute",
			    '''
			    sigdata.stringAttribute;''',
				"sendPong",
			    #[ReducedAlfSystem.FEATUREINVOCATIONEXPRESSION]
			]
		)
	}
	
}