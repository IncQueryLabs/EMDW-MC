package com.incquerylabs.emdw.cpp.ui.util

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalLibrary
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.google.common.base.Stopwatch
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.ui.GeneratorHelper
import com.incquerylabs.emdw.xtuml.incquery.TransitionTriggerWithoutSignalConstraint0
import java.util.Map
import java.util.concurrent.TimeUnit
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.validation.core.ValidationEngine
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil

class CodeGenerator {

	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	val Logger logger
	val toolchainWatch = Stopwatch.createUnstarted
	val cppTransformWatch = Stopwatch.createUnstarted
	val codeGenerationWatch = Stopwatch.createUnstarted
	val fileGenerationWatch = Stopwatch.createUnstarted
	val resourceSaveWatch = Stopwatch.createUnstarted
	
	val AdvancedIncQueryEngine engine
	
	new(AdvancedIncQueryEngine engine){
		this.engine = engine
		xtumlQueries.prepare(engine)
		logger = Logger.getLogger(class)
		setLoggerLevels()
	}
	
	def generateCodeFromXtComponents(ResourceSet xtResourceSet, Iterable<XTComponent> xtComponents, ExecutionEvent event, XtumlModelChangeMonitor xtumlChangeMonitor) {
		toolchainWatch.start
		val managedEngine = IncQueryEngine.on(new EMFScope(xtResourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
		
		val validXtumlModel = validateXtumlModel(engine, event)
		if(validXtumlModel){
			xtumlChangeMonitor?.createCheckpoint
			
			val modelToEntityMatcher = getXtModelEntities(engine)
			val xtModel = modelToEntityMatcher.getAllValuesOfxtModel(xtComponents.head).head
			val cppModel = getOrCreateCPPModel(xtModel, engine, xtResourceSet)
			val cppResource = cppModel.eResource
			
			cppResource.createMissingExternalLibrary
			loadCPPBasicTypes(xtResourceSet)
			loadDefaultContainerImplementations(xtResourceSet)
			
			val cppSourceFileContents = <CPPSourceFile, CharSequence>newHashMap
			xtComponents.forEach[ xtComponent |
				if(xtumlChangeMonitor == null || !xtumlChangeMonitor.started || xtumlChangeMonitor?.dirtyXTComponents.contains(xtComponent)){
					cppTransformWatch.start
					performCppTransformation(engine, xtComponent)
					cppTransformWatch.stop
					codeGenerationWatch.start
					val cppComponent = engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
					val cppSourceFileContentsForComponent = performCodeGeneration(engine, cppComponent)
					cppSourceFileContents.putAll(cppSourceFileContentsForComponent)
					codeGenerationWatch.stop
				}
			]
			fileGenerationWatch.start
			generateFiles(cppResource, cppModel, cppSourceFileContents)
			fileGenerationWatch.stop
			resourceSaveWatch.start
			cppResource.save(null)
			resourceSaveWatch.stop
			xtumlChangeMonitor?.clear
		}
		toolchainWatch.stop
		logger.info('''Code generation finished successfully!''')
		logElapsedTimes()
		
		// Start monitoring
		if (xtumlChangeMonitor != null && !xtumlChangeMonitor.started) {
			xtumlChangeMonitor.startMonitoring
		}
	}
	
	def validateXtumlModel(AdvancedIncQueryEngine engine, ExecutionEvent event) {
		val validationEngine = ValidationEngine.builder.setEngine(engine).build
		val constraintSpecifications = #{
			new TransitionTriggerWithoutSignalConstraint0()
		}
		constraintSpecifications.forEach[
			validationEngine.addConstraintSpecification(it)
		]
    	validationEngine.initialize
    	val allViolations = validationEngine.constraints.map[listViolations].flatten 
    	val validXtumlModel = allViolations.empty
		if(!validXtumlModel){
    		MessageDialog.openError(HandlerUtil.getActiveShell(event),
    			 "Invalid xtUML model",
    			'''
    			The following problems were found in the xtUML model, please correct and re-run code generation:
    			«FOR violation : allViolations»
    			  - «violation.message»
    			«ENDFOR»
    			'''
    		)
    	}
		validationEngine.dispose   
		validXtumlModel
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
		val targetFolder = GeneratorHelper.getTargetFolder(cppResource, false)
		val fileManager = new EclipseWorkspaceFileManager(targetFolder)
		//val fileManager = new JavaIOBasedFileManager(targetFolder.rawLocation.makeAbsolute.toOSString)
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
	
	def performCppTransformation(AdvancedIncQueryEngine engine, XTComponent xtComponent){
		val xform = new XtumlComponentCPPTransformation
		xform.initialize(engine)
		xform.execute(xtComponent)
		xform.dispose
	}
	
	def performCodeGeneration(AdvancedIncQueryEngine engine, CPPComponent cppComponent) {
		val cppCodeGeneration = new CPPCodeGeneration
		cppCodeGeneration.initialize(engine)
		cppCodeGeneration.execute(cppComponent)
		val generatedCppSourceFiles = cppCodeGeneration.generatedCPPSourceFiles
		cppCodeGeneration.dispose
		return generatedCppSourceFiles
	}
	
	def performMakefileGeneration(IFileManager fileManager, MakefileGeneration makefileGeneration, CPPModel cppModel, CPPDirectory... otherDirsForMakefile){
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
	
	def performMainGeneration(IFileManager fileManager, CPPComponent... components) {
		val mainGeneration = new MainGeneration
		mainGeneration.initialize
		
		val mainContent = mainGeneration.execute(components)
		// only create main file if it doesn't exist yet
		if(!fileManager.fileExists("", "main.cc")){
			fileManager.createFile("main.cc", mainContent, true, false)
		}
	}
	
	def getOrCreateCPPModel(Model xtmodel, IncQueryEngine engine, ResourceSet rs) {
		val modelMatcher = getXtModelToCppModel(engine)
		var CPPModel cppModel = null
		if (modelMatcher.hasMatch(xtmodel, null)) {
			cppModel = modelMatcher.getOneArbitraryMatch(xtmodel, null).cppModel
			if (cppModel.ooplNameProvider == null) {
				cppModel.ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtmodel
				]
			}
		} else {
			val makeRulesFile = createCPPMakeFile
			val rootDirectory = createCPPDirectory => [
				it.makeRulesFile = makeRulesFile
				it.files += makeRulesFile
			]
			cppModel = createCPPModel => [
				commonModel = xtmodel
				ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtmodel
				]
				headerDir = rootDirectory
				bodyDir = rootDirectory
			]
			
			val uriWithoutExtension = xtmodel.eResource.getURI.trimFileExtension
			val uri = uriWithoutExtension.appendFileExtension("cppmodel")
			val cppResource = rs.createResource(uri)
			cppResource.contents += cppModel
			cppResource.contents += rootDirectory
		}
		return cppModel
	}
	
	def createMissingExternalLibrary(Resource cppResource){
		if(cppResource.contents.filter(CPPExternalLibrary).isNullOrEmpty){
			cppResource.contents += createCPPExternalLibrary
		}
	}
	
	def void createOrUpdateCppComponent(AdvancedIncQueryEngine engine, XTComponent xtComponent, CPPModel cppModel){
		val cppResource = cppModel.eResource
		val cppComponentMatcher = getCppComponents(engine)
		if (!cppComponentMatcher.hasMatch(xtComponent, null)) {
			val makeRulesF = cppFactory.createCPPMakeFile
			val componentDirectory = cppFactory.createCPPDirectory => [
				it.makeRulesFile = makeRulesF
			]
			componentDirectory.files += makeRulesF
			cppResource.contents += componentDirectory
			val cppComponent = createCppComponent(componentDirectory, xtComponent)
			cppModel.subElements += cppComponent
		} else {
			val cppComponent = cppComponentMatcher.getAllValuesOfcppComponent(xtComponent).head
			if (cppComponent.ooplNameProvider == null) {
				cppComponent.ooplNameProvider = createOOPLExistingNameProvider => [
					commonNamedElement = xtComponent
				]
			}
			val headerDir = cppComponent.headerDirectory
			if(headerDir.makeRulesFile == null) {
				val makeRulesF = createCPPMakeFile
				headerDir.makeRulesFile = makeRulesF
				headerDir.files += makeRulesF
			}
			val bodyDir = cppComponent.bodyDirectory
			if(bodyDir != headerDir && bodyDir.makeRulesFile == null) {
				val makeRulesF = createCPPMakeFile
				bodyDir.makeRulesFile = makeRulesF
				bodyDir.files += makeRulesF
			}
		}
	}
	
	def createCppComponent(CPPDirectory componentDirectory, XTComponent xtComponent){
		val mainBodyFile = createCPPBodyFile
		val mainHeaderFile = createCPPHeaderFile
		val declHeaderFile = createCPPHeaderFile
		val defHeaderFile = createCPPHeaderFile
		componentDirectory.files += mainBodyFile
		componentDirectory.files += mainHeaderFile
		componentDirectory.files += declHeaderFile
		componentDirectory.files += defHeaderFile
		
		val cppComponent = createCPPComponent => [
			it.xtComponent = xtComponent
			it.headerDirectory = componentDirectory
			it.bodyDirectory = componentDirectory
			
			it.mainBodyFile = mainBodyFile
			it.mainHeaderFile = mainHeaderFile
			it.declarationHeaderFile = declHeaderFile
			it.definitionHeaderFile = defHeaderFile
			
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtComponent
			]
		]
		return cppComponent
	}
	
