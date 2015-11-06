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
import com.google.common.base.Stopwatch
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Maps
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppCodeGenerationQueries
import com.incquerylabs.emdw.cpp.codegeneration.queries.CppFileAndDirectoryQueries
import com.incquerylabs.emdw.cpp.common.mapper.queries.UmlQueries
import com.incquerylabs.emdw.cpp.common.util.IEMDWProgressMonitor
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.CppQueries
import com.incquerylabs.emdw.cpp.transformation.queries.MonitorQueries
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.CPPRuleExtensionService
import com.incquerylabs.emdw.umlintegration.queries.CppExtensionQueries
import com.incquerylabs.emdw.umlintegration.queries.StateMachine
import com.incquerylabs.emdw.umlintegration.queries.Structure
import com.incquerylabs.emdw.umlintegration.queries.Trace
import com.incquerylabs.emdw.xtuml.incquery.XtumlValidationQueries
import java.nio.file.Paths
import java.util.Map
import java.util.Set
import java.util.concurrent.TimeUnit
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
import org.eclipse.incquery.validation.core.ValidationEngine
import com.incquerylabs.emdw.xtuml.incquery.TransitionTriggerWithoutSignalConstraint0
import com.incquerylabs.emdw.xtuml.incquery.FileNameCollisionConstraint0
import com.incquerylabs.emdw.xtuml.incquery.CppNameCollisionConstraint0

class Toolchain {
	protected String RUNTIME_BUNDLE_ROOT_DIRECTORY = "com.incquerylabs.emdw.cpp.codegeneration"
	protected String RUNTIME_TARGET_DIRECTORY = "model/runtime"
	
	static val DEFAULT_CPP_BASIC_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	static val DEFAULT_IMPLEMENTATIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	static val DEFAULT_RUNTIME_MODEL_PATH = "/com.incquerylabs.emdw.cpp.codegeneration/model/runtime.cppmodel"
	
	protected URI CPP_BASIC_TYPES_URI = URI.createPlatformPluginURI(DEFAULT_CPP_BASIC_TYPES_PATH, true)
	protected URI COLLECTION_IMPLEMENTATIONS_URI = URI.createPlatformPluginURI(DEFAULT_IMPLEMENTATIONS_PATH, true)
	protected URI RUNTIME_MODEL_URI = URI.createPlatformPluginURI(DEFAULT_RUNTIME_MODEL_PATH, true)
	
	
	public static def ToolchainBuilder builder(){
		return new ToolchainBuilder
	}
	
	protected new(){}
	
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
	
	enum Phase {
		INIT_XUMLRT_QRT,
		INIT_CPP_PREREQUISITES,
		INIT_CPP_QRT,
		INIT_CPP_COMP,
		INIT_CPP_CODEGEN,
		INIT_FILEGEN,
		INIT_MAKEFILE_GEN,
		EXECUTE_XUMLRT_QRT,
		EXECUTE_CPP_QRT,
		EXECUTE_CPP_COMP,
		EXECUTE_RALF_COMPILE,
		EXECUTE_CPP_CODEGEN,
		EXECUTE_CONTENT_GEN,
		EXECUTE_FILEGEN,
		EXECUTE_DELTA
	}
	
	val Map<Phase, Long> measuredTimes = Maps.newEnumMap(Phase)
	
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
	@Accessors IFileManager mapperFileManager
	
	boolean isDisposed = false
	boolean isXumlrtTrafoInitialized = false
	boolean isCppQrtTrafoInitialized = false
	boolean isCppCompTrafoInitialized = false
	boolean areCppPrerequisitesInitialized = false
	boolean isCppCodegenerationInitialized = false
	boolean isMakefileGenerationInitialized = false
	
	extension val XtumlQueries xtumlQueries = XtumlQueries.instance
	extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	extension val Logger logger = Logger.getLogger(this.class.package.name)
	
	IncQueryEngine managedEngine
	
	def prepareToolchainQueries() {
		TOOLCHAIN_QUERIES.prepare(engine)
	}
	
