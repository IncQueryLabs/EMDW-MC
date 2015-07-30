package com.incquerylabs.emdw.cpp.common.test.wrappers

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import java.util.Map
import org.eclipse.uml2.uml.Type
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation

class UmlCppTransformationWrapper extends TransformationWrapper {
	
	TransformationQrt xtTrafo
	XtumlCPPTransformationQrt cppTrafo
	XtumlComponentCPPTransformation compTrafo
	AdvancedIncQueryEngine engine
	
	override initializeTransformation(ResourceSet rs, Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(rs))
		xtTrafo = new TransformationQrt
		xtTrafo.externalTypeMap = primitiveTypeMapping
		xtTrafo.initialize(engine)
		cppTrafo = new XtumlCPPTransformationQrt
		cppTrafo.initialize(engine)
		compTrafo = new XtumlComponentCPPTransformation
		compTrafo.initialize(engine)
	}
	
	override executeTransformation() {
		xtTrafo.execute
		cppTrafo.execute
		compTrafo.execute
	}
	
	override cleanupTransformation() {
		if(xtTrafo != null) {
			xtTrafo.dispose
		}
		if(cppTrafo != null) {
			cppTrafo.dispose
		}
		if(compTrafo != null) {
			compTrafo.dispose
		}
		if(engine != null) {
			engine.dispose
		}
	}
	
	override getEngine() {
		return engine
	}
	
}