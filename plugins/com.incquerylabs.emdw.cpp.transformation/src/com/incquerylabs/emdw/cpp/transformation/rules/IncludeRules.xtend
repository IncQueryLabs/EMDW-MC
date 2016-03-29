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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalBridge
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalHeader
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPStructMember
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import org.apache.log4j.Logger
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.viatra.emf.runtime.rules.BatchTransformationRuleGroup
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationRuleFactory
import org.eclipse.viatra.emf.runtime.rules.batch.BatchTransformationStatements
import org.eclipse.viatra.emf.runtime.transformation.batch.BatchTransformation
import org.eclipse.xtend.lib.annotations.Accessors
import com.incquerylabs.emdw.cpp.common.queries.StatefulClassQueries

class IncludeRules {
	static extension val CppQueries cppQueries = CppQueries.instance
	static extension val XtumlQueries xtumlQueries = XtumlQueries.instance
	static extension val StatefulClassQueries statefulClassQueries = StatefulClassQueries.instance
	
	extension val IncQueryEngine engine
	extension val Logger logger = Logger.getLogger(class)
	extension BatchTransformationRuleFactory factory = new BatchTransformationRuleFactory
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val BatchTransformationStatements statements
	
	new(IncQueryEngine engine, BatchTransformationStatements statements) {
		this.engine = engine
		this.statements = statements
	}
	
	def addRules(BatchTransformation transformation){
		val rules = new BatchTransformationRuleGroup(
			classComponentIncludeRule,
			packageComponentIncludeRule,
			superClassIncludeRule,
			includeForAttributeOrParameterRule,
			statemachineRuntimeIncludeRule,
			includeForStructMembersRule,
			eventsIncludeRule,
			componentRuntimeIncludesRule
		)
		transformation.addRules(rules)
	}
	
