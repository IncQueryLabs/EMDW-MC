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
import org.eclipse.uml2.uml.State
import org.eclipse.uml2.uml.StateMachine
import org.eclipse.uml2.uml.UMLFactory

class TransformationTestUtil {

	static extension Logger logger = Logger.getLogger(TransformationTestUtil)
	static extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension TraceFactory traceFactory = TraceFactory.eINSTANCE
	public static val CPP_LANGUAGE = "C++"

	static def createRootMapping(String umlModelName) {
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
	
	static def createClass(Package umlPackage, String name) {
		debug('''Adding class (name: «name») to «umlPackage.name»''')
		val class = umlFactory.createClass => [
			it.name = name
		]
		umlPackage.packagedElements += class
		class
	}

	static def createState(Region region, String name) {
		val state = umlFactory.createState => [
			it.name = name
		]
		region.subvertices += state
		state
	}

	static def createParentState(StateMachine stateMachine, String name) {
		createState(stateMachine.regions.head, name) => [
			regions += umlFactory.createRegion
		]
	}
	
	static def createStateMachine(RootMapping rootMapping) {
		val class = createClass(rootMapping.umlRoot, "class")
		val stateMachine = umlFactory.createStateMachine => [
			it.name = name
			regions += umlFactory.createRegion
		]
		class.classifierBehavior = stateMachine
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
		val sourceState = createState(stateMachine.regions.head, "source")
		val targetState = createState(stateMachine.regions.head, "target")
		createTransition(stateMachine.regions.head, "transition", sourceState, targetState)
	}

	static def createPseudostate(Region region, String name, PseudostateKind kind) {
		val pseudostate = umlFactory.createPseudostate => [
			it.name = name
			it.kind = kind
		]
		region.subvertices += pseudostate
		pseudostate
	}
	
	static def getXtumlrtTopState(RootMapping mapping) {
		mapping.xtumlrtRoot.entities.head.behaviour.top
	}

	static def <T> asSet(T object) {
		#{object}.filterNull
	}
}
