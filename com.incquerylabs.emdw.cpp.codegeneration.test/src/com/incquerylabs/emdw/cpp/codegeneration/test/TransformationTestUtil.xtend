package com.incquerylabs.emdw.cpp.codegeneration.test

import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPHeaderFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPOperation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPackage
import com.ericsson.xtumlrt.oopl.cppmodel.CPPPort
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocol
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSignal
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.CompositeState
import org.eclipse.papyrusrt.xtumlrt.common.DirectionKind
import org.eclipse.papyrusrt.xtumlrt.common.Entity
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import org.eclipse.papyrusrt.xtumlrt.common.Port
import org.eclipse.papyrusrt.xtumlrt.common.Protocol
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.common.SimpleState
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.papyrusrt.xtumlrt.common.Vertex
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPackage
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTTypeConstraint
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlFactory
import com.ericsson.xtumlrt.oopl.OoplFactory

/**
 * Most factory methods are impure: they modify the model! 
 */
class TransformationTestUtil {

	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val XtumlFactory xtumlFactory = XtumlFactory.eINSTANCE
	static extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	static extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE

	public static val CPP_LANGUAGE = "C++"
	public static val TEST_SIDE_EFFECT_1 = '''cout << "foo";'''
	public static val TEST_SIDE_EFFECT_2 = '''cout << "bar";'''
	public static val TEST_EXPRESSION = "true"

	// XTUML UTIL
	static def createEmptyXtumlModel(String modelname) {
		val resourceSet = new ResourceSetImpl
		val xtumlrtResource = resourceSet.createResource(URI.createURI("dummyXtUMLuri"))

		val xtumlrtModel = commonFactory.createModel=>[it.name = modelname]
		xtumlrtResource.contents += xtumlrtModel
		
		xtumlrtModel
	}

	static def createXtPackage(Model xtumlmodel, String name) {
		var pack = xtumlFactory.createXTPackage => [
			it.name = name
		]
		xtumlmodel.rootPackages += pack
		pack
	}

