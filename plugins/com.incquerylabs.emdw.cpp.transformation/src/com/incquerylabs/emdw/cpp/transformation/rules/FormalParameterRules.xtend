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

import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPParameterPassingKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.transformation.util.CPPTransformationUtil
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class FormalParameterRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val IncQueryEngine engine
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CPPTransformationUtil transformationUtil = new CPPTransformationUtil
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	extension val ClassReferenceRules classReferenceRules
	extension val SequenceRules sequenceRules
	extension val IncludeRules includeRules
	
	new(IncQueryEngine engine, BatchTransformationStatements statements, ClassReferenceRules classReferenceRules, SequenceRules sequenceRules, IncludeRules includeRules) {
		this.engine = engine
		this.statements = statements
		this.classReferenceRules = classReferenceRules
		this.sequenceRules = sequenceRules
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			operationParameterRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val operationParameterRule = createRule.precondition(cppOperationParameter).action[ match |
		val cppOperation = match.cppOperation
		val parameter = match.parameter
		
		val cppFormalParameter = createCPPFormalParameter => [
			commonParameter = parameter
			ooplNameProvider = createOOPLExistingNameProvider => [ commonNamedElement = parameter ]
		]
		cppOperation.subElements += cppFormalParameter
		
		if(parameter.type instanceof XTClass) {
			val classReference = createClassReference(parameter)
			cppFormalParameter.subElements.add(classReference)
			fireAllCurrent(classReferenceSimpleCollectionTypeRule, [it.classReferenceSimpleCollection == classReference])
		} else if(parameter.multiValue){
			addUnnamedSequence(cppFormalParameter, parameter)
		}
		
		cppFormalParameter.setPassingKind(parameter)
		
		trace('''Mapped Parameter «parameter.name» in Operation «match.operation.name» to CPPFormalParameter''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppFormalParameter).action[ match |
		val cppFormalParameter = match.cppFormalParameter
		val classReference = cppFormalParameter.subElements.filter(OOPLDataType).head
		if(classReference != null){
			fireAllCurrent(classReferenceRules.addReferencesRule, [it.cppClassReference == classReference])
		}
		cppFormalParameter.addSequenceReferences
		addIncludes(match.cppFormalParameter)
		
	].build
	
	def CPPQualifiedNamedElement createClassReference(Parameter parameter){
		val xtReferenceClass = parameter.type as XTClass
		val classReference = createClassReference(xtReferenceClass, parameter) as CPPQualifiedNamedElement
		return classReference
	}
	
	def addUnnamedSequence(CPPFormalParameter cppFormalParameter, Parameter parameter) {
		cppFormalParameter.unnamedSequenceType = generateCPPSequence(parameter)
	}
	
	def addSequenceReferences(CPPFormalParameter cppFormalParameter) {
		if(cppFormalParameter.unnamedSequenceType != null) {
			fireAllCurrent(cppSequenceTypeRule, [it.cppElement == cppFormalParameter])
			fireAllCurrent(cppSequenceImplementationRule, [it.cppSequence == cppFormalParameter.unnamedSequenceType])
		}
	}
	
	def addIncludes(CPPQualifiedNamedElement cppElement) {
		fireAllCurrent(includeForAttributeOrParameterRule, [it.cppElement == cppElement])
	}
	
	def setPassingKind(CPPFormalParameter cppFormalParameter, Parameter parameter) {
		if (parameter.type instanceof XTClass && !parameter.multiValue) {
			cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
		} else {
			switch parameter.direction {
				case DirectionKind.IN : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_VALUE
				case DirectionKind.OUT : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
				case DirectionKind.IN_OUT : cppFormalParameter.passingMode = CPPParameterPassingKind.BY_REFERENCE
			}
		}
		return;
	}
	
}