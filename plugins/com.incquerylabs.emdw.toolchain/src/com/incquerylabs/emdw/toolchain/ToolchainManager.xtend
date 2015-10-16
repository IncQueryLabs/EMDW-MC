package com.incquerylabs.emdw.toolchain

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalLibrary
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import com.incquerylabs.emdw.cpp.common.mapper.queries.UmlQueries
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.CPPRuleExtensionService

import com.incquerylabs.emdw.umlintegration.queries.CppExtensionQueries
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.xtuml.incquery.XtumlValidationQueries
import java.util.Map
import java.util.Set
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.uml2.uml.Type
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*

import com.incquerylabs.emdw.cpp.transformation.queries.MonitorQueries
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries

class ToolchainManager {
	static val RUNTIME_BUNDLE_ROOT_DIRECTORY = "com.incquerylabs.emdw.cpp.codegeneration"
	static val RUNTIME_TARGET_DIRECTORY = "model/runtime"
	static val CPP_BASIC_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	static val DEFAULT_IMPLEMENTATIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	static val RUNTIME_MODEL_PATH = "/com.incquerylabs.emdw.cpp.codegeneration/model/runtime.cppmodel"
	
	static val TOOLCHAIN_QUERIES = GenericPatternGroup.of(
			StateMachine.instance,
			Structure.instance,
			Trace.instance,
			CppExtensionQueries.instance,
			XtumlValidationQueries.instance,
			UmlQueries.instance,
			com.incquerylabs.emdw.cpp.common.mapper.queries.XtumlQueries.instance,
			XtumlQueries.instance,
			MonitorQueries.instance,
			CppQueries.instance,
			CppCodeGenerationQueries.instance,
			CppFileAndDirectoryQueries.instance,
			UmlCppMappingQueries.instance,
			OoplQueryBasedFeatures.instance,
			QueryBasedFeatures.instance
		)
	
	@Accessors Model xumlrtModel
	@Accessors Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping
	@Accessors Set<UmlIntegrationExtension> extensionServices
	
	@Accessors TransformationQrt xtTrafo
	@Accessors XtumlCPPTransformationQrt cppQrtTrafo
	@Accessors XtumlComponentCPPTransformation cppCompTrafo
	@Accessors CPPCodeGeneration cppCodeGeneration
	@Accessors FileAndDirectoryGeneration filegen
	@Accessors MakefileGeneration makefileGeneration
	
	@Accessors AdvancedIncQueryEngine engine
	@Accessors XtumlModelChangeMonitor xtumlChangeMonitor
	@Accessors IFileManager fileManager
	
	boolean isDisposed = false
	boolean isXumlrtTrafoInitialized = false
	boolean isCppQrtTrafoInitialized = false
	boolean isCppCompTrafoInitialized = false
	boolean areCppPrerequisitesInitialized = false
	boolean isCppCodegenerationInitialized = false
	boolean isMakefileGenerationInitialized = false
	
	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	IncQueryEngine managedEngine
	
	def prepareToolchainQueries() {
		TOOLCHAIN_QUERIES.prepare(engine)
	}
	
	def initializeXtTransformation() {
		if(!isXumlrtTrafoInitialized) {
			val xUmlRtResource = xumlrtModel.eResource
			val Set<UmlIntegrationExtension> extensionServices = newHashSet(new CPPRuleExtensionService)
			extensionServices.forEach[initialize(engine, xUmlRtResource)]
			xtTrafo.extensionServices = extensionServices
			xtTrafo.externalTypeMap = primitiveTypeMapping
			xtTrafo.initialize(engine)
			
			isXumlrtTrafoInitialized = true
		}
	}
	
	def initializeCppQrtTransformation() {
		initializeCppTransformationPrerequisites
		if(!isCppQrtTrafoInitialized) {
			cppQrtTrafo.initialize(engine)
			isCppQrtTrafoInitialized = true
		}
	}
	
	def initializeCppComponentTransformation() {
		initializeCppTransformationPrerequisites
		if(! isCppCompTrafoInitialized){
			cppCompTrafo.initialize(engine)
			isCppCompTrafoInitialized = true
		}
	}
	
	protected def initializeCppTransformationPrerequisites() {
		if(!areCppPrerequisitesInitialized) {
			val resourceSet = xumlrtModel.eResource.resourceSet
			managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
			GenericPatternGroup.of(
				OoplQueryBasedFeatures.instance,
				QueryBasedFeatures.instance
			).prepare(managedEngine)
			resourceSet.loadCPPBasicTypes
			resourceSet.loadDefaultContainerImplementations
			
			areCppPrerequisitesInitialized = true
		}
	}
	
