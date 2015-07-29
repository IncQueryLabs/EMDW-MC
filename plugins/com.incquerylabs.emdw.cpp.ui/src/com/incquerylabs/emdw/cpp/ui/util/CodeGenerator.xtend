package com.incquerylabs.emdw.cpp.ui.util

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import com.incquerylabs.emdw.cpp.ui.GeneratorHelper
import com.incquerylabs.emdw.xtuml.incquery.TransitionTriggerWithoutSignalConstraint0
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.eclipse.core.commands.ExecutionEvent
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.validation.core.ValidationEngine
import org.eclipse.jface.dialogs.MessageDialog
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.ui.handlers.HandlerUtil
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import org.eclipse.emf.ecore.resource.Resource
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalLibrary
import java.util.Map
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor

class CodeGenerator {

	extension XtumlQueries xtumlQueries = XtumlQueries.instance
	extension CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	extension OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	def generateCodeFromXtComponents(ResourceSet xtResourceSet, Iterable<XTComponent> xtComponents, ExecutionEvent event, XtumlModelChangeMonitor xtumlChangeMonitor) {
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(xtResourceSet))
		try {
			val managedEngine = IncQueryEngine.on(new EMFScope(xtResourceSet))
			QueryBasedFeatures.instance.prepare(managedEngine)
			
			clearCPPModel(engine, xtResourceSet)
			var XtumlCPPTransformationQrt xformqrt = new XtumlCPPTransformationQrt
	
			xformqrt.initialize(engine)
			try {
				xformqrt.execute
				
				val validXtumlModel = validateXtumlModel(engine, event)
				if(validXtumlModel){
					xtumlChangeMonitor?.createCheckpoint
					xtComponents.forEach[ xtComponent |
//						if(xtumlChangeMonitor == null || !xtumlChangeMonitor.started || xtumlChangeMonitor?.dirtyXTComponents.contains(xtComponent)){
							performCodeGenerationOnXtComponent(engine, xtComponent, xtResourceSet)
//						}
					]
					xtumlChangeMonitor?.clear
				}
			} finally {
				xformqrt.dispose
			}
			
			// Start monitoring
			if (xtumlChangeMonitor != null && !xtumlChangeMonitor.started) {
				xtumlChangeMonitor.startMonitoring
			}
		} finally {
			engine.dispose
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
	
	def performCodeGenerationOnXtComponent(AdvancedIncQueryEngine engine, XTComponent xtComponent, ResourceSet xtResourceSet) {
		xtumlQueries.prepare(engine)
		val modelToEntityMatcher = getXtModelEntities(engine)

		val xtModel = modelToEntityMatcher.getAllValuesOfxtModel(xtComponent).head
		val cppModel = getOrCreateCPPModel(xtModel, engine, xtResourceSet)
		val cppResource = cppModel.eResource
		
		loadCPPBasicTypes(xtResourceSet)
		loadDefaultContainerImplementations(xtResourceSet)
		
		cppResource.createExternalLibrary
		
		performCppTransformation(engine, xtComponent)
		cppResource.save(null)
		
		val generatedCppSourceFiles = <CPPSourceFile, CharSequence>newHashMap
		val mapperCppDir = getMapperCppDir(cppResource.resourceSet)
		generatedCppSourceFiles.putAll(mapRuntime(mapperCppDir))
		
		val cppComponent = engine.cppComponents.getAllValuesOfcppComponent(xtComponent).head
		val cppCodeGeneration = new CPPCodeGeneration
		performCodeGeneration(engine, cppCodeGeneration, cppComponent)
		generatedCppSourceFiles.putAll(cppCodeGeneration.generatedCPPSourceFiles)
		
		val makefileGeneration = new MakefileGeneration
		val makefileContent = performMakefileGeneration(makefileGeneration, cppModel, mapperCppDir)
		generatedCppSourceFiles.putAll(makefileGeneration.generatedCPPMakeFiles)
		
		val mainGeneration = new MainGeneration
		val mainContent = performMainGeneration(mainGeneration, cppComponent)
		
		val targetFolder = GeneratorHelper.getTargetFolder(cppResource, false)
		val filegen = new FileAndDirectoryGeneration
		val fileManager = new EclipseWorkspaceFileManager(targetFolder)
		//val fileManager = new JavaIOBasedFileManager(targetFolder.rawLocation.makeAbsolute.toOSString)
		filegen.initialize(engine, fileManager, ImmutableMap.copyOf(generatedCppSourceFiles))
		
		performFileGeneration(engine, cppModel, cppCodeGeneration, filegen, fileManager)
		filegen.execute(mapperCppDir)

		fileManager.createFile("Makefile", makefileContent, true, false)
		fileManager.createFile("main.cc", mainContent, true, false)
		
		cppCodeGeneration.dispose
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
			for(obj : resource.contents) {
				if(obj instanceof CPPDirectory) {
					return obj
				}
			}
		}
		return null
	}
	
