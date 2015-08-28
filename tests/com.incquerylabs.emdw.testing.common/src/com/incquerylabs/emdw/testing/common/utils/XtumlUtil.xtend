package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
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
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.Port
import org.eclipse.papyrusrt.xtumlrt.common.Protocol
import org.eclipse.papyrusrt.xtumlrt.common.ProtocolBehaviourFeatureKind
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.common.SimpleState
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
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
import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import org.eclipse.papyrusrt.xtumlrt.common.State

import static org.junit.Assert.*
import org.eclipse.papyrusrt.xtumlrt.common.NamedElement
import org.eclipse.papyrusrt.xtumlrt.common.PrimitiveType

class XtumlUtil extends ModelUtil {
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val XtumlFactory xtumlFactory = XtumlFactory.eINSTANCE

	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	static def createEmptyXtumlModel(String modelname) {
		val xtumlrtResource = createEmptyXtumlResource(modelname)
		createEmptyXtumlModel(xtumlrtResource, modelname)
	}

	static def createEmptyXtumlResource(String resourcename) {
		val resourceSet = new ResourceSetImpl
		val resource = resourceSet.createResource(URI.createURI("model/" + resourcename + "/ref/test.xtuml"))
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
		resource
	}

	static def createEmptyXtumlModel(Resource xtumlrtResource, String modelname) {
		val xtumlrtModel = commonFactory.createModel => [it.name = modelname]
		xtumlrtResource.contents += xtumlrtModel

		xtumlrtModel
	}

	static def createPackage(Model xtumlmodel, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		xtumlmodel.packages += pack
		pack
	}

