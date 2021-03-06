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

import com.incquerylabs.emdw.umlintegration.queries.MultiplicityElementMatch
import com.incquerylabs.emdw.umlintegration.util.TransformationUtil
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.MultiplicityElement
import org.eclipse.uml2.uml.Element

class MultiplicityElementRules {
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new MultiplicityElementMapping(engine)
		}
	}
}

class MultiplicityElementMapping extends AbstractMapping<MultiplicityElementMatch> {

	new(IncQueryEngine engine) {
		super(engine)
	}
	
	public static val int PRIORITY = Math.max(Math.max(Math.max(
		XTAssociationMapping.PRIORITY, 
		ClassAttributeMapping.PRIORITY),
		SignalAttributeMapping.PRIORITY),
		OperationMapping.PRIORITY
	) + 1

	override int getRulePriority() {
		PRIORITY
	}
	
	protected def getUmlObject(MultiplicityElementMatch match) {
		return match.multiplicityElement
	}
	
	protected def getXtumlrtClass() {
		MultiplicityElement
	}
	
	protected def updateXtumlrtObject(MultiplicityElementMatch match) {
		val multiplicityElement = match.multiplicityElement
		val xtMultiplicityElement = findXtumlrtObject(match.multiplicityElement, MultiplicityElement)
		if(xtMultiplicityElement == null){
			return
		}
		xtMultiplicityElement.lowerBound = multiplicityElement.lower
		xtMultiplicityElement.upperBound = multiplicityElement.upper
	}
	
	override getQuerySpecification() {
		multiplicityElement
	}
	
	override def appeared(MultiplicityElementMatch match) {
		val umlObject = match.umlObject
		updateXtumlrtObject(match)
		logger.debug('''Transformed «TransformationUtil.getDebugRepresentation(umlObject)»''')
	}
	
	override def updated(MultiplicityElementMatch match) {
		val umlObject = match.umlObject
		val trace = findTraceMatch(umlObject)
		val xtumlrtObject = xtumlrtClass.cast(trace.xtumlrtElement)
		updateXtumlrtObject(match)
		logger.debug('''Updated xtumlrt object «TransformationUtil.getDebugRepresentation(xtumlrtObject)»''')
	}
	
	override def disappeared(MultiplicityElementMatch match) {
	}
	
	private def findTraceMatch(Element umlObject) {
		engine.trace.getAllMatches(rootMapping, null, umlObject, null).filter[xtumlrtClass.isAssignableFrom(xtumlrtElement.class)].head
	}
	
}