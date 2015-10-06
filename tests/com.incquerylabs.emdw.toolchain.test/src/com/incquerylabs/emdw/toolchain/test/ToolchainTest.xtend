package com.incquerylabs.emdw.toolchain.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.testing.common.utils.TransformationUtil
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.emdw.umlintegration.util.RuleProvider
import java.util.Map
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.core.resources.IFolder
import org.eclipse.core.resources.IProject
import org.eclipse.core.resources.IResource
import org.eclipse.core.resources.ResourcesPlugin
import org.eclipse.core.runtime.CoreException
import org.eclipse.core.runtime.NullProgressMonitor
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.resource.UMLResource
import org.junit.After
import org.junit.Test

class ToolchainTest {
	val UML_RESOURCE_PATH = "com.incquerylabs.emdw.cpp.bodyconverter.test/models/EATF/eatf.uml"
	val generationProjectPrefix = "com.ericsson.emdw.cpp.generated.code."
	var generationProjectName = ""
	val codeGenerationDirectoryName = "src"
	val modelGenerationDirectoryName = "model"
	
	val COMMON_PRIMITIVE_TYPES_PATH = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	val CPP_CONTAINER_IMPLEMENTATIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	val CPP_BASIC_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	val RUNTIME_MODEL_PATH = "/com.incquerylabs.emdw.cpp.codegeneration/model/runtime.cppmodel"
	
	
	protected CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE
	protected OoplFactory ooplFactory = OoplFactory.eINSTANCE
	protected CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	private extension TransformationUtil trafoUtil = new TransformationUtil
	private extension XtumlQueries xtumlQueries = XtumlQueries.instance
	
	protected AdvancedIncQueryEngine engine
	protected BasicUMLContextProvider context
	
	var Resource xumlrtResource
	var Resource traceResource
	var Resource cppmodelResource
	var CPPModel cppModel
	
	val logger = Logger.getLogger(class)
	
	@Test
	def runToolchainTest() {
		setLoggerLevels()
		
		initializeTransformations()
		executeAllTransformation()
		executeCodegeneration()
		
		saveResources()
	}
	
	@After
	def void cleanupTest() {
		cleanupTransformation()
	}
	
