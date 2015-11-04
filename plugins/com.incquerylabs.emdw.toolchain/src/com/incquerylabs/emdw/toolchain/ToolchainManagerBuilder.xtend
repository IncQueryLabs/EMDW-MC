package com.incquerylabs.emdw.toolchain

import com.google.common.collect.BiMap
import com.google.common.collect.HashBiMap
import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import com.incquerylabs.emdw.cpp.codegeneration.fsa.impl.JavaIOBasedFileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import com.incquerylabs.emdw.umlintegration.cpp.CPPRuleExtensionService
import java.util.Map
import java.util.Set
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.exception.IncQueryException
import org.eclipse.uml2.uml.Type
import org.eclipse.xtend.lib.annotations.Accessors

import static com.google.common.base.Preconditions.*
import org.apache.log4j.Level
import org.eclipse.papyrusrt.xtumlrt.common.Model

class ToolchainBuilder {
	static val BiMap<AdvancedIncQueryEngine, Toolchain> toolchains = HashBiMap.create()
	
	static val PATHMAP_SCHEME = "pathmap";
	static val UML_LIBRARIES_AUTHORITY = "UML_LIBRARIES";
	
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
	@Accessors FileManager fileManager
	
	def Toolchain buildOrGetManager(){
		var Toolchain toolchain = null
		if (toolchains.containsKey(engine)){
			toolchain = toolchains.get(engine)
			toolchain.initializeManager
		} else {
			checkNotNull(xumlrtModel, "xUML-RT Model cannot be null!")
			toolchain = new Toolchain
			toolchain.initializeManager
			toolchain.logLevel = Level.INFO
			val lifeCycleListener = new ToolchainLifecycleListener(this, toolchain)
			toolchain.engine.addLifecycleListener(lifeCycleListener)
			toolchains.put(engine, toolchain)
		}
		
		toolchain
	}
	
	def disposeToolchain(Toolchain toolchain){
		toolchain.dispose
		toolchains.inverse.remove(toolchain)
	}
	
	static def disposeAllToolchains() {
		toolchains.forEach[engine, toolchain|
			toolchain.dispose
		]
		toolchains.clear
	}
	
	private def initializeManager(Toolchain manager) {
		// Set fields to the provided objects
		// Use the previously set object if null is provided
		// Create default objects if it was set to null
		val targetFolderPath = xumlrtModel?.eResource?.URI?.toFileString
		
		manager => [
			it.xumlrtModel			= this.xumlrtModel			?: it.xumlrtModel
			it.primitiveTypeMapping = this.primitiveTypeMapping ?: it.primitiveTypeMapping
			
			it.engine				= this.engine				?: it.engine				?: createDefaultEngine(it.xumlrtModel.eResource.resourceSet)
			it.xtumlChangeMonitor	= this.xtumlChangeMonitor	?: it.xtumlChangeMonitor	?: new XtumlModelChangeMonitor(it.engine)
			
			it.xtTrafo				= this.xtTrafo				?: it.xtTrafo				?: new TransformationQrt
			it.cppQrtTrafo			= this.cppQrtTrafo			?: it.cppQrtTrafo			?: new XtumlCPPTransformationQrt
			it.cppCompTrafo			= this.cppCompTrafo			?: it.cppCompTrafo			?: new XtumlComponentCPPTransformation
			it.cppCodeGeneration	= this.cppCodeGeneration	?: it.cppCodeGeneration		?: new CPPCodeGeneration
			
			it.fileManager			= this.fileManager			?: it.fileManager			?: new JavaIOBasedFileManager(targetFolderPath)
			it.filegen				= this.filegen				?: it.filegen				?: new FileAndDirectoryGeneration
			it.makefileGeneration	= this.makefileGeneration	?: it.makefileGeneration	?: new MakefileGeneration
			it.extensionServices	= this.extensionServices	?: it.extensionServices		?: <UmlIntegrationExtension>newHashSet(new CPPRuleExtensionService)
		]
		manager.prepareToolchainQueries
		
		manager
	}
	
	def createDefaultEngine(ResourceSet resourceSet) throws IncQueryException {
		val options = new BaseIndexOptions().withResourceFilterConfiguration([
			val uri = getURI();
			if (uri.toString().contains("RALF")) {
				return false;
			}
			return PATHMAP_SCHEME.equals(uri.scheme()) && !uri.authority().equals(UML_LIBRARIES_AUTHORITY);
		]);
		val scope = new EMFScope(resourceSet, options);
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(scope);
		return engine;
	}
}