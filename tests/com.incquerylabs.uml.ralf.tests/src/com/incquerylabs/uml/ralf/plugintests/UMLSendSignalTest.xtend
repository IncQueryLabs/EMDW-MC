package com.incquerylabs.uml.ralf.plugintests

import com.incquerylabs.uml.ralf.tests.util.basetests.AbstractPluginValidatorTest
import java.util.Collection
import org.junit.BeforeClass
import org.junit.runners.Parameterized.Parameters
import com.incquerylabs.uml.ralf.ReducedAlfSystem

class UMLSendSignalTest extends AbstractPluginValidatorTest{
	@BeforeClass
	def static void setup(){
		modelName = "/com.incquerylabs.uml.ralf.tests/model/model.uml"
		init()
	}
	
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Invalid send target: a class reference is not enough",
			    '''
				Pong p = null;
				ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
				send s to Pong;''',
				"model::Comp::Pong::TestOperation",
			    #["null"]
			],
			#[  "Trying to send to null local variable - OK",
                '''
                Pong p = null;
                ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
                send s to p->ping.one();''',
                "model::Comp::Pong::TestOperation",
                #[]
            ],
            #[  "Trying to send null signal local variable - OK",
                '''
                ping_s s = null;
                send s to this->ping.one();''',
                "model::Comp::Pong::TestOperation",
                #[]
            ],
            #[  "Sending null directly",
                '''
                send null to this->ping.one();''',
                "model::Comp::Pong::TestOperation",
                #["null"]
            ],
            #[  "Sending to null directly",
                '''
                ping_s s = new ping_s(integerAttribute => 2, pongAttribute => this);
                send s to null;''',
                "model::Comp::Pong::TestOperation",
                #["null"]
            ]
		)
	}
}