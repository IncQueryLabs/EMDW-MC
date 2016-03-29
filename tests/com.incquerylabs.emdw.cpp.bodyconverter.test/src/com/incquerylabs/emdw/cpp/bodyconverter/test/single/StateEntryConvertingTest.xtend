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
package com.incquerylabs.emdw.cpp.bodyconverter.test.single

import java.util.Collection
import org.junit.runners.Parameterized.Parameters

class StateEntryConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Send new signal from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send new Pong::ping_s() to this->pong.one();
				''',
				'''
				::model::Comp::Pong::ping_s_event* __ping_s_ralf_0 = new ::model::Comp::Pong::ping_s_event();

				::xumlrt::select_any(this->R1_pong)->generate_external_event(__ping_s_ralf_0);'''
			],
			#[  "Re-send sigdata from state entry action",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Ping::Ping_SM::Region1::s2",
				ConversionType.StateEntry,
				'''
				send sigdata to this->pong.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* __pong_s_ralf_0 = casted_const_event->clone();
				::xumlrt::select_any(this->R1_pong)->generate_external_event(__pong_s_ralf_0);'''
			],
			#[  "Unlink expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'is joined by'.one();
				R3::unlink('joins'=>this,'is joined by'=>cd);
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Called* cd = ::xumlrt::select_any(this->R3_is_joined_by);
				this->R3_is_joined_by = nullptr;
				cd->R3_joins = nullptr;'''
			],
			#[  "Link expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Called cd = this->'is joined by'.one();
				R3::link('joins'=>this,'is joined by'=>cd);
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Called* cd = ::xumlrt::select_any(this->R3_is_joined_by);
				this->R3_is_joined_by = cd;
				cd->R3_joins = this;'''
			],
			#[  "Delete expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'is being run / handled by'.one();
				delete service;
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Service* service = ::xumlrt::select_any(this->R6_is_being_run___handled_by);
				delete service;'''
			],
			#[  "Pointer equality expression test (PhoneX)",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml",
				"PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Call::CallStateMachine::DefaultRegion::Terminated",
				ConversionType.StateEntry,
				'''
				Service service = this->'is being run / handled by'.one();
				Integer x = 1;
				if(service == null){
				};
				if(x == 0){
				}
				''',
				'''
				::PhoneX::ComponentLibrary::PhoneX::ImplementationPkg::Service* service = ::xumlrt::select_any(this->R6_is_being_run___handled_by);
				long x = 1;
				if ((service == nullptr)) {
				
				}
				;
				if ((x == 0)) {
				
				}'''
			]
		)
	}
}

