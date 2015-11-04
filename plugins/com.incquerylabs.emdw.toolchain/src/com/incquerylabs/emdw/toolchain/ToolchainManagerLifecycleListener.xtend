package com.incquerylabs.emdw.toolchain

import org.eclipse.incquery.runtime.api.IncQueryEngineLifecycleListener
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.api.IPatternMatch

class ToolchainLifecycleListener implements IncQueryEngineLifecycleListener {
	val Toolchain toolchain
	val ToolchainBuilder toolchainBuilder

	new(ToolchainBuilder builder, Toolchain toolchain) {
		this.toolchainBuilder = builder
		this.toolchain = toolchain
	}
	
	override engineBecameTainted(String message, Throwable t) { }
	
	override engineDisposed() {
		toolchainBuilder.disposeToolchain(toolchain)
	}
	
	override engineWiped() {
		toolchainBuilder.disposeToolchain(toolchain)
	}
	
	override matcherInstantiated(IncQueryMatcher<? extends IPatternMatch> matcher) { }
	
}