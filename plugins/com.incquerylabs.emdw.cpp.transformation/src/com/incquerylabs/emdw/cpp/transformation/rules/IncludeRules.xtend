package com.incquerylabs.emdw.cpp.transformation.rules

import com.ericsson.xtumlrt.oopl.OOPLType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassRefSimpleCollection
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalHeader
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
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

class IncludeRules {
	static extension val CppQueries cppQueries = CppQueries.instance
	static extension val XtumlQueries xtumlQueries = XtumlQueries.instance
	
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
			packageComponentIncludeRule
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
	val sequenceIncludeRule = createRule.precondition(cppAttributeOrParameterForInclude).action[ match |
		val cppElement = match.cppElement
		val cppHeader = match.containerHeader
		addIncludesForMultiplicityElement(cppElement, cppHeader)
	].build
	
	@Accessors(PUBLIC_GETTER)
	val statemachineRuntimeIncludeRule = createRule.precondition(cppClassStateMachine).action[ match |
		val cppClass = match.cppClass
		val cppHeader = cppClass.headerFile
		val directoryPrefix = getRuntimeDirectoryPrefix(cppClass)
		val statefulClassExternalHeader = getExternalHeader('''«directoryPrefix»Runtime/StatefulClass.hh''')
		val eventExternalHeader = getExternalHeader('''«directoryPrefix»Runtime/Event.hh''')
		cppHeader.addInclude(statefulClassExternalHeader, "StatefulClass superclass in Runtime")
		cppHeader.addInclude(eventExternalHeader, "Evenet class in Runtime")
	].build
	
	def addComponentRuntimeIncludes(CPPComponent cppComponent){
		val directoryPrefix = getRuntimeDirectoryPrefix(cppComponent)
		val activeClassExternalHeader = getExternalHeader('''«directoryPrefix»Runtime/ActiveComponent.hh''')
		cppComponent.mainHeaderFile.addInclude(activeClassExternalHeader, "ActiveComponent superclass in Runtime")
	}
	
	def getRuntimeDirectoryPrefix(CPPClass cppClass){
		val directoryChangeCount = cppClass.cppQualifiedName.split("::").size-3
		'''«FOR i : 0..<directoryChangeCount»../«ENDFOR»'''
	}
	
	def getRuntimeDirectoryPrefix(CPPComponent cppComponent){
		val directoryChangeCount = cppComponent.cppQualifiedName.split("::").size-2
		'''«FOR i : 0..<directoryChangeCount»../«ENDFOR»'''
	}
	
	dispatch def addIncludesForMultiplicityElement(CPPAttribute cppAttribute, CPPSourceFile cppSourceFile){
		val type = cppAttribute.type
		addIncludesForOOPLType(type, cppSourceFile, '''CPPAttribute «cppAttribute.cppName»''')
	}
	
	dispatch def addIncludesForMultiplicityElement(CPPFormalParameter cppFormalParameter, CPPSourceFile cppSourceFile){
		val type = cppFormalParameter.type
		addIncludesForOOPLType(type, cppSourceFile, '''CPPFormalParameter «cppFormalParameter.cppName»''')
	}
	
	dispatch def void addIncludesForOOPLType(CPPBasicType cppBasicType, CPPSourceFile cppSourceFile, String comment){
		if(cppBasicType.commonType.name == "String"){
			cppSourceFile.addInclude(getExternalHeader("string"), comment)
		}
	}
	
	dispatch def void addIncludesForOOPLType(CPPSequence cppSequence, CPPSourceFile cppSourceFile, String comment){
		cppSourceFile.addInclude(getExternalHeader(cppSequence), comment)
		val typeOfSequence = cppSequence.elementType
		addIncludesForOOPLType(typeOfSequence, cppSourceFile, comment)
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
	
	def addIncludesForClassReference(CPPClass cppClass, CPPClass cppTargetClass, OOPLType cppClassReference) {
		val cppClassHeader = cppClass.headerFile
		val cppTargetClassHeader = cppTargetClass.headerFile
		
		cppClassHeader.addInclude(cppTargetClassHeader)
		
		if(cppClassReference instanceof CPPClassRefSimpleCollection){
			val externalHeader = getExternalHeader(cppClassReference)
			cppClassHeader.addInclude(externalHeader, '''CPPClassRefSimpleCollection «cppClassReference.cppName»''')
		}
		
	}
	
	def getExternalHeader(CPPClassRefSimpleCollection cppRefCollection) {
		val externalHeaderName = cppRefCollection.externalHeaderName
		return getExternalHeader(externalHeaderName)
	}
	
	def getExternalHeader(CPPSequence cppSequence) {
		val externalHeaderName = cppSequence.externalHeaderName
		return getExternalHeader(externalHeaderName)
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
	
	def getExternalHeaderName(CPPClassRefSimpleCollection classReferenceSimpleCollection) {
		val container = classReferenceSimpleCollection.cppContainer
		getExternalHeaderName(container)
	}
	
	def getExternalHeaderName(CPPSequence cppSequence) {
		val container = cppSequence.cppContainer
		getExternalHeaderName(container)
	}
	
	def getExternalHeaderName(CPPBasicType cppBasicType) {
		getExternalHeaderName(cppBasicType.cppName)
	}
	
	def getExternalHeaderName(String containerString) {
		switch containerString {
			case "std::list" : return "list"
			case "std::array" : return "array"
			case "std::deque" : return "deque"
			case "std::multiset" : return "set"
			case "std::set" : return "set"
			case "std::vector" : return "vector"
		}
	}
}