package com.incquerylabs.emdw.toolchain.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.runtime.CoreException
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource
import org.junit.After
import org.junit.Test
import com.incquerylabs.emdw.cpp.common.util.EMDWNullProgressMonitor

class ToolchainTest {
	val UML_RESOURCE_PATH = "com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml"
	val generationProjectPrefix = "com.ericsson.emdw.cpp.generated.code."
	var generationProjectName = ""
	val codeGenerationDirectoryName = "src"
	val modelGenerationDirectoryName = "model"
	
	val COMMON_PRIMITIVE_TYPES_PATH = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	
	protected CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE
	protected OoplFactory ooplFactory = OoplFactory.eINSTANCE
	protected CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	protected ToolchainManager toolchainManager
	
	var Resource xumlrtResource
	var Resource traceResource
	var Resource cppmodelResource
	var CPPModel cppModel
	
	@Test
	def runToolchainTest() {
		val resourceSet = new ResourceSetImpl
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(UML_RESOURCE_PATH, true)) => [ load(#{}) ]
		val umlModel = umlResource.contents.filter(Model).head
		generationProjectName = generationProjectPrefix + umlModel.name
		
		
		val mapping = resourceSet.createRootMapping(umlResource)
		val primitiveTypeMapping = resourceSet.createPrimitiveTypeMapping
		val toolchainManagerBuilder = new ToolchainManagerBuilder => [
			it.xumlrtModel = mapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
			it.fileManager = new EclipseWorkspaceFileManager(targetFolder)
			
		]
		toolchainManager = toolchainManagerBuilder.buildOrGetManager
		toolchainManager.clearMeasuredTimes
		toolchainManager.logLevel = Level.TRACE
		
		
		initializeTransformations()
		executeTransformations()
		toolchainManager.logMeasuredTimes
		
		saveResources()
	}
	
	@After
	def void cleanupTest() {
		toolchainManager.disposeEngine
		toolchainManager.dispose
	}
	
	def initializeTransformations() {
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
		toolchainManager.initializeCppCodegeneration
		toolchainManager.initializeMakefileGeneration
	}
	
	def executeTransformations() {
		toolchainManager.executeXtTransformation
		toolchainManager.executeCppQrtTransformation
		toolchainManager.executeDeltaCodeAndFileGeneration(new EMDWNullProgressMonitor)
	}
	
	def createRootMapping(ResourceSet resourceSet, Resource umlResource) {
		val umlModel = umlResource.contents.filter(Model).head
		
		val project = getOrCreateProject(generationProjectName)
		val myuri = URI.createFileURI('''«project.location.toOSString»/«modelGenerationDirectoryName»/«umlModel.name»''')
		val RESULT_PATH = myuri.toFileString
		
		// Create xtuml resource with xtuml model
		val xumlrtModel = commonFactory.createModel => [
			name = umlModel.name
		]
		xumlrtResource = resourceSet.createResource(RESULT_PATH, "xtuml", xumlrtModel)
		
		// Create trace resource with trace model
		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xumlrtModel
		]
		traceResource = resourceSet.createResource(RESULT_PATH, "trace", mapping)
		
		// Create cpp resource with cpp model
		val nameProvider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xumlrtModel ]
		cppModel = cppFactory.createCPPModel => [
			commonModel = xumlrtModel
			ooplNameProvider = nameProvider
		]
		cppmodelResource = resourceSet.createResource(RESULT_PATH, "cppmodel", cppModel)
		
		// Add root directory and external library
		val makeRulesFile = cppFactory.createCPPMakeFile
		val modelDir = cppFactory.createCPPDirectory => [
			it.makeRulesFile = makeRulesFile
			it.files += makeRulesFile
		]
		cppmodelResource.contents += modelDir
		cppmodelResource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		
		mapping
	}
	
	def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = rs.getResource(URI.createPlatformPluginURI(COMMON_PRIMITIVE_TYPES_PATH, true), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		primitiveTypeMapping
	}
	
	def createResource(ResourceSet resourceSet, String resultPath, String fileExtension, EObject root) {
		val uriWithoutExtension = URI.createFileURI(resultPath).trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		resource
	}
	
	def saveResources() {
		xumlrtResource.save(null)
		traceResource.save(null)
		cppmodelResource.save(null)
	}
	
	def getTargetFolder() {
		val parent = getOrCreateProject(generationProjectName)
		val targetFolder = getOrCreateFolder(parent, codeGenerationDirectoryName)
		targetFolder
	}
	
	def getOrCreateProject(String name) throws CoreException {
		val workspace = ResourcesPlugin.workspace
		val project = workspace.root.getProject(name)
		
		if (!project.exists) {
			project.create(null)
		}
		project.open(IResource.BACKGROUND_REFRESH, null)
		
		return project
	 }
	
	def getOrCreateFolder(IProject project, String folderName){
		val folder = project.getFolder(folderName);
		if (!folder.exists()) {
			folder.create(true, true, null);
		}
		return folder;
	}
}
