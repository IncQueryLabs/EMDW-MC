package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ParameterInOperationMatch
import com.incquerylabs.emdw.umlintegration.queries.ParameterMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import com.zeligsoft.xtumlrt.common.Operation
import com.zeligsoft.xtumlrt.common.Parameter
import com.zeligsoft.xtumlrt.common.Type
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ParameterRules {
	static def getRules(IncQueryEngine engine) {
		#{
			new ParameterMapping(engine).specification,
			new ParameterInOperationMapping(engine).specification
		}
	}
}

class ParameterMapping extends AbstractObjectRule<ParameterMatch, org.eclipse.uml2.uml.Parameter, Parameter> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		Parameter
	}
	
	public static val PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		parameter
	}

	override getUmlObject(ParameterMatch match) {
		match.parameter
	}

	override createXtumlrtObject(org.eclipse.uml2.uml.Parameter umlObject, ParameterMatch match) {
		commonFactory.createParameter
	}

	override updateXtumlrtObject(Parameter xtumlrtObject, ParameterMatch match) {
		val umlObject = match.umlObject
		switch type : engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).head {
			Type: xtumlrtObject.type = type
		}
		xtumlrtObject.direction = TransformationUtil.transform(umlObject.direction)
	}

	override protected insertXtumlrtObject(Parameter xtumlrtObject, ParameterMatch match) {
	}
	
}

class ParameterInOperationMapping extends AbstractContainmentRule<ParameterInOperationMatch, Operation, Parameter> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getRulePriority() {
		Math.max(OperationMapping.PRIORITY, ParameterMapping.PRIORITY) + 1
	}

	override getQuerySpecification() {
		parameterInOperation
	}

	override findParent(ParameterInOperationMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.operation).head as Operation
	}
	
	override findChild(ParameterInOperationMatch match) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, match.parameter).head as Parameter
	}

	override insertChild(Operation parent, Parameter child) {
		parent.parameters += child
	}

}