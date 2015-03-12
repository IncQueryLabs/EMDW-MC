package com.incquerylabs.emdw.umlintegration.test

import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PseudostateKind
import org.eclipse.uml2.uml.Region
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.Trigger
import org.eclipse.uml2.uml.UMLFactory

import static org.junit.Assert.*

class TransformationTestUtil {

	static extension Logger logger = Logger.getLogger(TransformationTestUtil)
	static extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension TraceFactory traceFactory = TraceFactory.eINSTANCE
	
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
	
	static def createComponent(String name) {
		umlFactory.createComponent => [
			it.name = name
		]
	}

	static def createClass(String name) {
		umlFactory.createClass => [
			it.name = name
		]
	}

	static def createInterface(Package umlPackage, String name) {
		debug('''Adding interface (name: «name») to «umlPackage.name»''')
		val interface = umlFactory.createInterface => [
			it.name = name
		]
		umlPackage.packagedElements += interface
		interface
	}

	static def createState(Region region, String name) {
		val state = umlFactory.createState => [
			it.name = name
			entry = umlFactory.createOpaqueBehavior => [
				bodies += TEST_SIDE_EFFECT_1
				languages += CPP_LANGUAGE
			]
			exit = umlFactory.createOpaqueBehavior => [
				bodies += TEST_SIDE_EFFECT_2
				languages += CPP_LANGUAGE
			]
		]
		region.subvertices += state
		state
	}

	static def createParentState(StateMachine stateMachine, String name) {
		createState(stateMachine.regions.head, name) => [
			regions += umlFactory.createRegion
		]
	}
	
	static def createStateMachine(RootMapping mapping) {
		val stateMachine = umlFactory.createStateMachine => [
			it.name = name
			regions += umlFactory.createRegion
		]
		val class = createClass("class") => [
			classifierBehavior = stateMachine
		]
		mapping.umlRoot.packagedElements += class
		stateMachine
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
	
	static def createTransition(RootMapping mapping) {
		val stateMachine = createStateMachine(mapping)
		val region = stateMachine.regions.head
		val sourceState = createState(region, "source")
		val targetState = createState(region, "target")
		createTransition(region, "transition", sourceState, targetState)
	}

	static def createPseudostate(Region region, String name, PseudostateKind kind) {
		val pseudostate = umlFactory.createPseudostate => [
			it.name = name
			it.kind = kind
		]
		region.subvertices += pseudostate
		pseudostate
	}
	
	static def createTrigger(RootMapping mapping) {
		val trigger = UMLFactory.eINSTANCE.createTrigger
		createTransition(mapping) => [
			triggers += trigger
		]
		trigger
	}
	
	static def createSignalForClassEvent(RootMapping mapping) {
		val signal = umlFactory.createSignal
		val class = createClass("class") => [
			nestedClassifiers += signal
		]
		mapping.umlRoot.packagedElements += class
		signal
	}

	static def createSignalForSignalEvent(RootMapping mapping, Trigger trigger) {
		val signal = umlFactory.createSignal
		createInterface(mapping.umlRoot, "interface") => [
			nestedClassifiers += signal
		]
		trigger.event = createSignalEvent(mapping, signal)
		signal
	}
	
	def static createSignalEvent(RootMapping mapping, Signal signal) {
		val signalEvent = umlFactory.createSignalEvent => [
			it.signal = signal
		]
		mapping.umlRoot.packagedElements += signalEvent
		signalEvent
	}

	static def getXtumlrtTopState(RootMapping mapping) {
		mapping.xtumlrtRoot.topEntities.head.behaviour.top
	}

	static def <T> asSet(T object) {
		#{object}.filterNull
	}

	def checkState(com.zeligsoft.xtumlrt.common.State xtumlrtObject) {
		assertEquals(TEST_SIDE_EFFECT_1, xtumlrtObject.entryAction.source)
		assertEquals(TEST_SIDE_EFFECT_2, xtumlrtObject.exitAction.source)
	}
}
