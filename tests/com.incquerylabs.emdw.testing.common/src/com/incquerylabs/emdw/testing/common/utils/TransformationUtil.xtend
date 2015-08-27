package com.incquerylabs.emdw.testing.common.utils

import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import java.util.Map
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent

class TransformationUtil {

	TransformationQrt xtTrafo
	XtumlCPPTransformationQrt cppTrafo
	XtumlComponentCPPTransformation compTrafo
	AdvancedIncQueryEngine engine

	def initializeTransformation(ResourceSet rs, Map<org.eclipse.uml2.uml.Type, Type> primitiveTypeMapping) {
		engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(rs))
		xtTrafo = new TransformationQrt
		xtTrafo.externalTypeMap = primitiveTypeMapping
		xtTrafo.initialize(engine)
		cppTrafo = new XtumlCPPTransformationQrt
		cppTrafo.initialize(engine)
		compTrafo = new XtumlComponentCPPTransformation
		compTrafo.initialize(engine)
	}

	def executeXtTransformation() {
		xtTrafo.execute
	}

	def executeCppTransformation() {
		cppTrafo.execute
	}

	def executeCppComponentTransformation() {
		compTrafo.execute
	}

	def executeCppComponentTransformation(XTComponent component) {
		compTrafo.execute(component)
	}

	def executeAllTransformation() {
		xtTrafo.execute
		cppTrafo.execute
		compTrafo.execute
	}

	def cleanupTransformation() {
		if (xtTrafo != null) {
			xtTrafo.dispose
		}
		if (cppTrafo != null) {
			cppTrafo.dispose
		}
		if (compTrafo != null) {
			compTrafo.dispose
		}
		if (engine != null) {
			engine.dispose
		}
	}

	def getTransformationEngine() {
		return engine
	}

}