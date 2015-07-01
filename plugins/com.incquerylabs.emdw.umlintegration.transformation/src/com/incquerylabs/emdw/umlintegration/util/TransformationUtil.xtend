package com.incquerylabs.emdw.umlintegration.util

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.State

class TransformationUtil {

	static val commonFactory = CommonFactory.eINSTANCE
	static val traceFactory = TraceFactory.eINSTANCE

	static def void updateState(org.eclipse.papyrusrt.xtumlrt.common.State it, State umlState) {
		if (umlState.entry != null) {
			entryAction = commonFactory.createActionCode => [
				source = ModelUtil.getCppCode(umlState.entry)
			]
		}
		if (umlState.exit != null) {
			exitAction = commonFactory.createActionCode => [
				source = ModelUtil.getCppCode(umlState.exit)
			]
		}
	}
	
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
	
	static def getCommonType(org.eclipse.uml2.uml.Type umlType, IncQueryEngine engine) {
		extension val Trace tracePatterns = Trace.instance
		val Structure structurePatterns = Structure.instance
		val voidDummyTypeMatcher = structurePatterns.getNamedDataType(engine)
		val voidDummyType = voidDummyTypeMatcher.getAllValuesOfdataType(TransformationQrt.dummyVoidTypeName).head
		
		// Null types in UML are mapped to void types in xtUML!
		// A dummy void type is used to handle this in the trace model.
		var typeToConvert = umlType
		if (typeToConvert == null) {
			 typeToConvert = voidDummyType
		}
		val commonType = engine.trace.getAllValuesOfxtumlrtElement(null, null, typeToConvert).head
		
		if(commonType instanceof Type){
			return commonFactory.createTypedMultiplicityElement => [
				type = commonType
			]
		} else {
			return null
		}
	}
}