	static def createXtPackage(XTPackage root, String name) {
		var pack = xtumlFactory.createXTPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	static def createXtPackage(XTComponent root, String name) {
		var pack = xtumlFactory.createXTPackage => [
			it.name = name
		]
		root.packages += pack
		pack
	}

	static def createXtComponent(XTPackage root, String name) {
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
		root.ownedClasses += xtclass
		xtclass
	}
	
	static def createXtClass(XTPackage root, String name) {
		var xtclass = xtumlFactory.createXTClass => [
			it.name = name
		]
		root.entities += xtclass
		xtclass
	}

	static def createStateMachine(XTClass root, String name) {
		var sm = commonFactory.createStateMachine => [
			it.name = name
		]
		root.behaviour = sm
		sm
	}

	static def createXtProtocol(XTPackage root, String name) {
		var protocol = xtumlFactory.createXTProtocol => [
			it.name = name
		]
		root.protocols += protocol
		protocol
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
		root.substates+=compState
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

	static def createActionChain(Transition root, String name, String ... code) {
		val aChain = commonFactory.createActionChain => [
			it.name = name
		]
		root.actionChain = aChain
		code.forEach[createActionCode(aChain, name, it)]
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

	static def createTypeDefinition(XTPackage root, Type type, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typedefinitions += typeDef
		typeDef
	}

	static def createTypeDefinition(XTPackage root, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typedefinitions += typeDef
		typeDef
	}

	static def createPrimitiveType(XTPackage pack, TypeDefinition typedef, String name) {
		val type = commonFactory.createPrimitiveType => [
			it.name = name
		]
		typedef.type = type
		pack.eResource.contents+=type
		type
	}

	static def createXTUserDefinedType(XTPackage pack, TypeDefinition typedef, String name, XTTypeConstraint ... const) {
		val type = xtumlFactory.createXTUserDefinedTypes => [
			it.name = name
			it.constraints += const
		]
		typedef.type = type
		pack.eResource.contents+=type
		type

	}

	static def createOperation(Entity root, VisibilityKind visibility, boolean isStatic, Type returnType, String name,
		String body, Parameter ... parameter) {
		val op = commonFactory.createOperation => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.returnType = returnType
			it.body = createActionCode(name, body)
			it.parameters += parameter
		]
		root.operations += op
		op
	}

	static def createSingleAttribute(Entity root, Type type, VisibilityKind visibility, boolean isStatic, String name) {
		val attr = commonFactory.createAttribute => [
			it.name = name
			it.visibility = visibility
			it.static = isStatic
			it.type = type
			it.lowerBound = 1
			it.upperBound = 1
		]
		root.attributes += attr
		attr
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

	// CPP UTIL
	static def createCPPResource(Model xtUmlModel) {
		val cppResource = xtUmlModel.eResource.resourceSet.createResource(URI.createURI("model/"+xtUmlModel.name+"/ref/test.cppmodel"))
		cppResource
	}
	
	static def createCPPModel(Resource cppResource, Model xtModel) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtModel ]
		val cppModel = cppFactory.createCPPModel => [
			commonModel = xtModel
			it.ooplNameProvider = provider
		]
		cppResource.contents += cppModel
		cppResource.contents+=provider
		cppModel
	}

	static def createCPPDirectory(Resource cppResource) {
		val cppDir = cppFactory.createCPPDirectory
		cppResource.contents += cppDir
		cppDir
	}
	
	static def createCPPSubDirectory(CPPDirectory root) {
		val cppDir = cppFactory.createCPPDirectory
		root.subDirectories += cppDir
		cppDir
	}
	
	static def createCPPHeaderFile(CPPDirectory root, CPPHeaderFile ... included) {
		val cppHeader = cppFactory.createCPPHeaderFile=>[
			includedHeaders+=included
		]
		root.files += cppHeader
		cppHeader
	}
	
	static def createCPPBodyFile(CPPDirectory root, CPPHeaderFile ... included) {
		val cppBody = cppFactory.createCPPBodyFile=>[
			includedHeaders+=included
		]
		root.files += cppBody
		cppBody
	}

	static def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, XTPackage xtpackage) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtpackage ]
		val cppPackage = cppFactory.createCPPPackage => [
			it.xtPackage = xtpackage
			it.ooplNameProvider = provider
		]
		root.subElements += cppPackage
		root.eResource.contents+= provider
		cppPackage
	}

	static def CPPProtocol createCPPProtocol(CPPQualifiedNamedElement root, XTProtocol protocol, CPPHeaderFile header) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = protocol ]
		val cppProtocol = cppFactory.createCPPProtocol => [
			it.xtProtocol = protocol
			it.headerFile = header
			it.ooplNameProvider = provider
		]
		root.subElements += cppProtocol
		root.eResource.contents+= provider
		cppProtocol
	}

	static def CPPSignal createCPPSignal(CPPQualifiedNamedElement root, Signal signal) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = signal ]
		val cppSignal = cppFactory.createCPPSignal => [
			it.commonSignal = signal
			it.ooplNameProvider = provider
		]
		root.subElements += cppSignal
		root.eResource.contents+= provider
		cppSignal
	}

	static def CPPEvent createCPPEvent(CPPQualifiedNamedElement root, XTEvent event) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = event ]
		val cppEvent = cppFactory.createCPPEvent => [
			it.xtEvent = event
			it.ooplNameProvider = provider
		]
		root.subElements += cppEvent
		root.eResource.contents+= provider
		cppEvent
	}
	
	static def CPPOperation createCPPOperation(CPPQualifiedNamedElement root, Operation operation) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = operation ]
		val cppOperation = cppFactory.createCPPOperation => [
			it.commonOperation = operation
			it.ooplNameProvider = provider
		]
		root.subElements += cppOperation
		root.eResource.contents+= provider
		cppOperation
	}
	
	static def CPPState createCPPState(CPPQualifiedNamedElement root, State state) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = state ]
		val cppState = cppFactory.createCPPState => [
			it.commonState = state
			it.ooplNameProvider = provider
		]
		root.subElements += cppState
		root.eResource.contents+= provider
		cppState
	}
	
	static def CPPTransition createCPPTransition(CPPQualifiedNamedElement root, Transition trans) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = trans ]
		val cppTransition = cppFactory.createCPPTransition => [
			it.commonTransition = trans
			it.ooplNameProvider = provider
		]
		root.subElements += cppTransition
		root.eResource.contents+= provider
		cppTransition
	}
	
	static def CPPPort createCPPPort(CPPQualifiedNamedElement root, XTPort port,CPPHeaderFile header, CPPBodyFile body  ) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = port ]
		val cppPort = cppFactory.createCPPPort => [
			it.xtPort = port
			it.headerFile = header
			it.bodyFile = body
			it.ooplNameProvider = provider
		]
		root.subElements += cppPort
		root.eResource.contents+= provider
		cppPort
	}
	
	static def CPPAttribute createCPPAttribute(CPPQualifiedNamedElement root, Attribute attr) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = attr ]
		val cppAttr = cppFactory.createCPPAttribute => [
			it.commonAttribute = attr
			it.ooplNameProvider = provider
		]
		root.subElements += cppAttr
		root.eResource.contents+= provider
		cppAttr
	}

	static def CPPComponent createCPPComponent(CPPQualifiedNamedElement root, XTComponent xtcomponent,
		CPPHeaderFile mainheader, CPPBodyFile mainbody, CPPHeaderFile declheader, CPPHeaderFile defheader) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtcomponent ]
		val cppComponent = cppFactory.createCPPComponent => [
			it.xtComponent = xtcomponent
			it.mainHeaderFile = mainheader
			it.mainBodyFile = mainbody
			it.declarationHeaderFile = defheader
			it.declarationHeaderFile = declheader
			it.ooplNameProvider = provider
		]
		root.subElements += cppComponent
		root.eResource.contents+= provider
		cppComponent	
	}
	
	static def CPPClass createCPPClass(CPPQualifiedNamedElement root, XTClass xtclass, CPPHeaderFile header, CPPBodyFile body ) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtclass ]
		val cppClass = cppFactory.createCPPClass => [
			it.xtClass = xtclass
			it.headerFile = header
			it.bodyFile = body
			it.ooplNameProvider = provider
		]
		root.subElements += cppClass
		root.eResource.contents+= provider
		cppClass	
	}
}
