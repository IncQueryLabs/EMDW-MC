package com.incquerylabs.emdw.cpp.transformation.test.wrappers

import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel

class DummyWrapper extends TransformationWrapper {


	override executeTransformation() {
		info("This is a dummy transformation")
	}

	override cleanupTransformation() {
		info("This is a dummy transformation")
	}
	
	override initializeTransformation(CPPModel cppmodel) {
		info("This is a dummy transformation")
	}
	
}
