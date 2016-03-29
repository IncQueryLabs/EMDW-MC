/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.toolchain

import org.eclipse.incquery.runtime.api.IncQueryEngineLifecycleListener
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.api.IPatternMatch

class ToolchainLifecycleListener implements IncQueryEngineLifecycleListener {
	val Toolchain toolchain

	new(Toolchain toolchain) {
		this.toolchain = toolchain
	}
	
	override engineBecameTainted(String message, Throwable t) { }
	
	override engineDisposed() {
		ToolchainManager.disposeToolchain(toolchain)
	}
	
	override engineWiped() {
		ToolchainManager.disposeToolchain(toolchain)
	}
	
	override matcherInstantiated(IncQueryMatcher<? extends IPatternMatch> matcher) { }
	
}