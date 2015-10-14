package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlCppMappingQueries
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.testing.common.utils.TransformationUtil
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
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
		cleanupTransformation
		
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
	protected AdvancedIncQueryEngine engine
	protected BasicUMLContextProvider context
	
	protected BodyConverter bodyConverter
	protected extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
    private extension TransformationUtil trafoUtil = new TransformationUtil
    private extension ComplexModelUtil modelUtil = new ComplexModelUtil
    
    public enum ConversionType {
    	Operation, StateEntry, StateExit, Transition, TransitionGuard
    }
	
    protected def initTrafos(String umlModelPath) {
    	val resourceSet = new ResourceSetImpl
    	
    	logLevel = Level.DEBUG
    	
	    engine = initializeEngine(resourceSet)
	    context =  new BasicUMLContextProvider(engine)
        val rootMapping = createRootMapping(umlModelPath, resourceSet, engine)
        umlModel = rootMapping.umlRoot
        val xumlrtRS = rootMapping.eResource.resourceSet
    	val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet, xumlrtRS)
    	initializeAllTransformation(xumlrtRS, primitiveTypeMapping)
    }
    
	def void executeTrafos() {
		executeAllTransformationWithoutCodeCompile
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet, AdvancedIncQueryEngine engine) {
        val umlModel =  umlModelPath.loadExistingUMLResource(resourceSet)
        
        val mapping = umlModel.createRootMapping(resourceSet, engine)
        
		cppModel = mapping.xtumlrtRoot.prepareCPPResource
		
		mapping
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
}