	def loadCPPBasicTypes(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true),
			true)
	}
	
	def loadDefaultContainerImplementations(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel", true),
			true)
	}
	
	def loadCPPRuntimeModelResource(ResourceSet rs) {
		rs.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.codegeneration/model/runtime.cppmodel", true), 
			true
		)
	}
	
	def logElapsedTimes() {
		val toolchainTime = toolchainWatch.elapsed(TimeUnit.MILLISECONDS)
		val cppTransformTime = cppTransformWatch.elapsed(TimeUnit.MILLISECONDS)
		val codeGenerationTime = codeGenerationWatch.elapsed(TimeUnit.MILLISECONDS)
		val fileGenerationTime = fileGenerationWatch.elapsed(TimeUnit.MILLISECONDS)
		val saveResourceTime = resourceSaveWatch.elapsed(TimeUnit.MILLISECONDS)
		val otherTime = toolchainTime-cppTransformTime-codeGenerationTime-fileGenerationTime-saveResourceTime
		
		logger.debug('''
		Elapsed time during the phases:
		Full toolchain:		«toolchainTime» ms
		CPP transformation:	«cppTransformTime» ms («100*cppTransformTime/toolchainTime»%)
		Codegeneration:		«codeGenerationTime» ms («100*codeGenerationTime/toolchainTime»%)
		File generation:	«fileGenerationTime» ms («100*fileGenerationTime/toolchainTime»%)
		Save CPPResource:	«saveResourceTime» ms («100*saveResourceTime/toolchainTime»%)
		Other:				«otherTime» ms («100*otherTime/toolchainTime»%)
		''')
	}
	
	def setLoggerLevels(){
		val commonLoggingLevel = Level.DEBUG
		logger.level = commonLoggingLevel
		Logger.getLogger(MakefileGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = commonLoggingLevel
		Logger.getLogger(CPPCodeGeneration.package.name).level = commonLoggingLevel
		Logger.getLogger(MainGeneration.package.name).level = commonLoggingLevel
	}
}
