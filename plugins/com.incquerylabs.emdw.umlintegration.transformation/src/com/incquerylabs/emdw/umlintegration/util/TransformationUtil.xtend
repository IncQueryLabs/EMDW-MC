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
package com.incquerylabs.emdw.umlintegration.util

import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.Element
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Property
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAction
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlFactory
import org.eclipse.uml2.uml.NamedElement

class TransformationUtil {

	static val commonFactory = CommonFactory.eINSTANCE
	static val traceFactory = TraceFactory.eINSTANCE
	static val xtumlFactory = XtumlFactory.eINSTANCE
	
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
	
	static def Type getCommonType(org.eclipse.uml2.uml.Type umlType, IncQueryEngine engine) {
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
			return commonType
		} else {
			return null
		}
	}
	
	static def updateAttribute(Property property, Attribute attribute, Type xtType){
		if(property.type != null){
			attribute.type = xtType
		}
		attribute.static = property.static
		attribute.visibility = TransformationUtil.transform(property.visibility)
		
		attribute.lowerBound = property.lower
		attribute.upperBound = property.upper
		attribute.ordered = property.isOrdered
		attribute.unique = property.isUnique
	}
	
	static def mapXTAction(BodyOwner bodyOwner, XTAction xtAction){
		if(xtAction != null) {
			xtAction.body.clear
			val actionSize = Math.min(bodyOwner.languages.size, bodyOwner.bodies.size)
			for(index : 0 ..< actionSize) {
				xtAction.body += xtumlFactory.createXTActionBody => [
					it.language = bodyOwner.languages.get(index)
					it.source = bodyOwner.bodies.get(index)
				]
			}
		}
	}
	
	static def String getDebugRepresentation(EObject eObject) {
		switch(eObject){
			NamedElement: eObject.name
			org.eclipse.papyrusrt.xtumlrt.common.NamedElement: eObject.name
			com.incquerylabs.emdw.umlintegration.trace.Trace: 
				'''[«FOR umlElement : eObject.umlElements SEPARATOR ", "»«umlElement.debugRepresentation»«ENDFOR» <-> «FOR xumlrtElement : eObject.xtumlrtElements SEPARATOR ", "»«xumlrtElement.debugRepresentation»«ENDFOR»]'''
			default: eObject.toString 				
		}
	}
}