/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.rules

import com.google.common.base.Optional
import com.incquerylabs.emdw.umlintegration.queries.ParameterInOperationMatch
import com.incquerylabs.emdw.umlintegration.queries.ParameterMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.Type

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
	
	public static val PRIORITY = CommonPriorities.TYPE_MAPPING_PRIORITY + 2

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
		if(umlObject.type != null){
			val type = engine.trace.getAllValuesOfxtumlrtElement(null, null, umlObject.type).filter(Type).head
			if(type != null){
				xtumlrtObject.type = type
			}
		}
		xtumlrtObject.direction = TransformationUtil.transform(umlObject.direction)
		
		xtumlrtObject.upperBound = umlObject.upper
		xtumlrtObject.lowerBound = umlObject.lower
		xtumlrtObject.ordered = umlObject.isOrdered
		xtumlrtObject.unique = umlObject.isUnique
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

	override insertChild(Operation parent, Parameter child, ParameterInOperationMatch match) {
		val parameters = parent.parameters
		if(parameters.empty){
			parameters += child
		} else {
			// keep ordering of parameters
			val umlOperation = match.operation
			val umlParameter = match.parameter
			
			val umlParameters = umlOperation.ownedParameters
			val umlIndex = umlParameters.indexOf(umlParameter)
			
			// take the elements after the current one (may be empty)
			val firstMappedParam = umlParameters.subList(umlIndex + 1, umlParameters.size)
				// find their corresponding xUML-RT pair (Optional needed since map forbids nulls)
				.map[Optional.fromNullable(findXtumlrtObject(Parameter))]
				// find the first one that is already mapped
				.findFirst[present && parameters.contains(get)]
			if(firstMappedParam == null){
				// the currently processed parameter is the last
				parameters += child
			} else {
				// insert at the index currently used by the next one
				val xumlrtIndex = parameters.indexOf(firstMappedParam.get)
				parameters.add(xumlrtIndex, child)
			}
			
		}
	}

}