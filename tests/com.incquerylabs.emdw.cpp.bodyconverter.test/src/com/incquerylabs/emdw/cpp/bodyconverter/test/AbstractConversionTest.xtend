/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.cpp.bodyconverter.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.cpp.bodyconverter.scoping.BasicUMLContextProvider
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.BodyConverter
import com.incquerylabs.emdw.cpp.bodyconverter.transformation.impl.queries.UmlXumlrtMappingQueries
import com.incquerylabs.emdw.snippettemplate.serializer.ReducedAlfSnippetTemplateSerializer
import com.incquerylabs.emdw.testing.common.utils.ComplexModelUtil
import com.incquerylabs.emdw.toolchain.Toolchain
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.Transition
import org.eclipse.uml2.uml.UMLFactory
import org.junit.After
import org.junit.FixMethodOrder
import org.junit.runners.MethodSorters

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
abstract class AbstractConversionTest {
	
	@After
	def void cleanupTest() {
		toolchain.dispose
		toolchain.disposeEngine
		
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
	protected org.eclipse.papyrusrt.xtumlrt.common.Model xumlrtModel
	protected CPPModel cppModel
	protected BasicUMLContextProvider context
	
	protected BodyConverter bodyConverter
	protected extension UmlXumlrtMappingQueries mappingQueries = UmlXumlrtMappingQueries.instance
	private Toolchain toolchain
	private extension ComplexModelUtil modelUtil = new ComplexModelUtil
	protected extension ReducedAlfSnippetTemplateSerializer serializer = new ReducedAlfSnippetTemplateSerializer
	
	public enum ConversionType {
		Operation, StateEntry, StateExit, Transition, TransitionGuard
	}
	
	protected def initTrafos(String umlModelPath) {
		val resourceSet = new ResourceSetImpl
		
		val toolchainBuilder = Toolchain.builder
		
		val engine = toolchainBuilder.createDefaultEngine(resourceSet)
		context =  new BasicUMLContextProvider(engine)
		val rootMapping = createRootMapping(umlModelPath, resourceSet, engine)
		umlModel = rootMapping.umlRoot
		xumlrtModel = rootMapping.xtumlrtRoot
		val xumlrtRS = rootMapping.eResource.resourceSet
		val primitiveTypeMapping = createPrimitiveTypeMapping(resourceSet, xumlrtRS)
		
		toolchainBuilder => [
			it.engine = engine
			it.xumlrtModel = rootMapping.xtumlrtRoot
			it.primitiveTypeMapping = primitiveTypeMapping
		]
		
		toolchain = toolchainBuilder.build
		toolchain.logLevel = Level.TRACE
		
		toolchain.initializeXtTransformation
		toolchain.initializeCppQrtTransformation
		toolchain.initializeCppComponentTransformation
	}
	
	def void executeTrafos() {
		toolchain.executeXtTransformation
		toolchain.executeCppQrtTransformation
		toolchain.executeCppStructureTransformation
	}
	
	def createRootMapping(String umlModelPath, ResourceSet resourceSet, AdvancedIncQueryEngine engine) {
        val umlModel =  umlModelPath.loadExistingUMLResource(resourceSet)
        
        val mapping = umlModel.createRootMapping(engine)
        
		cppModel = mapping.xtumlrtRoot.prepareCPPResource
		
		mapping
	}
	
	protected def resolveUmlTarget(String umlObjectFQN, ConversionType conversionType) {
		if(umlObjectFQN.equals("")) {
			return null
		}
		switch(conversionType) {
			case Operation: {
				return umlModel.allOwnedElements.filter(Operation).findFirst[op | op.qualifiedName == umlObjectFQN]
			}
			case StateEntry,
			case StateExit: {
				return umlModel.allOwnedElements.filter(State).findFirst[state | state.qualifiedName == umlObjectFQN]
			}
			case Transition,
			case TransitionGuard: {
				return umlModel.allOwnedElements.filter(Transition).findFirst[state | state.qualifiedName == umlObjectFQN]
			}
		}
	}
	
	protected def resolveXumlrtTarget(NamedElement scopedUmlObject, ConversionType conversionType) {
		if(scopedUmlObject == null){
			return null
		}
		switch(conversionType) {
			case Operation: {
				return engine.umlOperation2CommonOperation.getAllValuesOfcommonOperation(scopedUmlObject).head
			}
			case StateEntry,
			case StateExit: {
				return engine.umlState2CommonState.getAllValuesOfcommonState(scopedUmlObject).head
			}
			case Transition,
			case TransitionGuard: {
				return engine.umlTransition2CommonTransition.getAllValuesOfcommonTransition(scopedUmlObject).head
			}
		}	
	}
	
	def purgeRalfComments(String string){
		string.replaceAll("(?s)// RALF:.+?\n", "")
	}
	
	def getEngine() {
		toolchain.engine
	}
}
