package com.incquerylabs.emdw.umlintegration.test

import com.zeligsoft.xtumlrt.common.CommonFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.uml2.uml.BehavioredClassifier
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PseudostateKind
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.UMLFactory
import traceability.TraceabilityFactory
import traceability.UmlToCommon

class ModelBuilderUtil {
	
	protected extension Logger logger = Logger.getLogger(ModelBuilderUtil)
	protected extension UMLFactory sourceFactory = UMLFactory.eINSTANCE
	protected extension CommonFactory targetFactory = CommonFactory.eINSTANCE
	protected extension TraceabilityFactory traceFactory = TraceabilityFactory.eINSTANCE
	
	def prepareEmptyModel(String cpsId) {
		val rs = new ResourceSetImpl()
		val sourceRes = rs.createResource(URI.createURI("dummySourceUri"))
		val targetRes = rs.createResource(URI.createURI("dummyTargetUri"))
		val traceRes = rs.createResource(URI.createURI("dummyTraceabilityUri"))
		
		val sourceRoot = sourceFactory.createModel => [
			name = cpsId
		]
		sourceRes.contents += sourceRoot
		
		val targetRoot = targetFactory.createPackage => [
		]
		targetRes.contents += targetRoot

		val mapping = createUmlToCommon => [
			uml = sourceRoot
			common = targetRoot
		]
		traceRes.contents += mapping
		mapping
	}
	
	def prepareClass(Package umlPackage, String id) {
		debug('''Adding Class (ID: «id») to «umlPackage.name»''')
		val class = sourceFactory.createClass => [
			name = id
		]
		umlPackage.packagedElements += class
		class
	}
	
	def prepareStateMachine(BehavioredClassifier behavioredClassifier, String id) {
		debug('''Adding StateMachine (ID: «id») to «behavioredClassifier.name»''')
		val stateMachine = sourceFactory.createStateMachine => [
			name = id
			regions += sourceFactory.createRegion
		]
		behavioredClassifier.classifierBehavior = stateMachine
		stateMachine
	}

	def prepareState(StateMachine sm, String stateId) {
		debug('''Adding state (ID: «stateId») to «sm.name»''')
		val state = sourceFactory.createState => [
			name = stateId
		]
		sm.regions.head.subvertices += state
		state
	}
	
	def prepareSuperstate(StateMachine sm, String stateId) {
		prepareState(sm, stateId) => [
			regions += sourceFactory.createRegion
		]
	}
	
	def prepareSubstate(State superstate, String stateId) {
		debug('''Adding state (ID: «stateId») to «superstate.name»''')
		val state = sourceFactory.createState => [
			name = stateId
		]
		superstate.regions.head.subvertices += state
		state
	}

	def createStateMachine(UmlToCommon mapping) {
		val class = prepareClass(mapping.uml, "class")
		prepareStateMachine(class, "stateMachine")
	}
	
	def prepareTransition(StateMachine stateMachine, State sourceState, String transitionID, State targetState) {
		debug('''Adding transition (ID: «transitionID») between «sourceState.name» and «targetState.name»''')
		prepareTransitionWithSource(stateMachine, sourceState, transitionID) => [
			target = targetState
		]
	}

	def prepareTransitionWithSource(StateMachine stateMachine, State sourceState, String transitionID) {
		val transition = sourceFactory.createTransition => [
			name = transitionID
			source = sourceState 
		]
		stateMachine.regions.head.transitions += transition 
		transition
	}
	
	def prepareInitialState(StateMachine sm, String stateId) {
		debug('''Adding state (ID: «stateId») to «sm.name»''')
		val initialState = sourceFactory.createPseudostate => [
			name = stateId
			kind = PseudostateKind.INITIAL_LITERAL
		]
		sm.regions.head.subvertices += initialState
		initialState
	}
	
	def prepareInitialChildState(State state, String stateId) {
		debug('''Adding state (ID: «stateId») to «state.name»''')
		val initialState = sourceFactory.createPseudostate => [
			name = stateId
			kind = PseudostateKind.INITIAL_LITERAL
		]
		state.regions.head.subvertices += initialState
		initialState
	}

}
