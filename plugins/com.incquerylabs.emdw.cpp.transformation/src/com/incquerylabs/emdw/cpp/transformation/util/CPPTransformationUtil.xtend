package com.incquerylabs.emdw.cpp.transformation.util

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory

class CPPTransformationUtil {
	
	extension CppmodelFactory cppModelFactory = CppmodelFactory.eINSTANCE
	
	def createComponentFiles(CPPComponent component) {

		component.mainHeaderFile = createCPPHeaderFile
		component.mainBodyFile = createCPPBodyFile
		component.declarationHeaderFile = createCPPHeaderFile
		component.definitionHeaderFile = createCPPHeaderFile
		
		component
	}
	
	def createPackageFiles(CPPPackage pack) {
		pack.bodyFile = createCPPBodyFile
		pack.headerFile = createCPPHeaderFile
		
		pack
	}
	
	def createDirectories(CPPComponent component, CPPModel parent) {
		if(parent.bodyDir == parent.headerDir) {
			createCommonDirectories(parent.bodyDir, component)
		} else {
			createDiffDirectories(parent.bodyDir, parent.headerDir, component)
		}
	}
	
	def createDirectories(CPPComponent component, CPPPackage parent) {
		if(parent.bodyDir == parent.headerDir) {
			createCommonDirectories(parent.bodyDir, component)
		} else {
			createDiffDirectories(parent.bodyDir, parent.headerDir, component)
		}
	}
	
	def createDirectories(CPPPackage pack, CPPModel parent) {
		if(parent.bodyDir == parent.headerDir) {
			createCommonDirectories(parent.bodyDir, pack)
		} else {
			createDiffDirectories(parent.bodyDir, parent.headerDir, pack)
		}
	}
	
	def createDirectories(CPPPackage pack, CPPPackage parent) {
		if(parent.bodyDir == parent.headerDir) {
			createCommonDirectories(parent.bodyDir, pack)
		} else {
			createDiffDirectories(parent.bodyDir, parent.headerDir, pack)
		}
	}
	
	def removeDirectories(CPPComponent component, CPPModel parent) {
		parent.bodyDir.removeDirectory(component.bodyDirectory)
		if(parent.headerDir != parent.bodyDir)
			parent.headerDir.removeDirectory(component.headerDirectory)
	}
	
	def removeDirectories(CPPComponent component, CPPPackage parent) {
		parent.bodyDir.removeDirectory(component.bodyDirectory)
		if(parent.headerDir != parent.bodyDir)
			parent.headerDir.removeDirectory(component.headerDirectory)
	}
	
	def removeDirectories(CPPPackage pack, CPPModel parent) {
		parent.bodyDir.removeDirectory(pack.bodyDir)
		if(parent.headerDir != parent.bodyDir)
			parent.headerDir.removeDirectory(pack.headerDir)
	}
	
	def removeDirectories(CPPPackage pack, CPPPackage parent) {
		parent.bodyDir.removeDirectory(pack.bodyDir)
		if(parent.headerDir != parent.bodyDir)
			parent.headerDir.removeDirectory(pack.headerDir)
	}
	
	private def createCommonDirectories(CPPDirectory parent, CPPComponent component) {
		val makeRulesFile = createCPPMakeFile
		component.bodyDirectory = createCPPDirectory => [
			it.makeRulesFile = makeRulesFile
			it.files += makeRulesFile
		]
		component.headerDirectory = component.bodyDirectory
		
		component.bodyDirectory.files += component.mainBodyFile
		component.bodyDirectory.files += component.mainHeaderFile
		component.bodyDirectory.files += component.declarationHeaderFile
		component.bodyDirectory.files += component.definitionHeaderFile
		
		parent.subDirectories += component.bodyDirectory
		
		component
	}
	
	private def createDiffDirectories(CPPDirectory bodyParent, CPPDirectory headerParent, CPPComponent component) {
		val bodyMakeRulesFile = createCPPMakeFile
		component.bodyDirectory = createCPPDirectory => [
			it.makeRulesFile = bodyMakeRulesFile
			it.files += bodyMakeRulesFile
		]
		val headerMakeRulesFile = createCPPMakeFile
		component.headerDirectory = createCPPDirectory => [
			it.makeRulesFile = headerMakeRulesFile
			it.files += headerMakeRulesFile
		]
		
		component.bodyDirectory.files += component.mainBodyFile
		component.headerDirectory.files += component.mainHeaderFile
		component.headerDirectory.files += component.declarationHeaderFile
		component.headerDirectory.files += component.definitionHeaderFile
		
		bodyParent.subDirectories += component.bodyDirectory
		headerParent.subDirectories += component.headerDirectory
		
		component
	}
	
	private def createCommonDirectories(CPPDirectory parent, CPPPackage pack) {
		val makeRulesFile = createCPPMakeFile
		pack.bodyDir = createCPPDirectory => [
			it.makeRulesFile = makeRulesFile
			it.files += makeRulesFile
		]
		pack.headerDir = pack.bodyDir
		
		pack.bodyDir.files += pack.bodyFile
		pack.headerDir.files += pack.headerFile
		
		parent.subDirectories += pack.bodyDir
		
		pack
	}
	
	private def createDiffDirectories(CPPDirectory bodyParent, CPPDirectory headerParent, CPPPackage pack) {
		val bodyMakeRulesFile = createCPPMakeFile
		pack.bodyDir = createCPPDirectory => [
			it.makeRulesFile = bodyMakeRulesFile
			it.files += bodyMakeRulesFile
		]
		val headerMakeRulesFile = createCPPMakeFile
		pack.headerDir = createCPPDirectory => [
			it.makeRulesFile = headerMakeRulesFile
			it.files += headerMakeRulesFile
		]
		
		bodyParent.subDirectories += pack.bodyDir
		headerParent.subDirectories += pack.headerDir
		
		pack.bodyDir.files += pack.bodyFile
		pack.headerDir.files += pack.headerFile
		
		pack
	}
	
	private def removeDirectory(CPPDirectory parent, CPPDirectory directory) {
		parent.subDirectories.remove(directory)
	}
}