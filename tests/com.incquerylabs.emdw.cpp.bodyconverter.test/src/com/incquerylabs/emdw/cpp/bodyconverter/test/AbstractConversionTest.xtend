package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.testing.common.utils.TransformationUtil
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
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
import org.eclipse.incquery.runtime.emf.EMFBaseIndexWrapper
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import org.apache.log4j.Level

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractConversionTest {
	
    @After
    def void cleanupTest() {
		clearTrafos()
		
		val umlRSresources = umlModel.eResource.resourceSet.resources
		umlRSresources.forEach[it.unload]
		umlRSresources.clear
		val xumlrtRSresources = cppModel.eResource.resourceSet.resources
		xumlrtRSresources.forEach[it.unload]
		xumlrtRSresources.clear;
		
		(0..4).forEach[System.gc]
    }
    
	protected UMLFactory umlFactory = UMLFactory.eINSTANCE
	protected CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected TraceFactory traceFactory = TraceFactory.eINSTANCE
	protected OoplFactory ooplFactory = OoplFactory.eINSTANCE
	protected CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
		
	protected Model umlModel
	protected CPPModel cppModel
	protected AdvancedIncQueryEngine engine
	protected BasicUMLContextProvider context
	
	protected BodyConverter bodyConverter
	protected extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
    private extension TransformationUtil trafoUtil = new TransformationUtil
    
    
    public enum ConversionType {
    	Operation, StateEntry, StateExit, Transition, TransitionGuard
    }
	
    protected def initTrafos(String umlModelPath) {
    	val resourceSet = new ResourceSetImpl
    	
    	logLevel = Level.DEBUG
    	
	    engine = initializeEngine(resourceSet)
	    context =  new BasicUMLContextProvider(engine)
        val rootMapping = createRootMapping(umlModelPath, resourceSet, engine)
        val xumlrtRS = rootMapping.eResource.resourceSet
		val managedEngine = IncQueryEngine.on(new EMFScope(xumlrtRS))
		GenericPatternGroup.of(OoplQueryBasedFeatures.instance, QueryBasedFeatures.instance).prepare(managedEngine)
    	val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet, xumlrtRS)
    	initializeAllTransformation(xumlrtRS, primitiveTypeMapping)
    }
    
	def void executeTrafos() {
		executeAllTransformationWithoutCodeCompile
	}
	
	def void clearTrafos() {
		cleanupTransformation
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
}