	@Accessors(PUBLIC_GETTER)
	val classComponentIncludeRule = createRule.precondition(cppClassInComponentSubPackages).action[ match |
		val cppClass = match.cppClass
		val cppComponent = match.cppComponent
		val componentDeclHeader = cppComponent.declarationHeaderFile
		val componentDefHeader = cppComponent.definitionHeaderFile
		val classHeader = cppClass.headerFile
		val classBody = cppClass.bodyFile
		
		classHeader.includedHeaders += componentDeclHeader
		classBody.includedHeaders += componentDefHeader
		componentDefHeader.includedHeaders += classHeader
		
		trace('''Added includes between «cppClass.cppName» and «cppComponent.cppName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val externalBridgeComponentIncludeRule = createRule.precondition(cppExternalBridgeInComponentSubPackages).action[ match |
		val cppExternalBridge = match.cppExternalBridge
		val cppComponent = match.cppComponent
		val componentDeclHeader = cppComponent.declarationHeaderFile
		val componentDefHeader = cppComponent.definitionHeaderFile
		val bridgeHeader = cppExternalBridge.headerFile
		val bridgeBody = cppExternalBridge.bodyFile

		bridgeHeader.includedHeaders += componentDeclHeader
		bridgeBody.includedHeaders += componentDefHeader
		componentDefHeader.includedHeaders += bridgeHeader
		
		trace('''Added includes between «cppExternalBridge.cppName» and «cppComponent.cppName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val packageComponentIncludeRule = createRule.precondition(cppPackageInComponentSubPackages).action[ match |
		val cppPackage = match.cppPackage
		val cppComponent = match.cppComponent
		val componentDeclHeader = cppComponent.declarationHeaderFile
		val componentDefHeader = cppComponent.definitionHeaderFile
		val packageHeader = cppPackage.headerFile
		val packageBody = cppPackage.bodyFile
		
		packageHeader.includedHeaders += componentDeclHeader
		packageBody.includedHeaders += componentDefHeader
		componentDefHeader.includedHeaders += packageHeader
		trace('''Added includes between «cppPackage.cppName» and «cppComponent.cppName»''')
	].build
	
	@Accessors(PUBLIC_GETTER)
	val superClassIncludeRule = createRule.precondition(cppSuperClasses).action[ match |
		val cppClass = match.cppClass
		val superClass = match.cppSuperClass
		cppClass.headerFile.addInclude(superClass.headerFile)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val includeForAttributeOrParameterRule = createRule.precondition(cppAttributeOrParameterForInclude).action[ match |
		val cppElement = match.cppElement
		val cppHeader = match.containerHeader
		addIncludesForMultiplicityElement(cppElement, cppHeader)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val includeForStructMembersRule = createRule.precondition(cppStructMemberForInclude).action[ match |
		val cppStructMember = match.cppStructMember
		val cppHeader = match.containerHeader
		addIncludesForMultiplicityElement(cppStructMember, cppHeader)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val statemachineRuntimeIncludeRule = createRule.precondition(topLevelStatefulClass).action[ match |
		val cppClass = match.cppClass
		val cppHeader = cppClass.headerFile
		val statefulClassExternalHeader = getExternalHeader('''"xumlrt_runtime/stateful_class.hh"''')
		cppHeader.addInclude(statefulClassExternalHeader, "Stateful Class superclass in Runtime")
	].build
	
	@Accessors(PUBLIC_GETTER)
	val eventsIncludeRule = createRule.precondition(cppClassEvents).action[ match |
		val cppClass = match.cppClass
		val cppHeader = cppClass.headerFile
		val eventExternalHeader = getExternalHeader('''"xumlrt_runtime/event.hh"''')
		cppHeader.addInclude(eventExternalHeader, "Event class in Runtime")
	].build
	
	@Accessors(PUBLIC_GETTER)
	val componentRuntimeIncludesRule = createRule.precondition(cppComponentStateMachine).action[
		val activeClassExternalHeader = getExternalHeader('''"xumlrt_runtime/active_component.hh"''')
		cppComponent.mainHeaderFile.addInclude(activeClassExternalHeader, "Active Component superclass in Runtime")
	].build
	
	dispatch def addIncludesForMultiplicityElement(CPPAttribute cppAttribute, CPPSourceFile cppSourceFile){
		val type = cppAttribute.type
		addIncludesForOOPLDataType(type, cppSourceFile, '''CPPAttribute «cppAttribute.cppName»''')
	}
	
	dispatch def addIncludesForMultiplicityElement(CPPFormalParameter cppFormalParameter, CPPSourceFile cppSourceFile){
		val type = cppFormalParameter.type
		addIncludesForOOPLDataType(type, cppSourceFile, '''CPPFormalParameter «cppFormalParameter.cppName»''')
	}
	
	dispatch def addIncludesForMultiplicityElement(CPPStructMember cppStructMember, CPPSourceFile cppSourceFile){
		val type = cppStructMember.type
		addIncludesForOOPLDataType(type, cppSourceFile, '''CPPStructMember «cppStructMember.cppName»''')
	}
	
	dispatch def void addIncludesForOOPLDataType(CPPBasicType cppBasicType, CPPSourceFile cppSourceFile, String comment){
		if(cppBasicType.commonType.name == "String"){
			cppSourceFile.addInclude(getExternalHeader("<string>"), comment)
		}
	}
//	
//	dispatch def void addIncludesForOOPLDataType(CPPStructType cppStructType, CPPSourceFile cppSourceFile, String comment){
//		cppStructType.members.forEach[ member |
//			addIncludesForOOPLDataType(member.type, cppSourceFile, comment)
//		]
//	}
	
	dispatch def void addIncludesForOOPLDataType(CPPSequence cppSequence, CPPSourceFile cppSourceFile, String comment){
		val externalHeaders = getExternalHeaders(cppSequence)
		cppSourceFile.addIncludes(externalHeaders, comment)
		val typeOfSequence = cppSequence.elementType
		addIncludesForOOPLDataType(typeOfSequence, cppSourceFile, comment)
	}
	
	dispatch def void addIncludesForOOPLDataType(CPPClassRefSimpleCollection cppClassReference, CPPSourceFile cppSourceFile, String comment){
		val externalHeaders = getExternalHeaders(cppClassReference)
		cppSourceFile.addIncludes(externalHeaders, comment)
	}
	
	dispatch def void addIncludesForOOPLDataType(OOPLDataType ooplDataType, CPPSourceFile cppSourceFile, String comment){
	}
	
	def addIncludesBetweenOwnFiles(CPPComponent cppComponent){
		val mainHeader = cppComponent.mainHeaderFile
		val mainBody = cppComponent.mainBodyFile
		val declHeader = cppComponent.declarationHeaderFile
		val defHeader = cppComponent.definitionHeaderFile
		mainHeader.addInclude(declHeader)
		mainBody.addInclude(mainHeader)
		mainBody.addInclude(defHeader)
		defHeader.addInclude(mainHeader)
	}
	
	def addIncludesBetweenOwnFiles(CPPPackage cppPackage){
		cppPackage.bodyFile.includedHeaders += cppPackage.headerFile
	}
	
	def addIncludesBetweenOwnFiles(CPPClass cppClass){
		cppClass.bodyFile.includedHeaders += cppClass.headerFile
	}
	
	def addIncludesBetweenOwnFiles(CPPExternalBridge cppExternalBridge){
		cppExternalBridge.bodyFile.includedHeaders += cppExternalBridge.headerFile
	}
	
	def getExternalHeaders(CPPClassRefSimpleCollection cppRefCollection) {
		val externalHeaderNames = cppRefCollection.externalHeaderNames
		return externalHeaderNames.map[getExternalHeader]
	}
	
	def getExternalHeaders(CPPSequence cppSequence) {
		val externalHeaderNames = cppSequence.externalHeaderNames
		return externalHeaderNames.map[getExternalHeader]
	}
	
	def getExternalHeader(String externalHeaderName){
		val externalHeaderMatcher = engine.getCppExternalHeader
		val externalHeaders = externalHeaderMatcher.allValuesOfcppExternalHeader
		val externalLibrary = engine.getCppExternalLibrary.oneArbitraryMatch?.cppExternalLibrary
		
		var externalHeader = externalHeaders.findFirst[it.name == externalHeaderName]
		if (externalHeader == null){
			externalHeader = createCPPExternalHeader => [
				name = externalHeaderName
			]
			externalLibrary.externalHeader += externalHeader
		}
		return externalHeader
	}
	
	protected def addIncludes(CPPSourceFile cppSourceFile, Iterable<CPPExternalHeader> externalHeaders, String comment){
		externalHeaders.forEach[ externalHeader |
			cppSourceFile.addInclude(externalHeader, comment)
		]
	}
	
	protected def addInclude(CPPSourceFile cppFile, CPPHeaderFile cppHeader){
		if(!cppFile.includedHeaders.contains(cppHeader)){
			cppFile.includedHeaders += cppHeader
		}
	}
	
	protected def addInclude(CPPSourceFile cppFile, CPPExternalHeader externalHeader, String comment){
		var externalHeaderInclusion = cppFile.externalHeaderInclusion.findFirst[it.externalHeader == externalHeader]
		if(externalHeaderInclusion == null){
			externalHeaderInclusion = createCPPExternalHeaderInclusion => [
				it.externalHeader = externalHeader
			]
			cppFile.externalHeaderInclusion += externalHeaderInclusion
		} 
		externalHeaderInclusion.comment = '''«externalHeaderInclusion.comment ?: externalHeader.name + " for"» «comment»; '''
	}
	
	def getExternalHeaderNames(CPPClassRefSimpleCollection classReferenceSimpleCollection) {
		return classReferenceSimpleCollection.implementation.containerHeaderIncludes
	}
	
	def getExternalHeaderNames(CPPSequence cppSequence) {
		return cppSequence.implementation.containerHeaderIncludes
	}
}
