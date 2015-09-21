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
    	
	    engine = initializeEngine(resourceSet)
	    context =  new BasicUMLContextProvider(engine)
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
        createRootMapping(umlModelPath, resourceSet)
    	val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet)
    	initializeAllTransformation(resourceSet, primitiveTypeMapping)
    }
    
	def void executeTrafos() {
		executeAllTransformationWithoutCodeCompile
	}
	
	def void clearTrafos() {
		cleanupTransformation
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet) {
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(umlModelPath, true)) => [ load(#{}) ]
        umlModel =  umlResource.allContents.filter(typeof(Model)).findFirst[true]
		val xtumlrtResource = resourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyXtumlrtUri.xtuml"))
		val traceResource = resourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyTraceUri.trace"))
		val cppResource = resourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyCppUri.cppmodel"))
		
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
    
    def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = rs.getResource(URI.createPlatformPluginURI("/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common", true), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		rs.getResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel", true), true) => [ load(#{}) ]
		rs.getResource(URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel", true), true) => [ load(#{}) ]
		primitiveTypeMapping
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
}