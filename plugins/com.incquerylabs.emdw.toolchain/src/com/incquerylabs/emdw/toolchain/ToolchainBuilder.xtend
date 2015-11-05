package com.incquerylabs.emdw.toolchain

import com.incquerylabs.emdw.cpp.codegeneration.CPPCodeGeneration
import com.incquerylabs.emdw.cpp.codegeneration.FileAndDirectoryGeneration
import com.incquerylabs.emdw.cpp.codegeneration.MakefileGeneration
import com.incquerylabs.emdw.cpp.codegeneration.fsa.FileManager
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.cpp.transformation.monitor.XtumlModelChangeMonitor
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.UmlIntegrationExtension
import java.util.Map
import java.util.Set
import org.apache.log4j.Level
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.base.api.BaseIndexOptions
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.exception.IncQueryException
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.uml2.uml.Type

import static com.google.common.base.Preconditions.*

class ToolchainBuilder {
	
	static val PATHMAP_SCHEME = "pathmap";
	static val UML_LIBRARIES_AUTHORITY = "UML_LIBRARIES";
	
	private var Toolchain toolchain = new Toolchain
	
	protected new(){}
	
	def Toolchain build(){
		checkNotNull(xumlrtModel, "xUML-RT Model cannot be null!")
		if(engine == null) {
			engine = createDefaultEngine(xumlrtModel.eResource.resourceSet)
		}
		
//		val targetFolderPath = xumlrtModel?.eResource?.URI?.toFileString
//		if(fileManager == null){
//			fileManager = new JavaIOBasedFileManager(targetFolderPath)
//		}
		
		toolchain.prepareToolchainQueries
		toolchain.logLevel = Level.INFO
		val lifeCycleListener = new ToolchainLifecycleListener(toolchain)
		toolchain.engine.addLifecycleListener(lifeCycleListener)
		ToolchainManager.addToolchain(engine, toolchain)
		
		val resultToolchain = toolchain
		toolchain = new Toolchain
		return resultToolchain
	}
	
	def getEngine() {
		toolchain.engine
	}
	
	def setEngine(AdvancedIncQueryEngine engine) {
		toolchain.engine = engine
	}
	
	def getXumlrtModel() {
		toolchain.xumlrtModel
	}
	
	def setXumlrtModel(Model xumlrtModel) {
		toolchain.xumlrtModel = xumlrtModel
	}
	
	def getXtTrafo() {
		toolchain.xtTrafo
	}
	
	def setXtTrafo(TransformationQrt xtTrafo) {
		toolchain.xtTrafo = xtTrafo
	}
	
	def getCppQrtTrafo() {
		toolchain.cppQrtTrafo
	}
	
	def setCppQrtTrafo(XtumlCPPTransformationQrt cppQrtTrafo) {
		toolchain.cppQrtTrafo = cppQrtTrafo
	}
	
	def getCppCompTrafo() {
		toolchain.cppCompTrafo
	}
	
	def setCppCompTrafo(XtumlComponentCPPTransformation cppCompTrafo){
		toolchain.cppCompTrafo = cppCompTrafo
	}
	
	def getCppCodeGeneration(){
		toolchain.cppCodeGeneration
	}
	
	def setCppCodeGeneration(CPPCodeGeneration cppCodeGeneration) {
		toolchain.cppCodeGeneration = cppCodeGeneration
	}
	
	def getFilegen() {
		toolchain.filegen
	}
	
	def setFilegen(FileAndDirectoryGeneration filegen) {
		toolchain.filegen = filegen
	}
	
	def getMakefileGeneration() {
		toolchain.makefileGeneration
	}
	
	def setMakefileGeneration(MakefileGeneration makefileGeneration) {
		toolchain.makefileGeneration = makefileGeneration
	}
	
	def getXtumlChangeMonitor() {
		toolchain.xtumlChangeMonitor
	}
	
	def setXtumlChangeMonitor(XtumlModelChangeMonitor xtumlChangeMonitor) {
		toolchain.xtumlChangeMonitor = xtumlChangeMonitor
	}
	
	def getFileManager() {
		toolchain.fileManager
	}
	
	def setFileManager(FileManager fileManager) {
		toolchain.fileManager = fileManager
	}
	
	def getPrimitiveTypeMapping(){
		toolchain.primitiveTypeMapping
	}
	
	def setPrimitiveTypeMapping(Map<Type, org.eclipse.papyrusrt.xtumlrt.common.Type> primitiveTypeMapping){
		toolchain.primitiveTypeMapping = primitiveTypeMapping
	}
	
	def getExtensionServices(){
		toolchain.extensionServices
	}
	
	def setExtensionServices(Set<UmlIntegrationExtension> extensionServices){
		toolchain.extensionServices = extensionServices
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