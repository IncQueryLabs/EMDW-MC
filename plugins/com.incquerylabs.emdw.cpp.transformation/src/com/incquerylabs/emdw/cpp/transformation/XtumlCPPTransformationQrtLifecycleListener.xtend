package com.incquerylabs.emdw.cpp.transformation

import org.eclipse.incquery.runtime.api.IPatternMatch
import org.eclipse.incquery.runtime.api.IncQueryEngineLifecycleListener
import org.eclipse.incquery.runtime.api.IncQueryMatcher

class XtumlCPPTransformationQrtLifecycleListener implements IncQueryEngineLifecycleListener {
	private val XtumlCPPTransformationQrt transformation
	private val XtumlCPPTransformationQrtManager manager
	
	new(XtumlCPPTransformationQrtManager manager, XtumlCPPTransformationQrt transformation) {
		this.transformation = transformation
		this.manager = manager
	}
	
	override engineDisposed() {
		manager.disposeQrtTransformation(transformation)
	}
	
	override engineWiped() {
		manager.disposeQrtTransformation(transformation)
	}
	
	override engineBecameTainted(String message, Throwable t) { }
	
	override matcherInstantiated(IncQueryMatcher<? extends IPatternMatch> matcher) { }
}
