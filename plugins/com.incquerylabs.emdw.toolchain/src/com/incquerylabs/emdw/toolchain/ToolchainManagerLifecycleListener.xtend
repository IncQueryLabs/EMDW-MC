package com.incquerylabs.emdw.toolchain

import org.eclipse.incquery.runtime.api.IncQueryEngineLifecycleListener
import org.eclipse.incquery.runtime.api.IncQueryMatcher
import org.eclipse.incquery.runtime.api.IPatternMatch

class ToolchainManagerLifecycleListener implements IncQueryEngineLifecycleListener {
	val ToolchainManager manager
	val ToolchainManagerBuilder builder

	new(ToolchainManagerBuilder builder, ToolchainManager manager) {
		this.builder = builder
		this.manager = manager
	}
	
	override engineBecameTainted(String message, Throwable t) { }
	
	override engineDisposed() {
		builder.disposeToolchainManager(manager)
	}
	
	override engineWiped() {
		builder.disposeToolchainManager(manager)
	}
	
	override matcherInstantiated(IncQueryMatcher<? extends IPatternMatch> matcher) { }
	
}