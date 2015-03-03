package com.incquerylabs.emdw.umlintegration.test

import com.incquerylabs.emdw.umlintegration.trace.RootMapping
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.uml2.uml.BehavioredClassifier
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PseudostateKind
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl

class ModelBuilderUtil {
	
	protected extension Logger logger = Logger.getLogger(ModelBuilderUtil)
	protected extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	protected extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	protected extension TraceFactory traceFactory = TraceFactory.eINSTANCE
	
	def createRootMapping(String umlModelName) {
		val resourceSet = new ResourceSetImpl
		val umlResource = resourceSet.createResource(URI.createURI("dummyUmlUri"))
		val xtumlrtResource = resourceSet.createResource(URI.createURI("dummyXtumlrtUri"))
		val traceResource = resourceSet.createResource(URI.createURI("dummyTraceUri"))
		
		val umlModel = umlFactory.createModel => [
			name = umlModelName
		]
		umlResource.contents += umlModel
		
		val xtumlrtPackage = commonFactory.createPackage
		xtumlrtResource.contents += xtumlrtPackage

		val mapping = createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtPackage
		]
		traceResource.contents += mapping
		mapping
	}
	
	def createClass(Package umlPackage, String name) {
		debug('''Adding Class (name: «name») to «umlPackage.name»''')
		val class = umlFactory.createClass => [
			it.name = name
		]
		umlPackage.packagedElements += class
		class
	}

	def createStateMachine(BehavioredClassifier behavioredClassifier, String name) {
		debug('''Adding StateMachine (name: «name») to «behavioredClassifier.name»''')
		val stateMachine = umlFactory.createStateMachine => [
			it.name = name
			regions += umlFactory.createRegion
		]
		behavioredClassifier.classifierBehavior = stateMachine
		stateMachine
	}

	def createState(StateMachine stateMachine, String name) {
		debug('''Adding state (name: «name») to «stateMachine.name»''')
		val state = umlFactory.createState => [
			it.name = name
		]
		stateMachine.regions.head.subvertices += state
		state
	}
	
	def createParentState(StateMachine stateMachine, String name) {
		createState(stateMachine, name) => [
			regions += umlFactory.createRegion
		]
	}
	
	def createChildState(State parentState, String name) {
		debug('''Adding state (name: «name») to «parentState.name»''')
		val state = umlFactory.createState => [
			it.name = name
		]
		parentState.regions.head.subvertices += state
		state
	}

	def createStateMachine(RootMapping rootMapping) {
		val class = createClass(rootMapping.umlRoot, "class")
		createStateMachine(class, "stateMachine")
	}
	
	def createTransition(StateMachine stateMachine, String name, State sourceState, State targetState) {
		debug('''Adding transition (name: «name») between «sourceState.name» and «targetState.name»''')
		createTransitionWithSource(stateMachine, name, sourceState) => [
			target = targetState
		]
	}

	def createTransitionWithSource(StateMachine stateMachine, String name, State sourceState) {
		val transition = umlFactory.createTransition => [
			it.name = name
			source = sourceState 
		]
		stateMachine.regions.head.transitions += transition
		transition
	}
	
	def createInitialState(StateMachine stateMachine, String name) {
		debug('''Adding state (name: «name») to «stateMachine.name»''')
		val initialState = umlFactory.createPseudostate => [
			it.name = name
			kind = PseudostateKind.INITIAL_LITERAL
		]
		stateMachine.regions.head.subvertices += initialState
		initialState
	}
	
	def createInitialChildState(State state, String name) {
		debug('''Adding state (name: «name») to «state.name»''')
		val initialChildState = umlFactory.createPseudostate => [
			it.name = name
			kind = PseudostateKind.INITIAL_LITERAL
		]
		state.regions.head.subvertices += initialChildState
		initialChildState
	}

}
