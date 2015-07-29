package com.incquerylabs.emdw.cpp.common.test.wrappers

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import java.util.Map
import org.eclipse.uml2.uml.Type

class UmlCppTransformationWrapper extends TransformationWrapper {
	
	TransformationQrt xform_1
	XtumlCPPTransformationQrt xform_2
	AdvancedIncQueryEngine engine
	
	override initializeTransformation(ResourceSet rs, Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(rs))
		xform_1 = new TransformationQrt
		xform_1.externalTypeMap = primitiveTypeMapping
		xform_1.initialize(engine)
		xform_2 = new XtumlCPPTransformationQrt
		xform_2.initialize(engine)
	}
	
	override executeTransformation() {
		xform_1.execute
		xform_2.execute
	}
	
	override cleanupTransformation() {
		if(xform_1 != null) {
			xform_1.dispose
		}
		if(xform_2 != null) {
			xform_2.dispose
		}
		if(engine != null) {
			engine.dispose
		}
	}
	
	override getEngine() {
		return engine
	}
	
}