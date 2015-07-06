package com.incquerylabs.emdw.cpp.transformation.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class XtumlCPPTransformationQrtWrapper extends TransformationWrapper {
	
	XtumlCPPTransformationQrt xform;
	AdvancedIncQueryEngine engine;
	
	public def getEngine() {
		engine
	}
	
	override initializeTransformation(CPPModel cppModel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppModel.eResource.resourceSet))
		xform = new XtumlCPPTransformationQrt
		xform.initialize(engine)
	}
	
	override executeTransformation() {
		xform.execute
		debug("Incremental xtumlrt2cpp transformation")
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