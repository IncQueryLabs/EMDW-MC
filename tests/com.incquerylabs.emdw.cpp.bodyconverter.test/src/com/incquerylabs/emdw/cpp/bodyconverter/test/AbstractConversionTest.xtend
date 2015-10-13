package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFBaseIndexWrapper
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.uml2.uml.resource.UMLResource
import org.junit.After
import org.junit.FixMethodOrder
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractConversionTest {
	
	@After
	def void cleanupTest() {
		clearTrafos()
	}

	protected UMLFactory umlFactory = UMLFactory.eINSTANCE
	protected CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE
	protected OoplFactory ooplFactory = OoplFactory.eINSTANCE
	protected CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
		
	protected Model umlModel
	protected CPPModel cppModel
	protected BasicUMLContextProvider context
	
	protected BodyConverter bodyConverter
	protected extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
	private ToolchainManager toolchainManager
	
	
	public enum ConversionType {
		Operation, StateEntry, StateExit, Transition, TransitionGuard
	}
	
	protected def initTrafos(String umlModelPath) {
		val resourceSet = new ResourceSetImpl
		
		val managerBuilder = new ToolchainManagerBuilder
		
		val engine = managerBuilder.createDefaultEngine(resourceSet)
		val rootMapping = createRootMapping(umlModelPath, resourceSet, engine)
		val xumlrtRS = rootMapping.eResource.resourceSet
		val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet, xumlrtRS)
		
		managerBuilder => [
			it.engine = engine
			it.resourceSet = xumlrtRS
			it.primitiveTypeMapping = primitiveTypeMapping
		]
		
		toolchainManager = managerBuilder.buildOrGetManager
		toolchainManager.logLevel = Level.TRACE
		
		context =  new BasicUMLContextProvider(toolchainManager.engine)
		
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
	}
	
	def void executeTrafos() {
		toolchainManager.executeXtTransformation
		toolchainManager.executeCppQrtTransformation
		toolchainManager.executeCppStructureTransformation
	}
	
	def void clearTrafos() {
		toolchainManager.dispose
		toolchainManager.disposeEngine
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet, AdvancedIncQueryEngine engine) {
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(umlModelPath, true)) => [ load(#{}) ]
        umlModel =  umlResource.allContents.filter(typeof(Model)).findFirst[true]
        
        // we need to expand the indexing to the additional resource set
		val emfBaseIndex = engine.baseIndex as EMFBaseIndexWrapper
		val additionalResourceSet = new ResourceSetImpl
		emfBaseIndex.navigationHelper.addRoot(additionalResourceSet)
		val xtumlrtResource = additionalResourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyXtumlrtUri.xtuml"))
		val traceResource = additionalResourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyTraceUri.trace"))
		val cppResource = additionalResourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyCppUri.cppmodel"))
		
		umlResource.contents += umlModel
		
		val xtumlrtModel = commonFactory.createModel => [
			it.name = umlModel.name
		]
		xtumlrtResource.contents += xtumlrtModel

		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtModel
		]
		traceResource.contents += mapping
		
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtumlrtModel ]
		cppModel = cppFactory.createCPPModel => [
			commonModel = xtumlrtModel
			it.ooplNameProvider = provider
		]
		cppResource.contents += cppModel
		val modelDir = cppFactory.createCPPDirectory
		cppResource.contents += modelDir
		cppResource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		
		mapping
	}
	
	def createPrimitiveTypeMapping(ResourceSet umlRS, ResourceSet xumlrtRS){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = xumlrtRS.getResource(URI.createPlatformPluginURI("/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common", true), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = umlRS.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		xumlrtRS.getResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel", true), true) => [ load(#{}) ]
		xumlrtRS.getResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true), true) => [ load(#{}) ]
		primitiveTypeMapping
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
	
	def getEngine() {
		toolchainManager.engine
	}
}
