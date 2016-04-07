/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk, Istvan Papp - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.xtend.lib.annotations.Accessors

class ClassEventRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	val AttributeRules attributeRules
	
	new(BatchTransformationStatements statements,
		AttributeRules attributeRules
	) {
		this.statements = statements
		this.attributeRules = attributeRules
	}
	
	@Accessors(PUBLIC_GETTER)
	val eventRule = createRule.precondition(cppClassEvents).action[ match |
		val event = match.event
		val cppEvent = createCPPEvent => [
			xtEvent = event
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = event ]
		]
		match.cppClass.subElements += cppEvent
		trace('''Mapped XTEvent «event.name» in state machine of «match.xtClass.name» to CPPEvent''')
		fireAllCurrent(attributeRules.classEventAttributeRule, [it.cppEvent == cppEvent])
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppEventInQualifiedNamedElement).action[ match |
		val cppEvent = match.cppEvent
		fireAllCurrent(attributeRules.addReferencesRule, [it.container == cppEvent])
	].build
}
