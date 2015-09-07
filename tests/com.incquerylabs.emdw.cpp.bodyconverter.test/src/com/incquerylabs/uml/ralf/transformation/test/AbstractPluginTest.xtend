package com.incquerylabs.uml.ralf.transformation.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.cpp.transformation.XtumlCPPTransformationQrt
import com.incquerylabs.emdw.cpp.transformation.XtumlComponentCPPTransformation
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.incquerylabs.uml.ralf.scoping.BasicUMLContextProvider
import com.incquerylabs.uml.ralf.transformation.impl.BodyConverter
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
import org.eclipse.uml2.uml.resource.UMLResource
import org.junit.After
import org.junit.FixMethodOrder
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.MethodSorters
import org.junit.runners.Parameterized
import org.junit.runners.Parameterized.Parameter

import static org.junit.Assert.*
import com.incquerylabs.uml.ralf.transformation.impl.queries.UmlCppMappingQueries
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.uml2.uml.BodyOwner
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import org.eclipse.uml2.uml.OpaqueExpression

@RunWith(Parameterized)
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractPluginTest {
    @Parameter(0)
    public String name
    
    @Parameter(1)
    public String scopedCppObjectFQN=""
	private CPPQualifiedNamedElement scopedCppObject
    
    @Parameter(2)
    public ConversionType conversionType
    
    @Parameter(3)
    public String expectedOutput


    @Test 
    def void t01_createSnippet() {
	    initTrafos("/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PingPongSpecial/model.uml")
	    
	    // *******************************************************************************
    	// Initialize body converter
    	// *******************************************************************************
    	bodyConverter = new BodyConverter
    	bodyConverter.initialize(engine, context)
    	
    	// Start test
    	
    	executeTrafos()
	    resolveTarget()
    	
    	var String serializedSnippet
    	switch(conversionType) {
    		case Operation: {
    	// *******************************************************************************
    	// Call body converter
    	// *******************************************************************************
       			serializedSnippet = bodyConverter.convertOperation(scopedCppObject as CPPOperation)
       		}
       		case StateEntry: {
       			serializedSnippet = bodyConverter.convertStateEntry(scopedCppObject as CPPState)
       		}
       		case StateExit: {
       			serializedSnippet = bodyConverter.convertStateExit(scopedCppObject as CPPState)
       		}
       		case Transition: {
       			serializedSnippet = bodyConverter.convertTransition(scopedCppObject as CPPTransition)
       		}
       		case TransitionGuard: {
       			serializedSnippet = bodyConverter.convertTransitionGuard(scopedCppObject as CPPTransition)
       		}
       	}
       	
    	assertEquals("The created snippet does not match the expected result",expectedOutput,serializedSnippet)
	
    }

	@Test
	def void t02_PhoneX() {
		initTrafos("/com.incquerylabs.emdw.cpp.bodyconverter.test/models/PhoneX/phonex.uml")
	    
	    // *******************************************************************************
    	// Initialize body converter
    	// *******************************************************************************
    	bodyConverter = new BodyConverter
    	bodyConverter.initialize(engine, context)
    	
    	// Start test
    	
    	executeTrafos()
    	
    	val exceptions = <Exception>newArrayList
    	switch(conversionType) {
    		case Operation: {
    	// *******************************************************************************
    	// Call body converter
    	// *******************************************************************************
       			val operations = cppModel.eResource.allContents.filter(CPPOperation).toList
       			operations.forEach[ operation |
       				BodyConverterTestSuit.operationSum++
       				try {
       					val body = bodyConverter.convertOperation(operation)
       					BodyConverterTestSuit.codes += 
       					'''
       					Operation: «operation.qualifiedName»
       					rALF:
       						«operation.ralfCode»
       					C++ code:
       						«body»
       					
       					'''
       					BodyConverterTestSuit.operationOk++
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					«operation.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					BodyConverterTestSuit.codes += 
       					'''
       					Operation: «operation.qualifiedName»)
       					rALF:
       						«operation.ralfCode»
       					Exception:
       						«ex.message»
       					
       					'''
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					«operation.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		case StateEntry: {
       			val states = cppModel.eResource.allContents.filter(CPPState).filter[it.commonState.entryAction!=null].toList
       			states.forEach[ state |
       				BodyConverterTestSuit.stateEntrySum++
       				try {
       					val body = bodyConverter.convertStateEntry(state)
       					BodyConverterTestSuit.codes += 
       					'''
       					State Entry: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(true)»
       					C++ code:
       					«body»
       					
       					'''
       					BodyConverterTestSuit.stateEntryOk++
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Entry of «state.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					BodyConverterTestSuit.codes += 
       					'''
       					State Entry: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(true)»
       					Exception:
       						«ex.message»
       					
       					'''
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Entry of «state.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		case StateExit: {
       			val states = cppModel.eResource.allContents.filter(CPPState).filter[it.commonState.exitAction!=null].toList
       			states.forEach[ state |
       				BodyConverterTestSuit.stateExitSum++
       				try {
       					val body = bodyConverter.convertStateExit(state)
       					BodyConverterTestSuit.codes += 
       					'''
       					State Exit: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(false)»
       					C++ code:
       					«body»
       					
       					'''
       					BodyConverterTestSuit.stateExitOk++
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Exit of «state.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					BodyConverterTestSuit.codes += 
       					'''
       					State Exit: «state.qualifiedName»
       					rALF:
       						«state.ralfCode(false)»
       					Exception:
       						«ex.message»
       					
       					'''
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Exit of «state.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		case Transition: {
       			val transitions = cppModel.eResource.allContents.filter(CPPTransition).filter[it.commonTransition.actionChain!=null && !it.commonTransition.actionChain.actions.empty].toList
       			transitions.forEach[ transition |
       				BodyConverterTestSuit.transitionSum++
       				try {
       					val body = bodyConverter.convertTransition(transition)
       					BodyConverterTestSuit.codes += 
       					'''
       					Transition: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(false)»
       					C++ code:
       					«body»
       					
       					'''
       					BodyConverterTestSuit.transitionOk++
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Effect of «transition.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					BodyConverterTestSuit.codes += 
       					'''
       					Transition: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(false)»
       					Exception:
       						«ex.message»
       					
       					'''
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Effect of «transition.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       		case TransitionGuard: {
       			val transitions = cppModel.eResource.allContents.filter(CPPTransition).filter[it.commonTransition.guard!=null].toList
       			transitions.forEach[ transition |
       				BodyConverterTestSuit.transitionGuardSum++
       				try {
       					val body = bodyConverter.convertTransitionGuard(transition)
       					BodyConverterTestSuit.codes += 
       					'''
       					Transition Guard: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(true)»
       					C++ code:
       					«body»
       					
       					'''
       					BodyConverterTestSuit.transitionGuardOk++
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Guard of «transition.qualifiedName» | :white_check_mark: | «body.markdownBody»
       					'''
       				} catch (Exception ex) {
       					exceptions += ex
       					BodyConverterTestSuit.codes += 
       					'''
       					Transition Guard: «transition.qualifiedName»
       					rALF:
       						«transition.ralfCode(true)»
       					Exception:
       						«ex.message»
       					
       					'''
       					BodyConverterTestSuit.wikiTable = 
       					'''
       					«BodyConverterTestSuit.wikiTable»
       					Guard of «transition.qualifiedName» | :x: | «ex.reducedMessage» 
       					'''
       				}
       			]
       		}
       	}
       	
       	assertEquals("Should not be any exception", 0, exceptions.size)
	}
    
    @After
    def void cleanupTest() {
		clearTrafos()
    }
    
    public enum ConversionType {
    	Operation, StateEntry, StateExit, Transition, TransitionGuard
    }
	
	CommonFactory commonFactory = CommonFactory.eINSTANCE
	TraceFactory traceFactory = TraceFactory.eINSTANCE
	OoplFactory ooplFactory = OoplFactory.eINSTANCE
	CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
		
	private CPPModel cppModel
	private AdvancedIncQueryEngine engine
	private BasicUMLContextProvider context
	
	private TransformationQrt xtTrafo
	private XtumlCPPTransformationQrt cppTrafo
	private XtumlComponentCPPTransformation compTrafo
	private BodyConverter bodyConverter
	extension UmlCppMappingQueries mappingQueries = UmlCppMappingQueries.instance
	
    private def initTrafos(String umlModelPath) {
    	val resourceSet = new ResourceSetImpl
    	
	    engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(resourceSet))
	    context =  new BasicUMLContextProvider(engine)
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
        createRootMapping(umlModelPath, resourceSet)
    	val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet)
    	
	    xtTrafo = new TransformationQrt
		xtTrafo.externalTypeMap = primitiveTypeMapping
		xtTrafo.initialize(engine)
		cppTrafo = new XtumlCPPTransformationQrt
		cppTrafo.initialize(engine)
		compTrafo = new XtumlComponentCPPTransformation
		compTrafo.initialize(engine)
    }
    
    private def resolveTarget() {
	    if(!scopedCppObjectFQN.equals("")){
    		scopedCppObject = cppModel.eResource.allContents.filter(CPPQualifiedNamedElement).findFirst[it.cppQualifiedName == scopedCppObjectFQN]
    	}
    }
    
	def void executeTrafos() {
		xtTrafo.execute
		cppTrafo.execute
		compTrafo.transformComponents
	}
	
	def void clearTrafos() {
		if(xtTrafo != null) {
			xtTrafo.dispose
		}
		if(cppTrafo != null) {
			cppTrafo.dispose
		}
		if(compTrafo != null) {
			compTrafo.dispose
		}
    	if(engine != null) {
    		engine.dispose
    	}
	}
	
	def String getQualifiedName(CPPOperation qne) '''Operation: «(engine.umlOperation2CppOperation.getAllValuesOfumlOperation(qne).head as Operation).qualifiedName.form»'''
	def String getQualifiedName(CPPState qne) '''State: «(engine.umlState2CppState.getAllValuesOfumlState(qne).head as State).qualifiedName.form»'''
	def String getQualifiedName(CPPTransition qne) '''Transition: «(engine.umlTransition2CppTransition.getAllValuesOfumlTransition(qne).head as Transition).qualifiedName.form»'''
	
	def form(String string) '''«string.replace("PhoneX::PhoneX::Implementation::", "")»'''
	def getReducedMessage(Exception ex) '''«ex.message.replace('\n', "<br />")»'''
	def markdownBody(String body) '''«body.replace("\r\n", "<br />")»'''
	
	def String ralfCode(CPPOperation operation) {
		val op = engine.umlOperation2CppOperation.getAllValuesOfumlOperation(operation).head as Operation
		return op.methods.filter(OpaqueBehavior).head.ralfCode
	}
	
	def String ralfCode(CPPState state, boolean isEntry) {
		val st = engine.umlState2CppState.getAllValuesOfumlState(state).head as State
		if(isEntry) {
			return (st.entry as OpaqueBehavior).ralfCode
		}
		return (st.exit as OpaqueBehavior).ralfCode
	}
	
	def String ralfCode(CPPTransition transition, boolean isGuard) {
		val tr = engine.umlTransition2CppTransition.getAllValuesOfumlTransition(transition).head as Transition
		if(isGuard) {
			return (tr.guard.specification as OpaqueExpression).ralfCode
		}
		return (tr.effect as OpaqueBehavior).ralfCode
	}
	
	def String getRalfCode(BodyOwner owner) {
		if(owner==null) {
			return "null"
		}
		val index = owner.languages.indexOf("rALF")
		if(index<0) {
			return "NO rALF CODE"
		}
		return owner.bodies.get(index)
		
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet) {
		val umlResource = resourceSet.createResource(URI.createPlatformPluginURI(umlModelPath, true)) => [ load(#{}) ]
        val model =  umlResource.allContents.filter(typeof(Model)).findFirst[true]
		val xtumlrtResource = resourceSet.createResource(URI.createURI("model/"+model.name+"/dummyXtumlrtUri.xtuml"))
		val traceResource = resourceSet.createResource(URI.createURI("model/"+model.name+"/dummyTraceUri.trace"))
		val cppResource = resourceSet.createResource(URI.createURI("model/"+model.name+"/dummyCppUri.cppmodel"))
		
		umlResource.contents += model
		
		val xtumlrtModel = commonFactory.createModel => [
			it.name = model.name
		]
		xtumlrtResource.contents += xtumlrtModel

		val mapping = traceFactory.createRootMapping => [
			umlRoot = model
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
}