	def performCppTransformation(AdvancedIncQueryEngine engine, XTComponent xtComponent){
		Logger.getLogger(XtumlComponentCPPTransformation.package.name).level = Level.DEBUG
		val xform = new XtumlComponentCPPTransformation
		xform.initialize(engine)
		xform.execute(xtComponent)
		xform.dispose
	}
	
	def performCodeGeneration(AdvancedIncQueryEngine engine, CPPCodeGeneration cppCodeGeneration, CPPComponent cppComponent){
		Logger.getLogger(CPPCodeGeneration.package.name).level = Level.DEBUG
		cppCodeGeneration.initialize(engine)
		cppCodeGeneration.execute(cppComponent)
	}
	
	def performMakefileGeneration(MakefileGeneration makefileGeneration, CPPModel cppModel, CPPDirectory... otherDirsForMakefile){
		Logger.getLogger(MakefileGeneration.package.name).level = Level.DEBUG
		makefileGeneration.initialize()
		
		val listOfDirs = <String>newArrayList
		listOfDirs.add(cppModel.headerDir.name)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			listOfDirs.add(cppModel.bodyDir.name)
		}
		otherDirsForMakefile.forEach[listOfDirs.add(it.name)]
		val makefileContent = makefileGeneration.executeMakefile(cppModel.cppName, listOfDirs)
		
		
		makefileGeneration.executeRulesMk(cppModel.headerDir)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			makefileGeneration.executeRulesMk(cppModel.bodyDir)
		}
		
		return makefileContent
	}
	
	def performMainGeneration(MainGeneration mainGeneration, CPPComponent... components) {
		Logger.getLogger(MainGeneration.package.name).level = Level.DEBUG
		mainGeneration.initialize
		
		val mainContent = mainGeneration.execute(components)
		return mainContent
	}
	
	def performFileGeneration(
		AdvancedIncQueryEngine engine, 
		CPPModel cppModel, 
		CPPCodeGeneration cppCodeGeneration, 
		FileAndDirectoryGeneration filegen,
		IFileManager fileManager
	){
		val generatedCPPSourceFiles = cppCodeGeneration.generatedCPPSourceFiles
		
		//val fileManager = new JavaIOBasedFileManager(targetFolder.rawLocation.makeAbsolute.toOSString)
		filegen.initialize(engine, fileManager, generatedCPPSourceFiles)
		filegen.execute(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir){
			filegen.execute(cppModel.bodyDir)
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
	
	def createExternalLibrary(Resource cppResource){
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
	
	// XXX 
	def clearCPPModel(AdvancedIncQueryEngine engine, ResourceSet resourceSet) {
		val modelToEntityMatcher = getXtModelEntities(engine)
		
		val xtModels = modelToEntityMatcher.getAllValuesOfxtModel
		xtModels.forEach[ xtModel | 
			val cppModel = getOrCreateCPPModel(xtModel, engine, resourceSet)
			cppModel.subElements.clear
			cppModel.bodyDir.subDirectories.clear
			if(cppModel.bodyDir != cppModel.headerDir)
				cppModel.headerDir.subDirectories.clear
		]
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
}
