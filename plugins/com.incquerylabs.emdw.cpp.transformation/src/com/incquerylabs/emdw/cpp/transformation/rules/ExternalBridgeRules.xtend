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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalBridge
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalHeader
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors

class ExternalBridgeRules {
	static extension val XtumlQueries xtUmlQueries = XtumlQueries.instance
	static extension val CppQueries cppQueries = CppQueries.instance
	
	extension val Logger logger = Logger.getLogger(class)
	extension val BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val IncQueryEngine engine
	extension val BatchTransformationStatements statements
	extension val IncludeRules includeRules
	
	val OperationRules operationRules
	
	
	new(
		IncQueryEngine engine,
		BatchTransformationStatements statements,
		OperationRules operationRules,
		IncludeRules includeRules
	) {
		this.engine = engine
		this.statements = statements
		this.operationRules = operationRules
		this.includeRules = includeRules
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			externalBridgeInComponentRule,
			externalBridgeInPackageRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val externalBridgeInComponentRule = createRule.precondition(cppBridgesInComponent).action[ match |
		val xtClass = match.xtClass
		val cppComponent = match.cppComponent
		
		val cppExternalBridge = match.cppExternalBridge
		val result = cppExternalBridge.copyExternalBridge
		
		val newExternalBridge = result.filter(CPPExternalBridge).head => [
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = xtClass]
		]
		cppComponent.subElements += newExternalBridge
		cppComponent.headerDirectory.files += result.filter(CPPHeaderFile)
		cppComponent.bodyDirectory.files += result.filter(CPPBodyFile)
		val externalLibrary = engine.getCppExternalLibrary.oneArbitraryMatch?.cppExternalLibrary
		externalLibrary.externalHeader += result.filter(CPPExternalHeader)
		trace('''Copied CPPExternalBridge «cppExternalBridge» to the component «cppComponent»''')
		transformSubElements(newExternalBridge)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val externalBridgeInPackageRule = createRule.precondition(cppBridgesInPackage).action[ match |
		val xtClass = match.xtClass
		val cppPackage = match.cppPackage
		val cppExternalBridge = match.cppExternalBridge
		val result = cppExternalBridge.copyExternalBridge
		
		val newExternalBridge = result.filter(CPPExternalBridge).head => [
			ooplNameProvider = createOOPLExistingNameProvider => [commonNamedElement = xtClass]
		]
		cppPackage.subElements += newExternalBridge
		cppPackage.headerDir.files += result.filter(CPPHeaderFile)
		cppPackage.bodyDir.files += result.filter(CPPBodyFile)
		val externalLibrary = engine.getCppExternalLibrary.oneArbitraryMatch?.cppExternalLibrary
		externalLibrary.externalHeader += result.filter(CPPExternalHeader)
		trace('''Copied CPPExternalBridge «cppExternalBridge» to the component «cppPackage»''')
		transformSubElements(newExternalBridge)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val addReferencesRule = createRule.precondition(cppExternalBridgeInQualifiedNamedElement).action[ match |
		updateSubElements(match.cppExternalBridge)
	].build
	
	def copyExternalBridge(CPPExternalBridge cppExternalBridge) {
		val cppHeader = cppExternalBridge.headerFile
		val cppBody = cppExternalBridge.bodyFile
		val externalHeaderInclusion = cppBody.externalHeaderInclusion.head
		val externalHeader = externalHeaderInclusion?.externalHeader
		
		val objectsToCopy = #[
			cppExternalBridge,
			cppHeader,
			cppBody,
			externalHeader
		]
		
		return EcoreUtil.copyAll(objectsToCopy)
	}
	
	
	def addIncludes(CPPExternalBridge cppExternalBridge){
		cppExternalBridge.addIncludesBetweenOwnFiles
		fireAllCurrent(includeRules.externalBridgeComponentIncludeRule, [it.cppExternalBridge == cppExternalBridge])
		
		// External includes for model independent generated code
		val cppHeader = cppExternalBridge.headerFile
		val iostreamExternalHeader = getExternalHeader("<iostream>")
		cppHeader.addInclude(iostreamExternalHeader, "standard io")
		
	}
	
	def transformSubElements(CPPExternalBridge cppExternalBridge){
		fireAllCurrent(operationRules.entityOperationRule, [it.cppElement == cppExternalBridge])
	}
	
	def updateSubElements(CPPExternalBridge cppExternalBridge){
		fireAllCurrent(operationRules.addReferencesRule, [it.container == cppExternalBridge])
		addIncludes(cppExternalBridge)
	}
}