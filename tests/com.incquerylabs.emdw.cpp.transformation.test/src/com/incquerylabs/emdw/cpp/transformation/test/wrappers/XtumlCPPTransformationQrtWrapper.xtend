package com.incquerylabs.emdw.cpp.transformation.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class XtumlCPPTransformationQrtWrapper extends TransformationWrapper {
	
	XtumlCPPTransformationQrt xform;
	AdvancedIncQueryEngine engine;
	
	def getIncQueryEngine() {
		engine
	}
	
	override initializeTransformation(CPPModel cppModel) {
		throw new UnsupportedOperationException("Initialization is performed based on Resource instead of CPPModel")
	}
	
	def initializeTransformation(Resource xtResource) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtResource.resourceSet))
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