	def initializeCppCodegeneration() {
		if(!isCppCodegenerationInitialized){
			cppCodeGeneration.initialize(engine)
			isCppCodegenerationInitialized = true
		}
	}
	
	def initializeMakefileGeneration() {
		if(!isMakefileGenerationInitialized) {
			makefileGeneration.initialize()
			isMakefileGenerationInitialized = true
		}
	}
	
	// Incremental transformations
	def executeXtTransformation() {
		xtTrafo.execute
	}
	
	def executeCppQrtTransformation() {
		getOrCreateCPPModel
		cppQrtTrafo.execute
	}
	
	// CPP transform for ALL components
	def executeCppStructureTransformation() {
		val cppModel = getOrCreateCPPModel
		val cppResource = cppModel.eResource
		createMissingExternalLibrary(cppResource)
		
		cppCompTrafo.transformComponents
	}
	
	def executeCppActionCodeCompile() {
		cppCompTrafo.compileActionCodes
	}
	
	// CPP transform for single component
	def executeCppStructureTransformation(XTComponent component) {
		val cppModel = getOrCreateCPPModel
		val cppResource = cppModel.eResource
		createMissingExternalLibrary(cppResource)
		
		cppCompTrafo.transformComponent(component)
	}
	
	def executeCppActionCodeCompile(XTComponent component) {
		cppCompTrafo.compileActionCodes(component)
	}
	
	// CPP code generation for single component
	def executeCppCodeGeneration(CPPComponent cppComponent) {
		cppCodeGeneration.execute(cppComponent)
		return cppCodeGeneration.generatedCPPSourceFiles
	}
	
	// File generation
	def executeFileGeneration(CPPModel cppModel, CPPDirectory runtimeDirectory, Map<CPPSourceFile, CharSequence> cppSourceFileContents){
		checkNotNull(fileManager)
		filegen.initialize(engine, fileManager, ImmutableMap.copyOf(cppSourceFileContents))
		// Model based file generation
		filegen.execute(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir){
			filegen.execute(cppModel.bodyDir)
		}
		// Runtime, Makefile and main.cc generation
		filegen.execute(runtimeDirectory)
	}
	
	
	def startChangeMonitor() {
		if (xtumlChangeMonitor != null && !xtumlChangeMonitor.started) {
			xtumlChangeMonitor.startMonitoring
		}
	}
	
	def createChangeMonitorCheckpoint() {
		xtumlChangeMonitor?.createCheckpoint
	}
	
	def getDirtyXtComponents() {
		if(xtumlChangeMonitor == null || !xtumlChangeMonitor.started) {
			val allXtComponents = engine.xtComponents.allValuesOfxtComponent
			return allXtComponents
		} else {
			val dirtyXtComponents = xtumlChangeMonitor.dirtyXTComponents
			return dirtyXtComponents
		}
	}
	
	def executeDeltaCodeAndFileGeneration() {
		createChangeMonitorCheckpoint()
		
		// get dirty components
		val componentsToTransform = dirtyXtComponents
		
		// CPP Component Transformation
		componentsToTransform.forEach[
			it.executeCppStructureTransformation
			it.executeCppActionCodeCompile
		]
		
		// ******* FILE CONTENT GENERATION *******
		val CPPModel cppModel = getOrCreateCPPModel
		val runtimeCppDir = getRuntimeCppDir()
		
		val cppSourceFileContents = executeFileContentGeneration(componentsToTransform, cppModel, runtimeCppDir)
		
		// ******* FILE SYNCHRONISATION *******
		executeFileGeneration(cppModel, runtimeCppDir, cppSourceFileContents)
		// Manual filegeneration for main makefile and main.cc
		performMakefileGeneration(cppModel, runtimeCppDir)
		val allCppComponents = engine.cppComponents.getAllValuesOfcppComponent
		performMainGeneration(allCppComponents)
	}
	
	def executeFileContentGeneration(Iterable<XTComponent> componentsToTransform, CPPModel cppModel, CPPDirectory runtimeCppDir) {
		val cppSourceFileContents = <CPPSourceFile, CharSequence>newHashMap
		// CPP code generation for components
		componentsToTransform.forEach[ xtComponent |
			val cppComponent = engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
			val cppSourceFileContentsForComponent = executeCppCodeGeneration(cppComponent)
			cppSourceFileContents.putAll(cppSourceFileContentsForComponent)
		]
		
		// Runtime code generation
		cppSourceFileContents.putAll(mapRuntime(runtimeCppDir))
		// Makefile code generation
		performRulesMkGeneration(makefileGeneration, cppModel)
		cppSourceFileContents.putAll(makefileGeneration.generatedCPPMakeFiles)
		
		cppSourceFileContents
	}
	
