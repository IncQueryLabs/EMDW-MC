package com.incquerylabs.emdw.umlintegration.rules

import com.incquerylabs.emdw.umlintegration.queries.ParameterInOperationMatch
import com.incquerylabs.emdw.umlintegration.queries.ParameterMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.Type
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine

class ParameterRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ParameterMapping(engine),
			new ParameterInOperationMapping(engine)
			// TODO ParameterInSignal
		}
	}
}

/**
 * Transforms Parameters which are an Operation's non-return parameters to Parameters.
 */
class ParameterMapping extends AbstractObjectMapping<ParameterMatch, org.eclipse.uml2.uml.Parameter, Parameter> {

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

	override createXtumlrtObject() {
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

/**
 * Inserts Parameters to their parent Operation.
 */
class ParameterInOperationMapping extends AbstractContainmentMapping<ParameterInOperationMatch, Operation, Parameter> {

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
		match.operation.findXtumlrtObject(Operation)
	}
	
	override findChild(ParameterInOperationMatch match) {
		match.parameter.findXtumlrtObject(Parameter)
	}

	override insertChild(Operation parent, Parameter child) {
		parent.parameters += child
	}

}