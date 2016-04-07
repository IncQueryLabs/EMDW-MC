/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.monitor

import org.eclipse.incquery.runtime.api.IncQueryEngineLifecycleListener
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.api.IPatternMatch

class XtumlMonitorEngineLifecycleListener implements IncQueryEngineLifecycleListener {
	private XtumlModelChangeMonitor monitor;
	
	new (XtumlModelChangeMonitor monitor) {
		this.monitor = monitor
	}
	
	override engineDisposed() {
		monitor?.dispose
	}
	
	override engineWiped() {
		monitor?.dispose
	}
	
	override matcherInstantiated(IncQueryMatcher<? extends IPatternMatch> matcher) {}
	
	override engineBecameTainted(String message, Throwable t) {}
}