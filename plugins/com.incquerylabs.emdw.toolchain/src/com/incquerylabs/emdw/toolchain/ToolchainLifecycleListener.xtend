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