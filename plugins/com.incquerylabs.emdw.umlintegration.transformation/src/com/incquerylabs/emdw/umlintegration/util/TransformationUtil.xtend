package com.incquerylabs.emdw.umlintegration.util

import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.ParameterDirectionKind
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.uml2.uml.Element
import org.eclipse.emf.ecore.EObject

class TransformationUtil {

	static val commonFactory = CommonFactory.eINSTANCE
	static val traceFactory = TraceFactory.eINSTANCE
	
	static def transform(org.eclipse.uml2.uml.VisibilityKind kind) {
		switch kind {
			case PRIVATE_LITERAL: VisibilityKind.PRIVATE
			case PROTECTED_LITERAL: VisibilityKind.PROTECTED
			case PUBLIC_LITERAL: VisibilityKind.PUBLIC
		}
	}
	
	static def transform(ParameterDirectionKind kind) {
		switch kind {
			case IN_LITERAL: DirectionKind.IN
			case OUT_LITERAL: DirectionKind.OUT
			case INOUT_LITERAL: DirectionKind.IN_OUT
		}
	}
	
	static def createTrace(RootMapping rootMapping, Element umlElement, EObject xtumlElement) {
		val trace = traceFactory.createTrace => [
			umlElements += umlElement
			xtumlrtElements += xtumlElement
		]
		rootMapping.traces += trace
		trace
	}
}