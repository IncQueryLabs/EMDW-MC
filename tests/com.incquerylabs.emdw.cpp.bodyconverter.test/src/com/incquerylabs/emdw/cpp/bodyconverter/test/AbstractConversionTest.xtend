package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.toolchain.ToolchainManager
import com.incquerylabs.emdw.toolchain.ToolchainManagerBuilder
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.UMLFactory
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
		toolchainManager.dispose
		toolchainManager.disposeEngine
		
		umlModel.eResource.resourceSet.cleanUpResourceSet
		cppModel.eResource.resourceSet.cleanUpResourceSet
		
		return
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
	private extension ComplexModelUtil modelUtil = new ComplexModelUtil
	
	
	public enum ConversionType {
		Operation, StateEntry, StateExit, Transition, TransitionGuard
	}
	
	protected def initTrafos(String umlModelPath) {
		val resourceSet = new ResourceSetImpl
		
		val managerBuilder = new ToolchainManagerBuilder
		
		val engine = managerBuilder.createDefaultEngine(resourceSet)
		context =  new BasicUMLContextProvider(engine)
		val rootMapping = createRootMapping(umlModelPath, resourceSet, engine)
		umlModel = rootMapping.umlRoot
		val xumlrtRS = rootMapping.eResource.resourceSet
		val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet, xumlrtRS)
		
		managerBuilder => [
			it.engine = engine
			it.xumlrtModel = rootMapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
		]
		
		toolchainManager = managerBuilder.buildOrGetManager
		toolchainManager.logLevel = Level.TRACE
		
		toolchainManager.initializeXtTransformation
		toolchainManager.initializeCppQrtTransformation
		toolchainManager.initializeCppComponentTransformation
	}
	
	def void executeTrafos() {
		toolchainManager.executeXtTransformation
		toolchainManager.executeCppQrtTransformation
		toolchainManager.executeCppStructureTransformation
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet, AdvancedIncQueryEngine engine) {
        val umlModel =  umlModelPath.loadExistingUMLResource(resourceSet)
        
        val mapping = umlModel.createRootMapping(engine)
        
		cppModel = mapping.xtumlrtRoot.prepareCPPResource
		
		mapping
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
	
	def getEngine() {
		toolchainManager.engine
	}
}
