package com.incquerylabs.emdw.testing.common.utils

import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Connector
import org.eclipse.uml2.uml.Enumeration
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.MultiplicityElement
import org.eclipse.uml2.uml.Operation
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
import org.eclipse.uml2.uml.Transition
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.UMLFactory

class UmlUtil extends ModelUtil {
	static extension val UMLFactory umlFactory = UMLFactory.eINSTANCE

	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def createPackage(String name) {
		umlFactory.createPackage => [
			it.name = name
		]
	}

	def createPackage(Component comp, String name) {
		val package = createPackage(name)
		comp.packagedElements += package
		package
	}

	def createPackageInModel(Model umlRoot) {
		val package = createPackage(NAME_DEFAULT_PACKAGE)
		umlRoot.packagedElements += package
		package
	}

	def createComponent(String name) {
		umlFactory.createComponent => [
			it.name = name
		]
	}

	def createComponentInModel(Model umlRoot) {
		val component = createComponent(NAME_DEFAULT_COMPONENT)
		umlRoot.packagedElements += component
		component
	}

	def createComponent(Package root, String name) {
		val comp = createComponent(name)
		root.packagedElements += comp
		comp
	}

	def createPort(Component component) {
		val port = umlFactory.createPort
		component.ownedAttributes += port
		port
	}

	def createPropertyForPart(Component component) {
		val property = umlFactory.createProperty
		component.ownedAttributes += property
		property
	}

	def createConnector(Component component) {
		val connector = umlFactory.createConnector
		component.ownedConnectors += connector
		connector
	}

	def createConnectorEnd(Connector connector, Port role, Property partWithPort) {
		val connectorEnd = umlFactory.createConnectorEnd => [
			it.role = role
			it.partWithPort = partWithPort
		]
		connector.ends += connectorEnd
		connectorEnd
	}

	def createClass(String name) {
		umlFactory.createClass => [
			it.name = name
		]
	}

	def createClass(Component umlComp, String name) {
		val umlClass = createClass(name)
		umlComp.nestedClassifiers += umlClass
		return umlClass
	}

	def createClassInModel(Model umlRoot) {
		val class = createClass(NAME_DEFAULT_CLASS)
		umlRoot.packagedElements += class
		class
	}

	def createInterface(Package umlPackage, String name) {
		debug('''Adding interface (name: «name») to «umlPackage.name»''')
		val interface = umlFactory.createInterface => [
			it.name = name
		]
		umlPackage.packagedElements += interface
		interface
	}

	def createAttribute(Class umlClass, Type type, String name) {
		val attribute = umlFactory.createProperty => [
			it.type = type
			it.name = name
		]
		umlClass.ownedAttributes += attribute
		return attribute
	}

