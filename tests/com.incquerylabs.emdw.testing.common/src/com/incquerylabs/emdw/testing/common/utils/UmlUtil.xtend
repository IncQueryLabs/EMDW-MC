package com.incquerylabs.emdw.testing.common.utils

import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Connector
import org.eclipse.uml2.uml.Enumeration
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.MultiplicityElement
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind
import org.eclipse.uml2.uml.Port
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.PseudostateKind
import org.eclipse.uml2.uml.Region
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory

class UmlUtil extends ModelUtil {
	static extension val UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val TraceFactory traceFactory = TraceFactory.eINSTANCE

	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	static def createRootMapping(String umlModelName, ResourceSet rs) {
		var resourceSet = rs
		if (resourceSet == null) {
			resourceSet = new ResourceSetImpl
		}
		val umlResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_UML»'''))
		val xtumlrtResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_XTUML»'''))
		val traceResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_TRACE»'''))
		val cppResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_CPP»'''))

		val umlModel = umlFactory.createModel => [
			name = umlModelName
		]
		umlResource.contents += umlModel

		val xtumlrtModel = commonFactory.createModel
		xtumlrtResource.contents += xtumlrtModel

		val mapping = createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtModel
		]
		traceResource.contents += mapping
		CppUtil.prepareCPPModel(cppResource, xtumlrtModel)

		mapping
	}

	static def createPackage(String name) {
		umlFactory.createPackage => [
			it.name = name
		]
	}

	static def createPackage(Component comp, String name) {
		val package = createPackage(name)
		comp.packagedElements += package
		package
	}

	static def createPackageInModel(Model umlRoot) {
		val package = createPackage(NAME_DEFAULT_PACKAGE)
		umlRoot.packagedElements += package
		package
	}

	static def createComponent(String name) {
		umlFactory.createComponent => [
			it.name = name
		]
	}

	static def createComponentInModel(Model umlRoot) {
		val component = createComponent(NAME_DEFAULT_COMPONENT)
		umlRoot.packagedElements += component
		component
	}

	static def createComponent(Package root, String name) {
		val comp = createComponent(name)
		root.packagedElements += comp
		comp
	}

	static def createPort(Component component) {
		val port = umlFactory.createPort
		component.ownedAttributes += port
		port
	}

	static def createPropertyForPart(Component component) {
		val property = umlFactory.createProperty
		component.ownedAttributes += property
		property
	}

	static def createConnector(Component component) {
		val connector = umlFactory.createConnector
		component.ownedConnectors += connector
		connector
	}

	static def createConnectorEnd(Connector connector, Port role, Property partWithPort) {
		val connectorEnd = umlFactory.createConnectorEnd => [
			it.role = role
			it.partWithPort = partWithPort
		]
		connector.ends += connectorEnd
		connectorEnd
	}

	static def createClass(String name) {
		umlFactory.createClass => [
			it.name = name
		]
	}

	static def createClass(Component umlComp, String name) {
		val umlClass = createClass(name)
		umlComp.nestedClassifiers += umlClass
		return umlClass
	}

	static def createClassInModel(Model umlRoot) {
		val class = createClass(NAME_DEFAULT_CLASS)
		umlRoot.packagedElements += class
		class
	}

	static def createInterface(Package umlPackage, String name) {
		debug('''Adding interface (name: «name») to «umlPackage.name»''')
		val interface = umlFactory.createInterface => [
			it.name = name
		]
		umlPackage.packagedElements += interface
		interface
	}

	static def createAttribute(Class umlClass, Type type, String name) {
		val attribute = umlFactory.createProperty => [
			it.type = type
			it.name = name
		]
		umlClass.ownedAttributes += attribute
		return attribute
	}

	static def createOperation(Model umlRoot, String body, Type returnType) {
		val operation = umlFactory.createOperation => [
			methods += createBehavior(body)
			ownedParameters += umlFactory.createParameter => [
				direction = ParameterDirectionKind.RETURN_LITERAL
				type = returnType
			]
		]
		createClassInModel(umlRoot).ownedOperations += operation
		operation
	}

	static def createOperation(Class umlClass, String name, Parameter... parameters) {
		val operation = umlFactory.createOperation => [
			it.name = name
			it.ownedParameters += parameters
		]
		umlClass.ownedOperations += operation
		return operation
	}

	static def createParameter(Type type, String name, ParameterDirectionKind direction, int lowerBound,
		int upperBound) {
		val parameter = umlFactory.createParameter => [
			it.name = name
			it.direction = direction
			it.type = type
			it.lower = lowerBound
			it.upper = upperBound
			it.isUnique = true
		]
		return parameter
	}

	static def createDestructor(Model umlRoot, String body) {
		val destructor = umlFactory.createOperation => [
			methods += createBehavior(body)
			name = NAME_DESTRUCTOR
		]
		createClassInModel(umlRoot).ownedOperations += destructor
		destructor
	}

	static def createPropertyForAttribute(Model umlRoot, Type type) {
		val property = umlFactory.createProperty => [
			it.type = type
		]
		createClassInModel(umlRoot).ownedAttributes += property
		property
	}

	static def createAssociation(Component component, Class source, Class target) {
		val association = umlFactory.createAssociation => [
			ownedEnds.addAll(
				umlFactory.createProperty => [type = source],
				umlFactory.createProperty => [type = target]
			)
		]
		component.nestedClassifiers += association
		association
	}

	static def createAssociation(Component comp, Class source, Class target, String assocName, String sourceEndName,
		String targetEndName) {
		val endAtSource = umlFactory.createProperty => [
			it.type = target
			it.name = sourceEndName
			it.lower = 1
			it.upper = 1
		]
		val endAtTarget = umlFactory.createProperty => [
			it.type = source
			it.name = targetEndName
			it.lower = 1
			it.upper = 1
		]
		val association = umlFactory.createAssociation => [
			it.ownedEnds.addAll(
				endAtSource,
				endAtTarget
			)
			it.name = assocName
		]
		comp.nestedClassifiers += association
		endAtSource
	}

	static def createGeneralization(Class subClass, Class superClass) {
		val generalization = umlFactory.createGeneralization => [
			specific = subClass
			general = superClass
		]
		subClass.generalizations += generalization
		generalization
	}

	static def createGeneralization(Signal subSignal, Signal superSignal) {
		val generalization = umlFactory.createGeneralization => [
			specific = subSignal
			general = superSignal
		]
		subSignal.generalizations += generalization
		generalization
	}

	static def createClassAndSignal(Model umlRoot) {
		val mySignal = umlFactory.createSignal
		val class = createClass(NAME_DEFAULT_CLASS) => [
			nestedClassifiers += mySignal
		]
		umlRoot.packagedElements += class
		mySignal
	}

	static def createClassSignal(Class owner) {
		val mySignal = umlFactory.createSignal
		owner.nestedClassifiers += mySignal
		mySignal
	}

	static def createPropertyForSignal(Signal signal) {
		val property = umlFactory.createProperty
		signal.ownedAttributes += property
		property
	}

	static def createSignalAndSignalEvent(Model umlRoot, Class owner, Trigger trigger) {
		val signal = owner.createClassSignal
		trigger.event = createSignalEvent(umlRoot, signal)
		signal
	}

	static def createSignalEvent(Model umlRoot, Signal signal) {
		val signalEvent = umlFactory.createSignalEvent => [
			it.signal = signal
		]
		umlRoot.packagedElements += signalEvent
		signalEvent
	}

	static def createPrimitiveType(Package umlPackage) {
		val primitiveType = umlFactory.createPrimitiveType
		umlPackage.packagedElements += primitiveType
		primitiveType
	}

	static def PrimitiveType findPrimitiveType(Model umlModel, String name) {
		val umlPrimitiveTypesResource = umlModel.eResource.resourceSet.resources.findFirst [
			it.URI.toString.contains("UMLPrimitiveTypes")
		]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		return primitiveTypes.findFirst[it.name == name]
	}

	static def createStructType(Package umlPackage) {
		val primitiveType = createPrimitiveType(umlPackage)
		val dataType = umlFactory.createDataType => [
			ownedAttributes += createPropertyForStructType(primitiveType)
		]
		umlPackage.packagedElements += dataType
		dataType
	}

	static def createPropertyForStructType(PrimitiveType primitiveType) {
		umlFactory.createProperty => [
			type = primitiveType
		]
	}

	static def createEnumeration(Package umlPackage) {
		val enumeration = umlFactory.createEnumeration
		umlPackage.packagedElements += enumeration
		return enumeration
	}

	static def createEnumerationLiteral(Enumeration enumeration) {
		val enumerationLiteral = umlFactory.createEnumerationLiteral
		enumeration.ownedLiterals += enumerationLiteral
		return enumerationLiteral
	}

	static def createStateMachine(Model umlRoot) {
		val stateMachine = umlFactory.createStateMachine => [
			it.name = name
			regions += umlFactory.createRegion
		]
		val class = createClass("class") => [
			classifierBehavior = stateMachine
		]
		umlRoot.packagedElements += class
		stateMachine
	}

	static def createSimpleState(Region region, String name) {
		val state = umlFactory.createState => [
			it.name = name
			entry = createBehavior(TEST_SIDE_EFFECT_1)
			exit = createBehavior(TEST_SIDE_EFFECT_2)
		]
		region.subvertices += state
		state
	}

	def static createBehavior(String body) {
		umlFactory.createOpaqueBehavior => [
			bodies += body
			languages += CPP_LANGUAGE
		]
	}

	static def createCompositeState(StateMachine stateMachine, String name) {
		createSimpleState(stateMachine.regions.head, name) => [
			regions += umlFactory.createRegion
		]
	}

	static def createPseudostate(Region region, String name, PseudostateKind kind) {
		val pseudostate = umlFactory.createPseudostate => [
			it.name = name
			it.kind = kind
		]
		region.subvertices += pseudostate
		pseudostate
	}

	static def createTransition(Region region, String name, State sourceState, State targetState) {
		debug('''Adding transition (name: «name») between «sourceState.name» and «targetState.name»''')
		val transition = umlFactory.createTransition => [
			it.name = name
			source = sourceState
			target = targetState
		]
		region.transitions += transition
		transition
	}

	static def createTransition(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val region = stateMachine.regions.head
		val sourceState = createSimpleState(region, NAME_DEFAULT_SOURCE_STATE)
		val targetState = createSimpleState(region, NAME_DEFAULT_TARGET_STATE)
		createTransition(region, NAME_DEFAULT_TRANSITION, sourceState, targetState)
	}

	static def createTrigger(Model umlRoot) {
		val trigger = UMLFactory.eINSTANCE.createTrigger
		createTransition(umlRoot) => [
			triggers += trigger
		]
		trigger
	}

	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	static def setMultiplicity(MultiplicityElement multiplicityElement, int lower, int upper) {
		multiplicityElement.lower = lower
		multiplicityElement.upper = upper
	}
}