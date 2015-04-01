package com.incquerylabs.emdw.umlintegration.test

import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Connector
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
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

import static org.junit.Assert.*
import com.zeligsoft.xtumlrt.xtuml.XTClass

/**
 * Most factory methods are impure: they modify the model! 
 */
class TransformationTestUtil {

	static extension val Logger logger = Logger.getLogger(TransformationTestUtil)
	static extension val UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val TraceFactory traceFactory = TraceFactory.eINSTANCE
	
	public static val CPP_LANGUAGE = "C++"
	public static val TEST_SIDE_EFFECT_1 = '''cout << "foo";'''
	public static val TEST_SIDE_EFFECT_2 = '''cout << "bar";'''
	public static val TEST_EXPRESSION = "true"

	static def createRootMapping(String umlModelName) {
		val resourceSet = new ResourceSetImpl
		val umlResource = resourceSet.createResource(URI.createURI("dummyUmlUri"))
		val xtumlrtResource = resourceSet.createResource(URI.createURI("dummyXtumlrtUri"))
		val traceResource = resourceSet.createResource(URI.createURI("dummyTraceUri"))
		
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
		mapping
	}
	
	static def createPackage(String name) {
		umlFactory.createPackage => [
			it.name = name
		]
	}

	static def createPackageInModel(Model umlRoot) {
		val package = createPackage("package")
		umlRoot.packagedElements += package
		package
	}

	static def createComponent(String name) {
		umlFactory.createComponent => [
			it.name = name
		]
	}

	static def createComponentInModel(Model umlRoot) {
		val component = createComponent("component")
		umlRoot.packagedElements += component
		component
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

	static def createClassInModel(Model umlRoot) {
		val class = createClass("class")
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
	
	static def createGeneralization(Class subClass, Class superClass) {
		val generalization = umlFactory.createGeneralization => [
			specific = subClass
			general = superClass
		]
		subClass.generalizations += generalization
		generalization
	}

	static def createSignalForClassEvent(Model umlRoot) {
		val signal = umlFactory.createSignal
		val class = createClass("class") => [
			nestedClassifiers += signal
		]
		umlRoot.packagedElements += class
		signal
	}

	static def createSignalForSignalEvent(Model umlRoot, Trigger trigger) {
		val signal = umlFactory.createSignal
		createInterface(umlRoot, "interface") => [
			nestedClassifiers += signal
		]
		trigger.event = createSignalEvent(umlRoot, signal)
		signal
	}

	private static def createSignalEvent(Model umlRoot, Signal signal) {
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
		val sourceState = createSimpleState(region, "source")
		val targetState = createSimpleState(region, "target")
		createTransition(region, "transition", sourceState, targetState)
	}

	static def createTrigger(Model umlRoot) {
		val trigger = UMLFactory.eINSTANCE.createTrigger
		createTransition(umlRoot) => [
			triggers += trigger
		]
		trigger
	}
	
	static def getXtumlrtTopState(com.zeligsoft.xtumlrt.common.Model xtumlrtRoot) {
		xtumlrtRoot.topEntities.head.behaviour.top
	}

	static def findClass(RootMapping mapping, String className) {
		mapping.xtumlrtRoot.topEntities.filter(XTClass).findFirst[name == className]
	}
	
	static def <T> asSet(T object) {
		#{object}.filterNull
	}

	static def checkState(com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.entryAction.source)
		assertEquals(TEST_SIDE_EFFECT_2, xtumlrtObject.exitAction.source)
	}

	static def checkTransition(RootMapping mapping, Transition umlObject, com.zeligsoft.xtumlrt.common.Transition xtumlrtObject) {
		val sourceVertex = mapping.traces.findFirst[umlElements.contains(umlObject.source)].xtumlrtElements.head
		val targetVertex = mapping.traces.findFirst[umlElements.contains(umlObject.target)].xtumlrtElements.head
		assertEquals("Transition source vertex", sourceVertex, xtumlrtObject.sourceVertex)
		assertEquals("Transition target vertex", targetVertex, xtumlrtObject.targetVertex)
	}

}
