package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters
import org.junit.Ignore

@Ignore
class CollectionDescriptorTest extends AbstractSingleConversionTest {
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Unlink expression collection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service';
				R6::unlink('service'=>service,'call'=>this);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = this->R6_service;
				this->R6_service = NULL;
				__ralf__0__service->R6_call = NULL;
				'''
			],
			#[  "Link expression collection test",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::PhoneX::Implementation::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'service';
				R6::link('service'=>service,'call'=>this);
				''',
				'''
				::PhoneX::PhoneX::Implementation::Service* __ralf__0__service = this->R6_service;
				this->R6_service = __ralf__0__service;
				__ralf__0__service->R6_call = this;
				'''
			]
		)
	}
}