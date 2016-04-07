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
package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.BaseContainer
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Entity
import org.eclipse.papyrusrt.xtumlrt.common.Enumeration
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.Port
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType
import org.eclipse.papyrusrt.xtumlrt.common.Protocol
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.common.SimpleState
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.common.StructuredType
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.common.TypeConstraint
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.papyrusrt.xtumlrt.common.Vertex
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClassEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationImplementation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlFactory

import static org.junit.Assert.*
import org.eclipse.papyrusrt.xtumlrt.common.ActionCode
import com.incquerylabs.emdw.cpp.common.EMDWConstants

class XtumlUtil extends ModelUtil {
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val XtumlFactory xtumlFactory = XtumlFactory.eINSTANCE

	def <T> asSet(T object) {
		#{object}.filterNull
	}

	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def createEmptyXtumlModel(String modelname) {
		val xtumlrtResource = createEmptyXtumlResource(modelname)
		createEmptyXtumlModel(xtumlrtResource, modelname)
	}

	def createEmptyXtumlResource(String resourcename) {
		val resourceSet = new ResourceSetImpl
		val resource = resourceSet.createResource(URI.createURI("model/" + resourcename + "/ref/test.xtuml"))
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
		resource
	}

	def createEmptyXtumlModel(Resource xtumlrtResource, String modelname) {
		val xtumlrtModel = commonFactory.createModel => [it.name = modelname]
		xtumlrtResource.contents += xtumlrtModel

		xtumlrtModel
	}

	def createPackage(Model xtumlmodel, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		xtumlmodel.packages += pack
		pack
	}