	def initializeXtTransformation() {
		if(!isXumlrtTrafoInitialized) {
			val watch = Stopwatch.createStarted
			if(xtTrafo == null){
				xtTrafo = new TransformationQrt
			}
			if(extensionServices == null) {
				extensionServices = <UmlIntegrationExtension>newHashSet(new CPPRuleExtensionService)
			}
			
			val xUmlRtResource = xumlrtModel.eResource
			val Set<UmlIntegrationExtension> extensionServices = newHashSet(new CPPRuleExtensionService)
			extensionServices.forEach[initialize(engine, xUmlRtResource)]
			xtTrafo.extensionServices = extensionServices
			xtTrafo.externalTypeMap = primitiveTypeMapping
			xtTrafo.initialize(engine)
			
			isXumlrtTrafoInitialized = true
			watch.logTime(Phase.INIT_XUMLRT_QRT)
		}
	}
	
	def initializeCppQrtTransformation() {
		initializeCppTransformationPrerequisites
		if(!isCppQrtTrafoInitialized) {
			if(cppQrtTrafo == null) {
				cppQrtTrafo = new XtumlCPPTransformationQrt
			}
			val watch = Stopwatch.createStarted
			cppQrtTrafo.initialize(engine)
			isCppQrtTrafoInitialized = true
			
			watch.logTime(Phase.INIT_CPP_QRT)
		}
	}
	
	def initializeCppComponentTransformation() {
		initializeCppTransformationPrerequisites
		if(! isCppCompTrafoInitialized){
			if(cppCompTrafo == null) {
				cppCompTrafo = new XtumlComponentCPPTransformation
			}
			val watch = Stopwatch.createStarted
			cppCompTrafo.initialize(engine)
			isCppCompTrafoInitialized = true
			
			watch.logTime(Phase.INIT_CPP_COMP)
		}
	}
	
	protected def initializeCppTransformationPrerequisites() {
		if(!areCppPrerequisitesInitialized) {
			val watch = Stopwatch.createStarted
			val resourceSet = xumlrtModel.eResource.resourceSet
						
			managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
			GenericPatternGroup.of(
				OoplQueryBasedFeatures.instance,
				QueryBasedFeatures.instance
			).prepare(managedEngine)
			resourceSet.loadCPPBasicTypes
			resourceSet.loadDefaultContainerImplementations
			
			areCppPrerequisitesInitialized = true
			
			watch.logTime(Phase.INIT_CPP_PREREQUISITES)
		}
	}
	
	def initializeCppCodegeneration() {
		if(!isCppCodegenerationInitialized){
			if(cppCodeGeneration == null) {
				cppCodeGeneration = new CPPCodeGeneration
			}
			val watch = Stopwatch.createStarted
			cppCodeGeneration.initialize(engine)
			isCppCodegenerationInitialized = true
			
			watch.logTime(Phase.INIT_CPP_CODEGEN)
		}
	}
	
	def initializeMakefileGeneration() {
		if(!isMakefileGenerationInitialized) {
			if(makefileGeneration == null) {
				makefileGeneration = new MakefileGeneration
			}
			val watch = Stopwatch.createStarted
			makefileGeneration.initialize()
			isMakefileGenerationInitialized = true
			
			watch.logTime(Phase.INIT_MAKEFILE_GEN)
		}
	}
	
	// Incremental transformations
	def executeXtTransformation() {
		val watch = Stopwatch.createStarted
		xtTrafo.execute
		
		watch.logTime(Phase.EXECUTE_XUMLRT_QRT)
	}
	
	def executeCppQrtTransformation() {
		val watch = Stopwatch.createStarted
		getOrCreateCPPModel
		cppQrtTrafo.execute
		
		watch.logTime(Phase.EXECUTE_CPP_QRT)
	}
	
	// CPP transform for ALL components
	def executeCppStructureTransformation() {
		val watch = Stopwatch.createStarted
		val cppModel = getOrCreateCPPModel
		val cppResource = cppModel.eResource
		createMissingExternalLibrary(cppResource)
		
		cppCompTrafo.transformComponents
		
		watch.logTime(Phase.EXECUTE_CPP_COMP)
	}
	
	def executeCppActionCodeCompile(IEMDWProgressMonitor progressMonitor) {
		val watch = Stopwatch.createStarted
		cppCompTrafo.compileActionCodes(progressMonitor)
		
		watch.logTime(Phase.EXECUTE_RALF_COMPILE)
	}
	