	def initializeTransformations() {
		val resourceSet = new ResourceSetImpl
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(UML_RESOURCE_PATH, true)) => [ load(#{}) ]
		val umlModel = umlResource.contents.filter(Model).head
		generationProjectName = generationProjectPrefix + umlModel.name
		
		engine = resourceSet.initializeEngine
		context =  new BasicUMLContextProvider(engine)
		
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
		OoplQueryBasedFeatures.instance.prepare(managedEngine)
		
		resourceSet.createRootMapping(umlResource)
		val primitiveTypeMapping = resourceSet.createPrimitiveTypeMapping
		initializeAllTransformation(resourceSet, primitiveTypeMapping)
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
		
		rs.getResource(URI.createPlatformPluginURI(CPP_CONTAINER_IMPLEMENTATIONS_PATH, true), true) => [ load(#{}) ]
		rs.getResource(URI.createPlatformPluginURI(CPP_BASIC_TYPES_PATH, true), true) => [ load(#{}) ]
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
	
	def executeCodegeneration()
	{
		val cppComponents = engine.cppComponents.allValuesOfcppComponent
		val cppSourceFileContents = <CPPSourceFile, CharSequence>newHashMap
		cppComponents.forEach[ cppComponent |
			val cppSourceFileContentsForComponent = performCodeGeneration(engine, cppComponent)
			cppSourceFileContents.putAll(cppSourceFileContentsForComponent)
		]
		generateFiles(cppmodelResource, cppModel, cppSourceFileContents)
	}
		
	def performCodeGeneration(AdvancedIncQueryEngine engine, CPPComponent cppComponent) {
		val cppCodeGeneration = new CPPCodeGeneration
		cppCodeGeneration.initialize(engine)
		cppCodeGeneration.execute(cppComponent)
		val generatedCppSourceFiles = cppCodeGeneration.generatedCPPSourceFiles
		cppCodeGeneration.dispose
		return generatedCppSourceFiles
	}
	
	def generateFiles(Resource cppResource, CPPModel cppModel, Map<CPPSourceFile, CharSequence> generatedCppSourceFiles) {
		// FILE GENERATION
		val cppComponents = engine.cppComponents.getAllValuesOfcppComponent
		
		// Runtime file mapping
		val runtimeMapperCppDir = getMapperCppDir(cppResource.resourceSet)
		generatedCppSourceFiles.putAll(mapRuntime(runtimeMapperCppDir))
		
		// Rules.mk file generation for every directory
		val makefileGeneration = new MakefileGeneration
		makefileGeneration.initialize()
		performRulesMkGeneration(makefileGeneration, cppModel)
		generatedCppSourceFiles.putAll(makefileGeneration.generatedCPPMakeFiles)
		
		// Create filegenerator objects
		val fileManager = new EclipseWorkspaceFileManager(targetFolder)
//		val fileManager = new JavaIOBasedFileManager(cppResource.URI.trimFileExtension.toFileString)
		val filegen = new FileAndDirectoryGeneration
		filegen.initialize(engine, fileManager, ImmutableMap.copyOf(generatedCppSourceFiles))
		
		// Model based file generation for cppmodel and runtime
		filegen.execute(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir){
			filegen.execute(cppModel.bodyDir)
		}
		filegen.execute(runtimeMapperCppDir)
		
		// Manual filegeneration for main makefile and main.cc
		performMakefileGeneration(fileManager, makefileGeneration, cppModel, runtimeMapperCppDir)
		performMainGeneration(fileManager, cppComponents)
	}
	
	def getTargetFolder() {
		val parent = getOrCreateProject(generationProjectName)
		
		var IFolder targetFolder
		if(parent instanceof IFolder){
			targetFolder = getOrCreateFolder(parent, codeGenerationDirectoryName)
		} else if (parent instanceof IProject){
			targetFolder = getOrCreateFolder(parent, codeGenerationDirectoryName)
		}
		targetFolder
	}
	
	def getOrCreateProject(String name) throws CoreException {
		val workspace = ResourcesPlugin.workspace
		val project = workspace.root.getProject(name)
		
		// If the project is not exist it will be created.
		if (!project.exists) {
			project.create(null)
		}
		
		// The project should be opened.
		project.open(IResource.BACKGROUND_REFRESH, null)
		
		return project
	 }
	
	dispatch def getOrCreateFolder(IProject project, String folderName){
		val folder = project.getFolder(folderName);
		// If the folder doesn't exists create it.
		if (!folder.exists()) {
			folder.create(true, true, null);
		}
		return folder;
	}
	
	dispatch def getOrCreateFolder(IFolder container, String newFolder) {
		val folder = container.getFolder(newFolder);
		if (!folder.exists()) {
			val monitor = new NullProgressMonitor();
			folder.create(true, true, monitor);
		}
		return folder;
	}
	
	def performMakefileGeneration(IFileManager fileManager, MakefileGeneration makefileGeneration, CPPModel cppModel, CPPDirectory... otherDirsForMakefile){
		val listOfDirs = <String>newArrayList
		listOfDirs.add(cppModel.headerDir.name)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			listOfDirs.add(cppModel.bodyDir.name)
		}
		otherDirsForMakefile.forEach[listOfDirs.add(it.name)]
		val makefileContent = makefileGeneration.executeMakefile(cppModel.cppName, listOfDirs)
		fileManager.createFile("Makefile", makefileContent, true, false)
	}
	
	def performRulesMkGeneration(MakefileGeneration makefileGeneration, CPPModel cppModel) {
		makefileGeneration.executeRulesMk(cppModel.headerDir)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			makefileGeneration.executeRulesMk(cppModel.bodyDir)
		}
	}
	
	def performMainGeneration(IFileManager fileManager, CPPComponent... components) {
		val mainGeneration = new MainGeneration
		mainGeneration.initialize
		
		val mainContent = mainGeneration.execute(components)
		fileManager.createFile("main.cc", mainContent, true, false)
	}
	
	def Map<CPPSourceFile, CharSequence> mapRuntime(CPPDirectory mapperCppDir) {
		if(mapperCppDir!=null) {
			// Map static file sources
			val mapperFileManager = new BundleFileManager("com.incquerylabs.emdw.cpp.codegeneration")
			val mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, "model/runtime/"+mapperCppDir.name+"/")
			mapper.execute
			return mapper.mappedSourceFiles
		}
	}
	
	def CPPDirectory getMapperCppDir(ResourceSet rs) {
		val resource = loadCPPRuntimeModelResource(rs)
		if(resource!=null) {
			val mapperDirectory = resource.contents.filter(CPPDirectory).head
			return mapperDirectory
		}
		return null
	}
	
	def loadCPPRuntimeModelResource(ResourceSet rs) {
		rs.getResource(URI.createPlatformPluginURI(RUNTIME_MODEL_PATH, true),true)
	}
	
	def setLoggerLevels(){
		val commonLoggingLevel = Level.TRACE
		logger.level = commonLoggingLevel
		Logger.getLogger(RuleProvider).level = commonLoggingLevel
		Logger.getLogger(MakefileGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = commonLoggingLevel
		Logger.getLogger(CPPCodeGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(MainGeneration.package.name).level = commonLoggingLevel
	}
}