	def createPackage(Package root, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	def createPackage(XTComponent root, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	def createXtComponent(Package root, String name) {
		var comp = xtumlFactory.createXTComponent => [
			it.name = name
		]
		root.entities += comp
		comp
	}

	def createXtComponent(Model root, String name) {
		var comp = xtumlFactory.createXTComponent => [
			it.name = name
		]
		root.entities += comp
		comp
	}

	def createXtClass(XTComponent root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	def createXtClass(Package root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	def createXtClass(Model root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	def createStateMachine(Entity root, String name) {
		var sm = commonFactory.createStateMachine => [
			it.name = name
		]
		root.behaviour = sm
		sm
	}

	def createXtProtocol(Package root, String name) {
		var protocol = xtumlFactory.createXTProtocol => [
			it.name = name
		]
		root.protocols += protocol
		protocol
	}

	def createXtProtocol(Model root, String name) {
		var protocol = xtumlFactory.createXTProtocol => [
			it.name = name
		]
		root.protocols += protocol
		protocol
	}

	def createXtProtocolOperationDefinition(Protocol root, String name, VisibilityKind visibility,
		boolean isStatic, Type returnType, ProtocolBehaviourFeatureKind kind, Parameter ... parameter) {
		var def = xtumlFactory.createXTProtocolOperationDefinition => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.returnType = commonFactory.createTypedMultiplicityElement => [
				type = returnType
			]
			it.kind = kind
			it.parameters += parameter
		]
		root.protocolBehaviourFeatures += def
		def
	}

	def createXtProtocolOperationImplementation(XTPort root, XTProtocolOperationDefinition definition,
		String language, String body) {
		var def = xtumlFactory.createXTProtocolOperationImplementation => [
			it.implements = definition
		]
		def.createActionCode("", language, body)
		root.realizedOperations += def
		def
	}

	def createSignal(XTProtocol root, String name) {
		var signal = commonFactory.createSignal => [
			it.name = name
		]
		root.protocolBehaviourFeatures += signal
		signal
	}

	def createXtSignalEvent(Port port, Signal signal, XTClass root, String name) {
		val signalEvent = xtumlFactory.createXTSignalEvent => [
			it.name = name
			implementedSignal = signal
			it.port = port
		]
		root.events += signalEvent
		signalEvent
	}

	def createXtClassEvent(XTClass root, String name) {
		val classEvent = xtumlFactory.createXTClassEvent => [
			it.name = name
		]
		root.events += classEvent
		classEvent
	}
	
	def createBidirectionalAssociation(XTClass source, XTClass target, String sourceToTargetAssociationName, String targetToSourceAssociationName) {
		val assoc1 = createXtAssociation(source, target, sourceToTargetAssociationName, false, false, 1, 1)
		val assoc2 = createXtAssociation(target, source, targetToSourceAssociationName, false, false, 1, 1)
		assoc1.opposite = assoc2
		assoc2.opposite = assoc1
		return assoc1
	}

	def createXtAssociation(XTClass source, XTClass target, String name, boolean unique, boolean ordered,
		int lowerBound, int upperBound) {
		val assoc = xtumlFactory.createXTAssociation => [
			it.source = source
			it.target = target
			it.name = name
			it.unique = unique
			it.ordered = ordered
			it.lowerBound = lowerBound
			it.upperBound = upperBound
		]
		source.relations += assoc
		assoc
	}

	def createXtAssociationClass(XTClass source, XTClass target, XTClass assocClass, String name, boolean unique,
		boolean ordered, int lowerBound, int upperBound) {
		val assoc = xtumlFactory.createXTAssociationClass => [
			it.source = source
			it.target = target
			it.associationClass = assocClass
			it.name = name
			it.unique = unique
			it.ordered = ordered
			it.lowerBound = lowerBound
			it.upperBound = upperBound
		]
		source.relations += assoc
		assoc
	}

	def createPort(XTComponent root, Protocol type, String name, VisibilityKind visibility) {
		val port = xtumlFactory.createXTPort => [
			it.name = name
			it.visibility = visibility
			it.type = type
		]
		root.ports += port
		port
	}

	def createCompositeState(StateMachine root, String name) {
		var compState = commonFactory.createCompositeState => [
			it.name = name
		]
		root.top = compState
		compState
	}

	def createCompositeState(CompositeState root, String name) {
		var compState = commonFactory.createCompositeState => [
			it.name = name
		]
		root.substates += compState
		compState
	}

	def createInitialPoint(CompositeState root, String name) {
		val init = commonFactory.createInitialPoint => [
			it.name = name
		]
		root.initial = init
		init
	}

	def createExitPoint(CompositeState root, String name) {
		val exit = commonFactory.createExitPoint => [
			it.name = name
		]
		root.exitPoints += exit
		exit
	}

	def createSimpleState(CompositeState root, String name) {
		val state = commonFactory.createSimpleState => [
			it.name = name
		]
		root.substates += state
		state
	}

	def createDeepHistory(CompositeState root, String name) {
		val dh = commonFactory.createDeepHistory => [
			it.name = name
		]
		root.deepHistory = dh
		dh
	}

	def createTransition(CompositeState root, Vertex source, Vertex target, String name) {
		var transition = commonFactory.createTransition => [
			it.name = name
			sourceVertex = source
			targetVertex = target
		]
		root.transitions += transition
		transition
	}

	def createTransition(CompositeState root, Vertex source, Vertex target, String name, String language,String code) {
		root.createTransition(source, target, name, new Pair(language, code))
	}
	
	def createTransition(CompositeState root, Vertex source, Vertex target, String name, Pair<String,String>... code) {
		var transition = commonFactory.createTransition => [
			it.name = name
			sourceVertex = source
			targetVertex = target
		]
		root.transitions += transition
		if (code.size > 0)
			createActionChain(transition, name, code)
		transition
	}
	
	private def createXTAction(String name, String language, String code) {
		xtumlFactory.createXTAction => [
			it.name = name
			it.body += xtumlFactory.createXTActionBody => [
				it.language = language
				it.source = code
			]
		]
	}

	def createActionCode(ActionChain root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.actions += action
		action
	}

	def createActionCode(ActionChain root, String name, Pair<String,String>... codes) {
		val action = xtumlFactory.createXTAction => [action |
			action.name = name
			codes.forEach[code |
				action.body += xtumlFactory.createXTActionBody => [
					it.language = code.key
					it.source = code.value
				]
			]
		]
		root.actions += action
		action
	}

	def createEntryActionCode(SimpleState root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.entryAction = action
		action
	}

	def createEntryActionCode(CompositeState root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.entryAction = action
		action
	}

	def createExitActionCode(SimpleState root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.exitAction = action
		action
	}

	def createExitActionCode(CompositeState root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.exitAction = action
		action
	}

	def createActionCode(Operation root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.body = action
		action
	}

	def createActionCode(XTProtocolOperationImplementation root, String name, String language, String code) {
		val action = createXTAction(name, language, code)
		root.protocolOperationImplementationAction += action
		action
	}

	def createActionChain(Transition root, String name, Pair<String, String>... code) {
		val aChain = commonFactory.createActionChain => [
			it.name = name
		]
		root.actionChain = aChain
		createActionCode(aChain, name, code)
		aChain
	}

	def createActionChain(Transition root, String name) {
		val aChain = commonFactory.createActionChain => [
			it.name = name
		]
		root.actionChain = aChain
		aChain
	}

	def createXTEventTrigger(Transition root, XTEvent signal, String name) {
		val xtevent = xtumlFactory.createXTEventTrigger => [
			it.name = name
			it.signal = signal
		]
		root.triggers += xtevent
		xtevent
	}

	def createParameter(Signal root, Type type, String name, DirectionKind dir) {
		val parameter = commonFactory.createParameter => [
			it.name = name
			it.type = type
			it.direction = dir
		]
		root.parameters += parameter
		parameter
	}

	def createParameter(Type type, String name, DirectionKind dir) {
		val parameter = commonFactory.createParameter => [
			it.name = name
			it.type = type
			it.direction = dir
		]
		parameter
	}

	def createTypeDefinition(BaseContainer root, Type type, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typeDefinitions += typeDef
		typeDef
	}
	
	def createPrimitiveTypeWithTypeDefinition(BaseContainer root, String name) {
		val typeDefinition = createTypeDefinition(root, name)
		val primitiveType = createPrimitiveType(typeDefinition, name)
		return primitiveType
	}

	def createTypeDefinition(BaseContainer root, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typeDefinitions += typeDef
		typeDef
	}

	def createPrimitiveType(TypeDefinition typedef, String name) {
		val type = commonFactory.createPrimitiveType => [
			it.name = name
		]
		typedef.type = type
		type
	}

	def createPrimitiveType(BaseContainer root, String name) {
		val type = commonFactory.createPrimitiveType => [
			it.name = name
		]
		root.createTypeDefinition(type, '''«name»Definition''')
		type
	}

	def createUserDefinedType(TypeDefinition typedef, String name, TypeConstraint ... const) {
		val type = commonFactory.createUserDefinedType => [
			it.name = name
			it.constraints += const
		]
		typedef.type = type
		type

	}

	def createAbstractOperation(Entity root, VisibilityKind visibility, Type returnType, String name, Parameter ... parameter) {
		val op = commonFactory.createOperation => [
			it.name = name
			it.abstract = true
			it.visibility = visibility
			it.returnType = commonFactory.createTypedMultiplicityElement => [
				type = returnType
			]
			it.parameters += parameter
		]
		root.operations += op
		op
	}
	
	def createOperation(Entity root, VisibilityKind visibility, boolean isStatic, Type returnType, String name,
		String language, String body, Parameter ... parameter) {
		val op = commonFactory.createOperation => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.returnType = commonFactory.createTypedMultiplicityElement => [
				type = returnType
			]
			it.body = createActionCode(name, language, body)
			it.parameters += parameter
		]
		root.operations += op
		op
	}

	def createSingleAttribute(Entity root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = createSingleAttribute(type, visibility, isStatic, name)
		root.attributes += attr
		attr
	}

	def createSingleAttribute(XTClassEvent root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = createSingleAttribute(type, visibility, isStatic, name)
		root.attributes += attr
		attr
	}

	def createSingleAttribute(StructuredType root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = createSingleAttribute(type, visibility, isStatic, name)
		root.attributes += attr
		attr
	}

	def createSingleAttribute(Type type, VisibilityKind visibility, boolean isStatic, String name) {
		commonFactory.createAttribute => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.type = type
			it.lowerBound = 1
			it.upperBound = 1
		]
	}

	def createListAttribute(Entity root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = commonFactory.createAttribute => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.type = type
			it.ordered = true
			it.lowerBound = 0
			it.upperBound = Integer.MAX_VALUE
		]
		root.attributes += attr
		attr
	}

	def createConnector(String name, Port ... ends) {
		val connector = commonFactory.createConnector => [
			it.name = name
		]
		ends.forEach [ port |
			val end = commonFactory.createConnectorEnd => [
				it.role = port
			]
			connector.ends += end
		]
	}

	def createGuard(Transition root, String name, String language, String code) {
		val action = commonFactory.createGuard => [
			it.name = name
			it.body = createXTAction(name, language, code)
		]
		root.guard = action
		action
	}
	
	def createTypedMultiplicityElement(Type type, int lower, int upper, boolean isOrdered, boolean isUnique){
		val typedMultiplicityElement = commonFactory.createTypedMultiplicityElement => [ element |
			element.type = type
			element.lowerBound = lower
			element.upperBound = upper
			element.ordered = isOrdered
			element.unique = isUnique
		]
		
		return typedMultiplicityElement
	}
	
	def createGeneralization(XTClass derivedClass, XTClass superClass) {
		var generalization = commonFactory.createGeneralization => [
			it.sub = derivedClass
			it.^super = superClass
		]
		derivedClass.generalizations += generalization
		return generalization
	}
	
	def createEnumerationWithTypeDefinition(BaseContainer root, String name) {
		val typeDefinition = createTypeDefinition(root, name)
		val enumeration = createEnumeration(typeDefinition, name)
		return enumeration
	}
	
	def createEnumeration(TypeDefinition typeDefinition, String name) {
		val enumeration = commonFactory.createEnumeration => [
			it.name = name
		]
		typeDefinition.type = enumeration
		return enumeration
	}
	
	def createEnumerationLiteral(Enumeration enumeration, String name) {
		val enumerationLiteral = commonFactory.createEnumerationLiteral => [
			it.name = name
		]
		enumeration.literals += enumerationLiteral
		return enumerationLiteral
	}
	
	def createStructuredTypeWithTypeDefinition(BaseContainer root, String name) {
		val typeDefinition = createTypeDefinition(root, name)
		val structuredType = createStructuredType(typeDefinition, name)
		return structuredType
	}
	
	def createStructuredType(TypeDefinition typeDefinition, String name) {
		val structuredType = commonFactory.createStructuredType => [
			it.name = name
		]
		typeDefinition.type = structuredType
		return structuredType
	}

	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def CompositeState getXtumlrtTopState(Model xtumlrtRoot) {
		xtumlrtRoot.entities.head.behaviour.top
	}

	def findClass(RootMapping mapping, String className) {
		mapping.xtumlrtRoot.entities.filter(XTClass).findFirst[name == className]
	}

	def findPrimitiveType(NamedElement ne, String name) {
		val umlPrimitiveTypesResource = ne.eResource.resourceSet.resources.findFirst[it.URI.toString.equals(EMDWConstants.XUMLRT_PRIMITIVE_TYPES_LIBRARY_PATH)]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		return primitiveTypes.findFirst[it.name == name]
	}

	def checkState(State xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, (xtumlrtObject.entryAction as ActionCode).source)
		assertEquals(TEST_SIDE_EFFECT_2, (xtumlrtObject.exitAction as ActionCode).source)
	}

	def checkTransition(RootMapping mapping, org.eclipse.uml2.uml.Transition umlObject,
		Transition xtumlrtObject) {
		val sourceVertex = mapping.traces.findFirst[umlElements.contains(umlObject.source)].xtumlrtElements.head
		val targetVertex = mapping.traces.findFirst[umlElements.contains(umlObject.target)].xtumlrtElements.head
		assertEquals("Transition source vertex", sourceVertex, xtumlrtObject.sourceVertex)
		assertEquals("Transition target vertex", targetVertex, xtumlrtObject.targetVertex)
	}
}