	def getOrCreateCPPModel() {
		val modelMatcher = engine.getXtModelToCppModel
		var CPPModel cppModel = null
		if (modelMatcher.hasMatch(xumlrtModel, null)) {
			cppModel = modelMatcher.getOneArbitraryMatch(xumlrtModel, null).cppModel
			if (cppModel.ooplNameProvider == null) {
				cppModel.ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xumlrtModel
				]
			}
		} else {
			val makeRulesFile = createCPPMakeFile
			val rootDirectory = createCPPDirectory => [
				it.makeRulesFile = makeRulesFile
				it.files += makeRulesFile
			]
			cppModel = createCPPModel => [
				commonModel = xumlrtModel
				ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xumlrtModel
				]
				headerDir = rootDirectory
				bodyDir = rootDirectory
			]
			
			val uriWithoutExtension = xumlrtModel.eResource.getURI.trimFileExtension
			val uri = uriWithoutExtension.appendFileExtension("cppmodel")
			val resourceSet = xumlrtModel.eResource.resourceSet
			val cppResource = resourceSet.createResource(uri)
			cppResource.contents += cppModel
			cppResource.contents += rootDirectory
		}
		return cppModel
	}
	
	def performMainGeneration(CPPComponent... components) {
		checkNotNull(fileManager)
		val mainGeneration = new MainGeneration
		mainGeneration.initialize
		
		val mainContent = mainGeneration.execute(components)
		fileManager.createFile("main.cc", mainContent, true, false)
	}
	
	def performMakefileGeneration(CPPModel cppModel, CPPDirectory... otherDirsForMakefile){
		checkNotNull(fileManager)
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
	
	def Map<CPPSourceFile, CharSequence> mapRuntime(CPPDirectory mapperCppDir) {
		if(mapperCppDir!=null) {
			// Map static file sources
			val mapperFileManager = new BundleFileManager(RUNTIME_BUNDLE_ROOT_DIRECTORY)
			val mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, '''«RUNTIME_TARGET_DIRECTORY»/«mapperCppDir.name»/''')
			mapper.execute
			return mapper.mappedSourceFiles
		}
	}
	
	def CPPDirectory getRuntimeCppDir() {
		val resourceSet = xumlrtModel.eResource.resourceSet
		val resource = loadCPPRuntimeModelResource(resourceSet)
		if(resource != null) {
			val runtimeCppDirectory = resource.contents.filter(CPPDirectory).head
			return runtimeCppDirectory
		}
		return null
	}
	
	def createMissingExternalLibrary(Resource cppResource){
		if(cppResource.contents.filter(CPPExternalLibrary).isNullOrEmpty){
			cppResource.contents += createCPPExternalLibrary
		}
	}
	
	def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI(CPP_BASIC_TYPES_PATH, true),
			true)
	}
	
	def loadDefaultContainerImplementations(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI(DEFAULT_IMPLEMENTATIONS_PATH, true),
			true)
	}
	
	def loadCPPRuntimeModelResource(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI(RUNTIME_MODEL_PATH, true), 
			true
		)
	}

	def void dispose() {
		if(!isDisposed){
			isDisposed = true
			
			xumlrtModel = null
			primitiveTypeMapping = null
			extensionServices = null
			
			xtTrafo?.dispose
			xtTrafo = null
			
			xtumlChangeMonitor?.dispose
			xtumlChangeMonitor = null
			
			cppQrtTrafo?.dispose
			cppQrtTrafo = null
			
			cppCompTrafo?.dispose
			cppCompTrafo = null
			
			cppCodeGeneration?.dispose
			cppCodeGeneration = null
			
			makefileGeneration = null
			
			filegen?.dispose
			filegen = null
			
			fileManager = null
		}
	}
	
	def disposeEngine(){
		if (engine != null) {
			engine.dispose
		}
	}
	
	def setLogLevel(Level commonLoggingLevel){
//		logger.level = commonLoggingLevel
		Logger.getLogger(TransformationQrt.package.name).level = commonLoggingLevel
		Logger.getLogger(MakefileGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = commonLoggingLevel
		Logger.getLogger(CPPCodeGeneration.package.name).level = commonLoggingLevel
	}
}