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