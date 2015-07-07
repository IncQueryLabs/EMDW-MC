package com.incquerylabs.emdw.cpp.transformation.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope

class XtumlCPPTransformationWrapper extends TransformationWrapper {
	
	XtumlComponentCPPTransformation xform
	AdvancedIncQueryEngine engine
	
	override initializeTransformation(CPPModel cppmodel) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(cppmodel.eResource.resourceSet))
		xform = new XtumlComponentCPPTransformation
		xform.initialize(engine)
	}
	
	override executeTransformation() {
		xform.execute
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