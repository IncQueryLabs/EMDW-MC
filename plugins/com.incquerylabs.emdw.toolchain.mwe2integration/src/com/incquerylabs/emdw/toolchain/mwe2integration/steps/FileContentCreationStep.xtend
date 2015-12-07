package com.incquerylabs.emdw.toolchain.mwe2integration.steps

import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSourceFile
import com.google.common.collect.ImmutableMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MainGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.Model2FileMapper
import com.incquerylabs.emdw.cpp.codegeneration.fsa.IFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.BundleFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.EclipseWorkspaceFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JarFileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.common.EMDWConstants
import com.incquerylabs.emdw.cpp.transformation.queries.XtumlQueries
import java.util.Map
import java.util.Set
import org.eclipse.core.resources.IFolder
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.mwe2.runtime.workflow.IWorkflowContext
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.viatra.emf.mwe2integration.mwe2impl.TransformationStep
import org.eclipse.xtend.lib.annotations.Accessors

class FileContentCreationStep extends TransformationStep {
	AdvancedIncQueryEngine engine
	FileAndDirectoryGeneration filegen
	CPPCodeGeneration cppCodeGeneration
	MakefileGeneration makefileGeneration
	MainGeneration mainGeneration
	
	IFileManager mapperFileManager
	IFileManager fileManager
	
	CPPModel cppModel
	Resource xumlrtResource
	IFolder targetDir
	
	Map<CPPSourceFile, CharSequence> cppSourceFileContents
	@Accessors Set<XTComponent> dirtyComponents
	@Accessors boolean isJavaApp = false
	@Accessors boolean isJUnitTestApp = false
	@Accessors String xtumlrtRuntimeDirectory = "model/runtime"
	@Accessors String RUNTIME_BUNDLE_ROOT_DIRECTORY = "com.incquerylabs.emdw.cpp.codegeneration"
	extension XtumlQueries xtUmlQueries = XtumlQueries.instance
	

	override void doInitialize(IWorkflowContext ctx) {
		engine = ctx.get("engine") as AdvancedIncQueryEngine
		cppModel = ctx.get("cppModel") as CPPModel
		
		//Init code generation
		xumlrtResource = ctx.get("xumlrtResource") as Resource
		
		if(cppCodeGeneration == null) {
			cppCodeGeneration = new CPPCodeGeneration
		}
		cppCodeGeneration.initialize(engine)
		
		//init file manager
		
		if(isJavaApp) {
			if(isJUnitTestApp){
				var targetLocation = ctx.get("targetFolderLocation") as String
				mapperFileManager = new JavaIOBasedFileManager("")
				fileManager = new JavaIOBasedFileManager(targetLocation)
			}else{
				var targetLocation = ctx.get("targetFolderLocation") as String
				mapperFileManager = new JarFileManager
				fileManager = new JavaIOBasedFileManager(targetLocation)
			}
		} else {
			targetDir = ctx.get("targetFolder") as IFolder
			mapperFileManager = new BundleFileManager(RUNTIME_BUNDLE_ROOT_DIRECTORY)
			fileManager = new EclipseWorkspaceFileManager(targetDir)
		}
		//init MK generation
		if(makefileGeneration == null) {
			makefileGeneration = new MakefileGeneration
		}
		
		makefileGeneration.initialize()	
		
		//init main generation
		mainGeneration = new MainGeneration
		mainGeneration.initialize
		
	}

	override void doExecute() {
		//create file content
		val runtimeCppDir = getRuntimeCppDir()
		cppSourceFileContents = executeFileContentGeneration(dirtyComponents, cppModel, runtimeCppDir)
		
		//Synchronize files
		executeFileGeneration(cppModel, runtimeCppDir, cppSourceFileContents)
		
		//manual generation
		performMakefileGeneration(cppModel, runtimeCppDir)
		val allCppComponents = engine.cppComponents.getAllValuesOfcppComponent
		performMainGeneration(allCppComponents)
		
	}

	override void dispose() {
		cppCodeGeneration?.dispose
		cppCodeGeneration = null
		mapperFileManager = null
		cppModel = null
	}
	
	private def CPPDirectory getRuntimeCppDir() {
		val resourceSet = xumlrtResource.resourceSet
		val resource = loadCPPRuntimeModelResource(resourceSet)
		if(resource != null) {
			val runtimeCppDirectory = resource.contents.filter(CPPDirectory).head
			return runtimeCppDirectory
		}
		return null
	}
	
	private def loadCPPRuntimeModelResource(ResourceSet rs) {
		rs.getResource(URI::createURI(EMDWConstants::CPP_RUNTIME_LIBRARY_PATH)	, true)
	}
	
	private def executeFileContentGeneration(Iterable<XTComponent> componentsToTransform, CPPModel cppModel, CPPDirectory runtimeCppDir) {
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
	
	// CPP code generation for single component
	private def executeCppCodeGeneration(CPPComponent cppComponent) {
		cppCodeGeneration.execute(cppComponent)
		return cppCodeGeneration.generatedCPPSourceFiles
	}
	
	private def Map<CPPSourceFile, CharSequence> mapRuntime(CPPDirectory mapperCppDir) {
		if(mapperCppDir!=null) {
			// Map static file sources
			val mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, xtumlrtRuntimeDirectory+"/"+mapperCppDir.name)
//			if(isJavaApp){
//				mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, Paths::get(xtumlrtRuntimeDirectory, mapperCppDir.name))
//			}else{
//				mapper = new Model2FileMapper(mapperFileManager, mapperCppDir, Paths::get(xtumlrtRuntimeDirectory, mapperCppDir.name))
//			}
			
			mapper.execute
			return mapper.mappedSourceFiles
		}
	}
	
	private def performRulesMkGeneration(MakefileGeneration makefileGeneration, CPPModel cppModel) {
		makefileGeneration.executeRulesMk(cppModel.headerDir)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			makefileGeneration.executeRulesMk(cppModel.bodyDir)
		}
	}
	
	// File generation
	def executeFileGeneration(CPPModel cppModel, CPPDirectory runtimeDirectory, Map<CPPSourceFile, CharSequence> cppSourceFileContents){
		if(filegen == null) {
			filegen = new FileAndDirectoryGeneration
		}
		filegen.initialize(engine, fileManager, ImmutableMap.copyOf(cppSourceFileContents))
		
		// Model based file generation
		filegen.execute(cppModel.headerDir)
		if(cppModel.bodyDir != cppModel.headerDir){
			filegen.execute(cppModel.bodyDir)
		}
		// Runtime, Makefile and main.cc generation
		filegen.execute(runtimeDirectory)
	}
	
	def performMakefileGeneration(CPPModel cppModel, CPPDirectory... otherDirsForMakefile){
		val listOfDirs = <String>newArrayList
		listOfDirs.add(cppModel.headerDir.name)
		if(cppModel.headerDir!=cppModel.bodyDir) {
			listOfDirs.add(cppModel.bodyDir.name)
		}
		otherDirsForMakefile.forEach[listOfDirs.add(it.name)]
		val makefileContent = makefileGeneration.executeMakefile(cppModel.cppName, listOfDirs)
		// only create MakeFile if it doesn't exist yet
		if(!fileManager.isFileExists("", "Makefile")){
			fileManager.createFile("Makefile", makefileContent, true, false)
		}
	}
	
	def performMainGeneration(CPPComponent... components) {
		
		
		val mainContent = mainGeneration.execute(components)
		// only create main file if it doesn't exist yet
		if(!fileManager.isFileExists("", "main.cc")){
			fileManager.createFile("main.cc", mainContent, true, false)
		}
	}
}
