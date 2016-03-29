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

class TransitionConvertingTest extends AbstractSingleConversionTest{
	@Parameters(name = "{0}")
	def static Collection<Object[]> testData() {
		newArrayList(
			#[  "Send new signal from transition effect",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::Pong_SM::Region1::e2",
				ConversionType.Transition,
				'''
				send new Ping::pong_s() to this->ping.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* __pong_s_ralf_0 = new ::model::Comp::Ping::pong_s_event();

				::xumlrt::select_any(this->R1_ping)->generate_external_event(__pong_s_ralf_0);'''
			],
			#[  "Single Conversion Test: Create and send new signal",
				"/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml",
				"model::Comp::Pong::Pong_SM::Region1::e2",
				ConversionType.Transition,
				'''
				Ping::pong_s event = new Ping::pong_s();
				send event to this->ping.one();
				''',
				'''
				::model::Comp::Ping::pong_s_event* event = new ::model::Comp::Ping::pong_s_event();

				::xumlrt::select_any(this->R1_ping)->generate_external_event(event);'''
			]
		)
	}
}

