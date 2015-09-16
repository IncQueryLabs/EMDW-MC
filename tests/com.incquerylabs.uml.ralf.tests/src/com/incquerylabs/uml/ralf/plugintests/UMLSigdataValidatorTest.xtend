package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.BeforeClass
import org.junit.runners.Parameterized.Parameters

class UMLSigdataValidatorTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Signal Data Access: OK",
			    '''
			    this;
			    sigdata.integerAttribute;''',
				"sendPong",
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
			]
		)
	}
	
}