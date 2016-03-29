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

import com.incquerylabs.emdw.umlintegration.queries.ReturnParameterInOperationMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.TypedMultiplicityElement
import org.eclipse.uml2.uml.Parameter
import com.incquerylabs.emdw.umlintegration.queries.VoidOperationMatch

class ReturnTypeRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new ReturnParameterMapping(engine),
			new VoidReturnTypeMapping(engine)
		}
	}
}

/**
 * Transforms a Parameter which is an Operation's return parameter to TypedMultiplicityElement.
 */
class ReturnParameterMapping extends AbstractObjectMapping<ReturnParameterInOperationMatch, Parameter, TypedMultiplicityElement> {

	new(IncQueryEngine engine) {
		super(engine)
	}

	override getXtumlrtClass() {
		TypedMultiplicityElement
	}
	
	public static val PRIORITY = OperationMapping.PRIORITY + 1

	override getRulePriority() {
		PRIORITY
	}

	override getQuerySpecification() {
		returnParameterInOperation
	}

	override getUmlObject(ReturnParameterInOperationMatch match) {
		match.returnParameter
	}

	override createXtumlrtObject() {
		commonFactory.createTypedMultiplicityElement
	}

	override updateXtumlrtObject(TypedMultiplicityElement xtumlrtObject, ReturnParameterInOperationMatch match) {
		val umlObject = match.umlObject
		xtumlrtObject.type = TransformationUtil.getCommonType(umlObject.type, engine)

		xtumlrtObject.upperBound = umlObject.upper
		xtumlrtObject.lowerBound = umlObject.lower
		xtumlrtObject.ordered = umlObject.isOrdered
		xtumlrtObject.unique = umlObject.isUnique
	}
	
	def getXtumlrtContainer(ReturnParameterInOperationMatch match) {
		match.operation.findXtumlrtObject(Operation)
	}

	override protected insertXtumlrtObject(TypedMultiplicityElement xtumlrtObject, ReturnParameterInOperationMatch match) {
		match.xtumlrtContainer.returnType = xtumlrtObject
	}
	
}

/**
 * Adds void type TypedMultiplicityElement as return type to operations with null return type.
 */
class VoidReturnTypeMapping extends AbstractObjectMapping<VoidOperationMatch, org.eclipse.uml2.uml.Operation, TypedMultiplicityElement> {
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override protected getXtumlrtClass() {
		TypedMultiplicityElement
	}
	
	public static val PRIORITY = OperationMapping.PRIORITY + 1
	
	override getRulePriority() {
		PRIORITY
	}
	
	override getQuerySpecification() {
		voidOperation
	}
	
	override protected getUmlObject(VoidOperationMatch match) {
		match.operation
	}
	
	override protected createXtumlrtObject() {
		commonFactory.createTypedMultiplicityElement
	}
	
	override protected updateXtumlrtObject(TypedMultiplicityElement xtumlrtObject, VoidOperationMatch match) {
		// Null type is mapped to void in xtUML
		xtumlrtObject.type = TransformationUtil.getCommonType(null, engine)
	}
	
	def getXtumlrtContainer(VoidOperationMatch match) {
		match.operation.findXtumlrtObject(Operation)
	}
	
	override protected insertXtumlrtObject(TypedMultiplicityElement xtumlrtObject, VoidOperationMatch match) {
		match.xtumlrtContainer.returnType = xtumlrtObject
	}
}