	// CPP transform for single component
	def executeCppStructureTransformation(XTComponent component) {
		val watch = Stopwatch.createStarted
		val cppModel = getOrCreateCPPModel
		val cppResource = cppModel.eResource
		createMissingExternalLibrary(cppResource)
		
		cppCompTrafo.transformComponent(component)
		
		watch.logPartTime(Phase.EXECUTE_CPP_COMP)
	}
	
	def executeCppActionCodeCompile(XTComponent component, IEMDWProgressMonitor progressMonitor) {
		val watch = Stopwatch.createStarted
		cppCompTrafo.compileActionCodes(component, progressMonitor)
		
		watch.logPartTime(Phase.EXECUTE_RALF_COMPILE)
	}
	
	// CPP code generation for single component
	def executeCppCodeGeneration(CPPComponent cppComponent) {
		val watch = Stopwatch.createStarted
		cppCodeGeneration.execute(cppComponent)
		
		watch.logPartTime(Phase.EXECUTE_CPP_CODEGEN)
		return cppCodeGeneration.generatedCPPSourceFiles
	}
	
	// File generation
	def executeFileGeneration(CPPModel cppModel, CPPDirectory runtimeDirectory, Map<CPPSourceFile, CharSequence> cppSourceFileContents){
		val watch = Stopwatch.createStarted
		checkNotNull(fileManager)
		if(filegen == null) {
			filegen = new FileAndDirectoryGeneration
		}
		filegen.initialize(engine, fileManager, ImmutableMap.copyOf(cppSourceFileContents))
		watch.logTime(Phase.INIT_FILEGEN)
		
		watch.reset.start
		// Model based file generation
		filegen.execute(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir){
			filegen.execute(cppModel.bodyDir)
		}
		// Runtime, Makefile and main.cc generation
		filegen.execute(runtimeDirectory)
		watch.logTime(Phase.EXECUTE_FILEGEN)
	}
	
	
	def startChangeMonitor() {
		if(xtumlChangeMonitor == null) {
			xtumlChangeMonitor = new XtumlModelChangeMonitor(engine)
		}
		if (!xtumlChangeMonitor.started) {
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
	
	def executeCodeAndFileGenerationForAllComponents(IEMDWProgressMonitor progressMonitor) {
		val allXtComponents = engine.xtComponents.allValuesOfxtComponent
		executeCodeAndFileGeneration(allXtComponents, progressMonitor)
	}
	
	def executeDeltaCodeAndFileGeneration(IEMDWProgressMonitor progressMonitor) {
		val watch = Stopwatch.createStarted
		createChangeMonitorCheckpoint()
		
		// get dirty components
		val componentsToTransform = dirtyXtComponents
		
		// The code and filegeneration is measured with the same phase identifier 
		// as the delta generation, because this part of the measurement only
		// consists of the change monitor handling
		watch.stop
		executeCodeAndFileGeneration(componentsToTransform, progressMonitor)
		watch.start
		
		if(!progressMonitor.canceled){
			xtumlChangeMonitor?.clear
		}
		watch.logTime(Phase.EXECUTE_DELTA)
	}
	
	def void executeCodeAndFileGeneration(Iterable<XTComponent> componentsToTransform, IEMDWProgressMonitor progressMonitor){
		val watch = Stopwatch.createStarted
		// CPP Component Transformation
		componentsToTransform.forEach[
			it.executeCppStructureTransformation
			it.executeCppActionCodeCompile(progressMonitor)
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
		watch.logTime(Phase.EXECUTE_DELTA)
	}
	
	def executeFileContentGeneration(Iterable<XTComponent> componentsToTransform, CPPModel cppModel, CPPDirectory runtimeCppDir) {
		val watch = Stopwatch.createStarted
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
		
		watch.logTime(Phase.EXECUTE_CONTENT_GEN)
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
		// only create main file if it doesn't exist yet
		if(!fileManager.fileExists("", "main.cc")){
			fileManager.createFile("main.cc", mainContent, true, false)
		}
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
		// only create MakeFile if it doesn't exist yet
		if(!fileManager.fileExists("", "Makefile")){
			fileManager.createFile("Makefile", makefileContent, true, false)
		}
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
			if(mapperFileManager == null) {
				mapperFileManager = new BundleFileManager(RUNTIME_BUNDLE_ROOT_DIRECTORY)
			}
			val mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, Paths::get(RUNTIME_TARGET_DIRECTORY, mapperCppDir.name))
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
	
	def validateXtumlModel() {
		val validationEngine = ValidationEngine.builder.setEngine(engine).build
		val constraintSpecifications = #{
			new TransitionTriggerWithoutSignalConstraint0(),
			new FileNameCollisionConstraint0(),
			new CppNameCollisionConstraint0()
		}
		constraintSpecifications.forEach[
			validationEngine.addConstraintSpecification(it)
		]
		validationEngine.initialize
		val allViolations = validationEngine.constraints.map[listViolations].flatten 
		
		validationEngine.dispose
		allViolations
	}
	
	def createMissingExternalLibrary(Resource cppResource){
		if(cppResource.contents.filter(CPPExternalLibrary).isNullOrEmpty){
			cppResource.contents += createCPPExternalLibrary
		}
	}
	
	def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(CPP_BASIC_TYPES_URI, true)
	}
	
	def loadDefaultContainerImplementations(ResourceSet rs) {
		rs.getResource(COLLECTION_IMPLEMENTATIONS_URI, true)
	}
	
	def loadCPPRuntimeModelResource(ResourceSet rs) {
		rs.getResource(RUNTIME_MODEL_URI, true)
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
		logger.level = commonLoggingLevel
		Logger.getLogger(TransformationQrt.package.name).level = commonLoggingLevel
		Logger.getLogger(MakefileGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = commonLoggingLevel
		Logger.getLogger(CPPCodeGeneration.package.name).level = commonLoggingLevel
	}
	
	def logTime(Stopwatch watch, Phase phase) {
		watch.stop
		val elapsedTime = watch.elapsed(TimeUnit.MILLISECONDS)
		measuredTimes.put(phase, elapsedTime)
		logPhase(phase, elapsedTime)
	}
	
	def logPartTime(Stopwatch watch, Phase phase) {
		watch.stop
		val elapsedTime = watch.elapsed(TimeUnit.MILLISECONDS)
		measuredTimes.addTime(phase, elapsedTime)
		logPhase(phase, elapsedTime)
	}
	
	def logMeasuredTimes() {
		info('''********** Phase durations **********''')
		measuredTimes.forEach[phase, time |
			logPhase(phase, time)
		]
		info('''*************************************''')
	}
	
	def logPhase(Phase phase, long time){
		switch phase {
			case INIT_XUMLRT_QRT: info('''Uml to xuml-rt transformation initialization: «time» ms''')
			case INIT_CPP_PREREQUISITES: info('''Cpp transformation prerequisites initialization: «time» ms''')
			case INIT_CPP_QRT: info('''Xuml-rt to cppmodel QRT transformation initialization: «time» ms''')
			case INIT_CPP_COMP: info('''Xuml-rt to cppmodel component transformation initialization: «time» ms''')
			case INIT_CPP_CODEGEN: info('''Cpp code generation initialization: «time» ms''')
			case INIT_FILEGEN: info('''File generation initialization: «time» ms''')
			case INIT_MAKEFILE_GEN: info('''Make file generation initialization: «time» ms''')
			case EXECUTE_XUMLRT_QRT: info('''Uml to xuml-rt transformation manual execution: «time» ms''')
			case EXECUTE_CPP_QRT: info('''Xuml-rt to cppmodel QRT transformation manual execution: «time» ms''')
			case EXECUTE_CPP_COMP: info('''Xuml-rt to cppmodel component structure transformation: «time» ms''')
			case EXECUTE_RALF_COMPILE: info('''Action code compile: «time» ms''')
			case EXECUTE_CPP_CODEGEN: info('''Cpp code generation: «time» ms''')
			case EXECUTE_CONTENT_GEN : info('''All file content generation: «time» ms''')
			case EXECUTE_FILEGEN: info('''File generation: «time» ms''')
			case EXECUTE_DELTA: info('''Delta transformation: «time» ms''')
			default : info('''Unknown phase: «time» ms''')
		}
	}
	
	def addTime(Map<Phase, Long> measurements, Phase phase, long amount) {
		if(measurements.containsKey(phase)){
			val newTime = measurements.get(phase) + amount
			measurements.put(phase, newTime)
		}
		else {
			measurements.put(phase, amount)
		}
	}
	
	def clearMeasuredTimes() {
		measuredTimes.clear
	}
}

