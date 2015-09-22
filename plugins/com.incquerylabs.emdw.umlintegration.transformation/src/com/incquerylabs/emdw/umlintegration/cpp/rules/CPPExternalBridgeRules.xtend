package com.incquerylabs.emdw.umlintegration.cpp.rules

import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalBridge
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.umlintegration.queries.CppExtensionQueries
import com.incquerylabs.emdw.umlintegration.queries.XtClassMatch
import com.incquerylabs.emdw.umlintegration.rules.AbstractMapping
import com.incquerylabs.emdw.umlintegration.rules.CommonPriorities
import java.util.Set
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.uml2.uml.Class

class CPPExternalBridgeRules{
	static def Set<AbstractMapping<?>> getRules(IncQueryEngine engine) {
		#{
			new CPPExternalBridgeMapping(engine)
		}
	}
}


/**
 * Transforms Classes with external_type stereotype to CPPExternalBridges.
 */
class CPPExternalBridgeMapping extends AbstractMapping<XtClassMatch> {
	protected static extension val CppExtensionQueries cppExtensionPatterns = CppExtensionQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	
	new(IncQueryEngine engine) {
		super(engine)
	}
	
	override getQuerySpecification() {
		xtClass
	}
	
	override getRulePriority() {
		CommonPriorities.CLASS_MAPPING_PRIORITY + 2
	}
	
	override appeared(XtClassMatch match) {
		val umlClass = match.umlClass
		val appliedStereotype = umlClass.externalTypeStereotype
		if(appliedStereotype == null) {
			return
		}
		
		val xtClass = engine.trace.getAllValuesOfxtumlrtElement(null, null, umlClass).filter(XTClass).head
		val cppResource = xtClass.eResource.resourceSet.resources.findFirst[URI.toString.contains('''_extension.cppmodel''')]
		
		val cppModel = cppResource.contents.filter(CPPModel).head
		val cppRootDirectory = cppResource.contents.filter(CPPDirectory).head
		
		val bodyFile = createCPPBodyFile
		val headerFile = createCPPHeaderFile
		cppRootDirectory.files += bodyFile
		cppRootDirectory.files += headerFile
		
		if(!umlClass.externalHeaderLocation.isNullOrEmpty){
			val externalHeader = createCPPExternalHeader
			cppResource.contents += externalHeader
			
			val externalHeaderInclusion = createCPPExternalHeaderInclusion => [
				it.externalHeader = externalHeader
				it.comment = "Own external header"
			]
			bodyFile.externalHeaderInclusion += externalHeaderInclusion
		}
		
		val externalBridge = createCPPExternalBridge => [
			it.xtClass = xtClass
			it.bodyFile = bodyFile
			it.headerFile = headerFile
		]
		cppModel.subElements += externalBridge
		
		externalBridge.updateExternalBridge(umlClass)
		logger.debug('''Transformed «umlClass» to «externalBridge»''')
	}
	
	override updated(XtClassMatch match) {
		val umlClass = match.umlClass
		val appliedStereotype = umlClass.externalTypeStereotype
		val externalBridge = umlClass.externalBridge
		if(appliedStereotype == null) {
			if (externalBridge != null) {
				removeExternalBridge(externalBridge)
			}
			return
		} else {
			updateExternalBridge(externalBridge, umlClass)
		}
		logger.debug('''Updated cpp object «externalBridge»''')
	}
	
	override disappeared(XtClassMatch match) {
		val externalBridge = match.umlClass.externalBridge
		if (externalBridge != null) {
			removeExternalBridge(externalBridge)
		}
	}
	
	def updateExternalBridge(CPPExternalBridge externalBridge, Class umlClass) {
		val externalHeaderInclusion = externalBridge.bodyFile.externalHeaderInclusion.head
		if(externalHeaderInclusion != null){
			val externalHeader = externalHeaderInclusion.externalHeader
			externalHeader.name = umlClass.getExternalHeaderLocation
		}
		externalBridge.cppExternalNamespace = umlClass.getExternalNamespace
	}
	
	def removeExternalBridge(CPPExternalBridge externalBridge) {
		val headerFile = externalBridge.headerFile
		val bodyFile = externalBridge.bodyFile
		val externalHeaderInclusion = headerFile.externalHeaderInclusion.head
		val externalHeader = externalHeaderInclusion.externalHeader
		
		val cppDirectory = headerFile.eContainer
		if(cppDirectory instanceof CPPDirectory) {
			cppDirectory.files.remove(bodyFile)
			cppDirectory.files.remove(headerFile)
		}
		
		val resource = externalHeader.eResource
		resource.contents.remove(externalHeader)
		
		val model = externalBridge.eContainer as CPPModel
		model.subElements.remove(externalBridge)
		
	}
	
	def getExternalTypeStereotype(Class umlClass) {
		val profileApplication = umlClass.model.profileApplications.findFirst[appliedProfile.name == "xUML-RT"]
		if(profileApplication == null){
			return null
		}
		val appliedStereotype = umlClass.appliedStereotypes.findFirst[name == "ExternalEntity"]
		if(appliedStereotype == null) {
			return null
		}
		return appliedStereotype
	}
	
	def getExternalHeaderLocation(Class umlClass) {
		val appliedStereotype = umlClass.externalTypeStereotype
		if(appliedStereotype == null) {
			return null
		}
		return umlClass.getValue(appliedStereotype, "externalHeaderLocation") as String
	}
	
	def getExternalNamespace(Class umlClass) {
		val appliedStereotype = umlClass.externalTypeStereotype
		if(appliedStereotype == null) {
			return null
		}
		return umlClass.getValue(appliedStereotype, "externalNamespace") as String
	}
	
	def getXtClass(Class umlClass) {
		engine.trace.getAllValuesOfxtumlrtElement(null, null, umlClass).filter(XTClass).head
	}
	
	def getExternalBridge(Class umlClass) {
		val xtClass = umlClass.xtClass
		val externalBridge = engine.cppExternalBridge.getAllValuesOfcppBridge(xtClass).head
		return externalBridge
	}
}
