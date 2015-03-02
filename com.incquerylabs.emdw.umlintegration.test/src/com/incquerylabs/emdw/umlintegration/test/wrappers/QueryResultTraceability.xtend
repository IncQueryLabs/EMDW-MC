package com.incquerylabs.emdw.umlintegration.test.wrappers

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import traceability.UmlToCommon

class QueryResultTraceability extends TransformationWrapper {

	TransformationQrt xform
	AdvancedIncQueryEngine engine

	override initializeTransformation(UmlToCommon umlToCommon) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(umlToCommon.eResource.resourceSet))
		xform = new TransformationQrt
		xform.initialize(umlToCommon, engine)
	}

	override executeTransformation() {
		xform.execute
		debug("Query Result Traceability transformation is incremental")
	}

	override cleanupTransformation() {
		if (xform != null) {
			xform.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}
}