	def createOperation(Model umlRoot, String body, Type returnType) {
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
	
	def createOperation(Model umlRoot, String body, Type returnType, Parameter... parameters) {
		val operation = umlFactory.createOperation => [
			methods += createBehavior(body)
			ownedParameters += umlFactory.createParameter => [
				direction = ParameterDirectionKind.RETURN_LITERAL
				type = returnType
			]
			ownedParameters += parameters
		]
		createClassInModel(umlRoot).ownedOperations += operation
		operation
	}

	def createOperation(Class umlClass, String name, Parameter... parameters) {
		val operation = umlFactory.createOperation => [
			it.name = name
			it.ownedParameters += parameters
		]
		umlClass.ownedOperations += operation
		return operation
	}
	
	def addInParameter(Operation operation, Type type, String name) {
		val param = createParameter(type, name, ParameterDirectionKind.IN_LITERAL, 1, 1)
		operation.ownedParameters += param
		return param
	}

	def createParameter(Type type, String name, ParameterDirectionKind direction, int lowerBound,
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

	def createDestructor(Model umlRoot, String body) {
		val destructor = umlFactory.createOperation => [
			methods += createBehavior(body)
			name = NAME_DESTRUCTOR
		]
		createClassInModel(umlRoot).ownedOperations += destructor
		destructor
	}

	def createPropertyForAttribute(Model umlRoot, Type type) {
		val property = umlFactory.createProperty => [
			it.type = type
		]
		createClassInModel(umlRoot).ownedAttributes += property
		property
	}

	def createAssociation(Component component, Class source, Class target) {
		val association = umlFactory.createAssociation => [
			ownedEnds.addAll(
				umlFactory.createProperty => [type = source],
				umlFactory.createProperty => [type = target]
			)
		]
		component.nestedClassifiers += association
		association
	}

	def createAssociation(Component comp, Class source, Class target, String assocName, String sourceEndName,
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

	def createGeneralization(Class subClass, Class superClass) {
		val generalization = umlFactory.createGeneralization => [
			specific = subClass
			general = superClass
		]
		subClass.generalizations += generalization
		generalization
	}

	def createGeneralization(Signal subSignal, Signal superSignal) {
		val generalization = umlFactory.createGeneralization => [
			specific = subSignal
			general = superSignal
		]
		subSignal.generalizations += generalization
		generalization
	}

	def createClassAndSignal(Model umlRoot) {
		val mySignal = umlFactory.createSignal
		val class = createClass(NAME_DEFAULT_CLASS) => [
			nestedClassifiers += mySignal
		]
		umlRoot.packagedElements += class
		mySignal
	}

	def createClassSignal(Class owner) {
		val mySignal = umlFactory.createSignal
		owner.nestedClassifiers += mySignal
		mySignal
	}

	def createPropertyForSignal(Signal signal) {
		val property = umlFactory.createProperty
		signal.ownedAttributes += property
		property
	}

	def createSignalAndSignalEvent(Model umlRoot, Class owner, Trigger trigger) {
		val signal = owner.createClassSignal
		trigger.event = createSignalEvent(umlRoot, signal)
		signal
	}

	def createSignalEvent(Model umlRoot, Signal signal) {
		val signalEvent = umlFactory.createSignalEvent => [
			it.signal = signal
		]
		umlRoot.packagedElements += signalEvent
		signalEvent
	}

	def createPrimitiveType(Package umlPackage) {
		val primitiveType = umlFactory.createPrimitiveType
		umlPackage.packagedElements += primitiveType
		primitiveType
	}

	def PrimitiveType findPrimitiveType(Model umlModel, String name) {
		val umlPrimitiveTypesResource = umlModel.eResource.resourceSet.resources.findFirst [
			it.URI.toString.contains("UMLPrimitiveTypes")
		]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		return primitiveTypes.findFirst[it.name == name]
	}

	def createStructType(Package umlPackage) {
		val primitiveType = createPrimitiveType(umlPackage)
		val dataType = umlFactory.createDataType => [
			ownedAttributes += createPropertyForStructType(primitiveType)
		]
		umlPackage.packagedElements += dataType
		dataType
	}

	def createPropertyForStructType(PrimitiveType primitiveType) {
		umlFactory.createProperty => [
			type = primitiveType
		]
	}

	def createEnumeration(Package umlPackage) {
		val enumeration = umlFactory.createEnumeration
		umlPackage.packagedElements += enumeration
		return enumeration
	}

	def createEnumerationLiteral(Enumeration enumeration) {
		val enumerationLiteral = umlFactory.createEnumerationLiteral
		enumeration.ownedLiterals += enumerationLiteral
		return enumerationLiteral
	}

	def createStateMachine(Model umlRoot) {
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

	def createStateMachine(Class cl, String name) {
		val stateMachine = umlFactory.createStateMachine => [
			it.name = name
			regions += umlFactory.createRegion
		]
		cl.classifierBehavior = stateMachine
		
		stateMachine
	}
	
	def createEffectWithDefaultCppEffect(String name) {
		val effect = UMLFactory.eINSTANCE.createOpaqueBehavior => [
			it.bodies += TEST_SIDE_EFFECT_1
			it.languages += CPP_LANGUAGE
			it.name = name
		]
		return effect
	}
	
	def createEntryEffectWithDefaultCppEffect(State state, String name) {
		val effect = createEffectWithDefaultCppEffect(name)
		state.entry = effect
		return effect
	}
	
	def createExitEffectWithDefaultCppEffect(State state, String name) {
		val effect = createEffectWithDefaultCppEffect(name)
		state.exit = effect
		return effect
	}

	def createSimpleState(Region region, String name) {
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

	def createCompositeState(StateMachine stateMachine, String name) {
		createSimpleState(stateMachine.regions.head, name) => [
			regions += umlFactory.createRegion
		]
	}

	def createPseudostate(Region region, String name, PseudostateKind kind) {
		val pseudostate = umlFactory.createPseudostate => [
			it.name = name
			it.kind = kind
		]
		region.subvertices += pseudostate
		pseudostate
	}

	def createTransition(Region region, String name, State sourceState, State targetState) {
		debug('''Adding transition (name: «name») between «sourceState.name» and «targetState.name»''')
		val transition = umlFactory.createTransition => [
			it.name = name
			source = sourceState
			target = targetState
		]
		region.transitions += transition
		transition
	}

	def createTransition(Model umlRoot) {
		val stateMachine = createStateMachine(umlRoot)
		val region = stateMachine.regions.head
		val sourceState = createSimpleState(region, NAME_DEFAULT_SOURCE_STATE)
		val targetState = createSimpleState(region, NAME_DEFAULT_TARGET_STATE)
		createTransition(region, NAME_DEFAULT_TRANSITION, sourceState, targetState)
	}
	
	def createGuardWithDeafultCppExpression(Transition transition) {
		val guard = umlFactory.createConstraint => [
			specification = umlFactory.createOpaqueExpression => [
				bodies += TEST_EXPRESSION
				languages += CPP_LANGUAGE
			]
		]
		transition.guard = guard
		guard
	}
	
	def createOpaqueBehavior(Transition transition) {
		val effect = UMLFactory.eINSTANCE.createOpaqueBehavior => [
			bodies += TEST_SIDE_EFFECT_1
			languages += CPP_LANGUAGE
		]
		transition.effect = effect
		effect
	}

	def createTrigger(Model umlRoot) {
		val trigger = UMLFactory.eINSTANCE.createTrigger
		createTransition(umlRoot) => [
			triggers += trigger
		]
		trigger
	}

	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def setMultiplicity(MultiplicityElement multiplicityElement, int lower, int upper) {
		multiplicityElement.lower = lower
		multiplicityElement.upper = upper
	}
	
	def transform(org.eclipse.uml2.uml.VisibilityKind kind) {
		switch kind {
			case PRIVATE_LITERAL: VisibilityKind.PRIVATE
			case PROTECTED_LITERAL: VisibilityKind.PROTECTED
			case PUBLIC_LITERAL: VisibilityKind.PUBLIC
			default: {
			}
		}
	}
	
	def transform(ParameterDirectionKind kind) {
		switch kind {
			case IN_LITERAL: DirectionKind.IN
			case OUT_LITERAL: DirectionKind.OUT
			case INOUT_LITERAL: DirectionKind.IN_OUT
			default: {
			}
		}
	}
	
	def updateAttribute(Property property, Attribute attribute, org.eclipse.papyrusrt.xtumlrt.common.Type xtType){
		if(property.type != null){
			attribute.type = xtType
		}
		attribute.static = property.static
		attribute.visibility = transform(property.visibility)
		
		attribute.lowerBound = property.lower
		attribute.upperBound = property.upper
		attribute.ordered = property.isOrdered
		attribute.unique = property.isUnique
	}
}