	static def createPackage(Package root, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	static def createPackage(XTComponent root, String name) {
		var pack = commonFactory.createPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	static def createXtComponent(Package root, String name) {
		var comp = xtumlFactory.createXTComponent => [
			it.name = name
		]
		root.entities += comp
		comp
	}

	static def createXtComponent(Model root, String name) {
		var comp = xtumlFactory.createXTComponent => [
			it.name = name
		]
		root.entities += comp
		comp
	}

	static def createXtClass(XTComponent root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	static def createXtClass(Package root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	static def createXtClass(Model root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	static def createStateMachine(Entity root, String name) {
		var sm = commonFactory.createStateMachine => [
			it.name = name
		]
		root.behaviour = sm
		sm
	}

	static def createXtProtocol(Package root, String name) {
		var protocol = xtumlFactory.createXTProtocol => [
			it.name = name
		]
		root.protocols += protocol
		protocol
	}

	static def createXtProtocol(Model root, String name) {
		var protocol = xtumlFactory.createXTProtocol => [
			it.name = name
		]
		root.protocols += protocol
		protocol
	}

	static def createXtProtocolOperationDefinition(Protocol root, String name, VisibilityKind visibility,
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

	static def createXtProtocolOperationImplementation(XTPort root, XTProtocolOperationDefinition definition,
		String body) {
		var def = xtumlFactory.createXTProtocolOperationImplementation => [
			it.implements = definition
		]
		def.createActionCode("", body)
		root.realizedOperations += def
		def
	}

	static def createSignal(XTProtocol root, String name) {
		var signal = commonFactory.createSignal => [
			it.name = name
		]
		root.protocolBehaviourFeatures += signal
		signal
	}

	static def createXtSignalEvent(Port port, Signal signal, XTClass root, String name) {
		val signalEvent = xtumlFactory.createXTSignalEvent => [
			it.name = name
			implementedSignal = signal
			it.port = port
		]
		root.events += signalEvent
		signalEvent
	}

	static def createXtClassEvent(XTClass root, String name) {
		val classEvent = xtumlFactory.createXTClassEvent => [
			it.name = name
		]
		root.events += classEvent
		classEvent
	}
	
	static def createBidirectionalAssociation(XTClass source, XTClass target, String sourceToTargetAssociationName, String targetToSourceAssociationName) {
		val assoc1 = createXtAssociation(source, target, sourceToTargetAssociationName, false, false, 1, 1)
		val assoc2 = createXtAssociation(target, source, targetToSourceAssociationName, false, false, 1, 1)
		assoc1.opposite = assoc2
		assoc2.opposite = assoc1
		return assoc1
	}

	static def createXtAssociation(XTClass source, XTClass target, String name, boolean unique, boolean ordered,
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

	static def createXtAssociationClass(XTClass source, XTClass target, XTClass assocClass, String name, boolean unique,
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

	static def createPort(XTComponent root, Protocol type, String name, VisibilityKind visibility) {
		val port = xtumlFactory.createXTPort => [
			it.name = name
			it.visibility = visibility
			it.type = type
		]
		root.ports += port
		port
	}

	static def createCompositeState(StateMachine root, String name) {
		var compState = commonFactory.createCompositeState => [
			it.name = name
		]
		root.top = compState
		compState
	}

	static def createCompositeState(CompositeState root, String name) {
		var compState = commonFactory.createCompositeState => [
			it.name = name
		]
		root.substates += compState
		compState
	}

	static def createInitialPoint(CompositeState root, String name) {
		val init = commonFactory.createInitialPoint => [
			it.name = name
		]
		root.initial = init
		init
	}

	static def createExitPoint(CompositeState root, String name) {
		val exit = commonFactory.createExitPoint => [
			it.name = name
		]
		root.exitPoints += exit
		exit
	}

	static def createSimpleState(CompositeState root, String name) {
		val state = commonFactory.createSimpleState => [
			it.name = name
		]
		root.substates += state
		state
	}

	static def createDeepHistory(CompositeState root, String name) {
		val dh = commonFactory.createDeepHistory => [
			it.name = name
		]
		root.deepHistory = dh
		dh
	}

	static def createTransition(CompositeState root, Vertex source, Vertex target, String name) {
		var transition = commonFactory.createTransition => [
			it.name = name
			sourceVertex = source
			targetVertex = target
		]
		root.transitions += transition
		transition
	}

	static def createTransition(CompositeState root, Vertex source, Vertex target, String name, String ... code) {
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

	static def createActionCode(ActionChain root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.actions += action
		action
	}

	static def createEntryActionCode(SimpleState root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.entryAction = action
		action
	}

	static def createEntryActionCode(CompositeState root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.entryAction = action
		action
	}

	static def createExitActionCode(SimpleState root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.exitAction = action
		action
	}

	static def createExitActionCode(CompositeState root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.exitAction = action
		action
	}

	static def createActionCode(Operation root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.body = action
		action
	}

	static def createActionCode(XTProtocolOperationImplementation root, String name, String code) {
		val action = commonFactory.createActionCode => [
			it.name = name
			it.source = code
		]
		root.protocolOperationImplementationAction += action
		action
	}

	static def createActionChain(Transition root, String name, String ... code) {
		val aChain = commonFactory.createActionChain => [
			it.name = name
		]
		root.actionChain = aChain
		code.forEach[createActionCode(aChain, name, it)]
		aChain
	}

	static def createActionChain(Transition root, String name) {
		val aChain = commonFactory.createActionChain => [
			it.name = name
		]
		root.actionChain = aChain
		aChain
	}

	static def createXTEventTrigger(Transition root, XTEvent signal, String name) {
		val xtevent = xtumlFactory.createXTEventTrigger => [
			it.name = name
			it.signal = signal
		]
		root.triggers += xtevent
		xtevent
	}

	static def createParameter(Signal root, Type type, String name, DirectionKind dir) {
		val parameter = commonFactory.createParameter => [
			it.name = name
			it.type = type
			it.direction = dir
		]
		root.parameters += parameter
		parameter
	}

	static def createParameter(Type type, String name, DirectionKind dir) {
		val parameter = commonFactory.createParameter => [
			it.name = name
			it.type = type
			it.direction = dir
		]
		parameter
	}

	static def createTypeDefinition(BaseContainer root, Type type, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typeDefinitions += typeDef
		typeDef
	}

	static def createTypeDefinition(BaseContainer root, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typeDefinitions += typeDef
		typeDef
	}

	static def createPrimitiveType(TypeDefinition typedef, String name) {
		val type = commonFactory.createPrimitiveType => [
			it.name = name
		]
		typedef.type = type
		type
	}

	static def createPrimitiveType(BaseContainer root, String name) {
		val type = commonFactory.createPrimitiveType => [
			it.name = name
		]
		root.createTypeDefinition(type, '''«name»Definition''')
		type
	}

	static def createUserDefinedType(TypeDefinition typedef, String name, TypeConstraint ... const) {
		val type = commonFactory.createUserDefinedType => [
			it.name = name
			it.constraints += const
		]
		typedef.type = type
		type

	}

	static def createOperation(Entity root, VisibilityKind visibility, boolean isStatic, Type returnType, String name,
		String body, Parameter ... parameter) {
		val op = commonFactory.createOperation => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.returnType = commonFactory.createTypedMultiplicityElement => [
				type = returnType
			]
			it.body = createActionCode(name, body)
			it.parameters += parameter
		]
		root.operations += op
		op
	}

	static def createSingleAttribute(Entity root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = createSingleAttribute(type, visibility, isStatic, name)
		root.attributes += attr
		attr
	}

	static def createSingleAttribute(XTClassEvent root, Type type, VisibilityKind visibility, boolean isStatic,
		String name) {
		val attr = createSingleAttribute(type, visibility, isStatic, name)
		root.attributes += attr
		attr
	}

	static def createSingleAttribute(Type type, VisibilityKind visibility, boolean isStatic, String name) {
		commonFactory.createAttribute => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.type = type
			it.lowerBound = 1
			it.upperBound = 1
		]
	}

	static def createListAttribute(Entity root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
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

	static def createConnector(String name, Port ... ends) {
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

	static def createGuard(Transition root, String name, String code) {
		val action = commonFactory.createGuard => [
			it.name = name
			it.body = commonFactory.createActionCode => [it.source = code]
		]
		root.guard = action
		action
	}
	
	static def createTypedMultiplicityElement(Type type, int lower, int upper, boolean isOrdered, boolean isUnique){
		val typedMultiplicityElement = commonFactory.createTypedMultiplicityElement => [ element |
			element.type = type
			element.lowerBound = lower
			element.upperBound = upper
			element.ordered = isOrdered
			element.unique = isUnique
		]
		
		return typedMultiplicityElement
	}
	
	static def createGeneralization(XTClass derivedClass, XTClass superClass) {
		var generalization = commonFactory.createGeneralization => [
			it.sub = derivedClass
			it.^super = superClass
		]
		derivedClass.generalizations += generalization
		return generalization
	}

	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	static def CompositeState getXtumlrtTopState(Model xtumlrtRoot) {
		xtumlrtRoot.entities.head.behaviour.top
	}

	static def findClass(RootMapping mapping, String className) {
		mapping.xtumlrtRoot.entities.filter(XTClass).findFirst[name == className]
	}

	static def findPrimitiveType(NamedElement ne, String name) {
		val umlPrimitiveTypesResource = ne.eResource.resourceSet.resources.findFirst[it.URI.toString.contains("umlPrimitiveTypes")]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		return primitiveTypes.findFirst[it.name == name]
	}

	static def checkState(State xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.entryAction.source)
		assertEquals(TEST_SIDE_EFFECT_2, xtumlrtObject.exitAction.source)
	}

	static def checkTransition(RootMapping mapping, org.eclipse.uml2.uml.Transition umlObject,
		Transition xtumlrtObject) {
		val sourceVertex = mapping.traces.findFirst[umlElements.contains(umlObject.source)].xtumlrtElements.head
		val targetVertex = mapping.traces.findFirst[umlElements.contains(umlObject.target)].xtumlrtElements.head
		assertEquals("Transition source vertex", sourceVertex, xtumlrtObject.sourceVertex)
		assertEquals("Transition target vertex", targetVertex, xtumlrtObject.targetVertex)
	}
}