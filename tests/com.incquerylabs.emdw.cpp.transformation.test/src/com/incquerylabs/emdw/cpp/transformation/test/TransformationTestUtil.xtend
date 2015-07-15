package com.incquerylabs.emdw.cpp.transformation.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPProtocolOperationDefinition
import com.ericsson.xtumlrt.oopl.cppmodel.CPPQualifiedNamedElement
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSignal
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrusrt.xtumlrt.common.ActionChain
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
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
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.StateMachine
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.common.TypeConstraint
import org.eclipse.papyrusrt.xtumlrt.common.TypeDefinition
import org.eclipse.papyrusrt.xtumlrt.common.Vertex
import org.eclipse.papyrusrt.xtumlrt.common.VisibilityKind
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationImplementation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XtumlFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalLibrary

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
		val xtumlrtResource = createEmptyXtumlResource(modelname)
		createEmptyXtumlModel(xtumlrtResource, modelname)
	}
	
	static def createEmptyXtumlResource(String resourcename) {
		val resourceSet = new ResourceSetImpl
		val resource = resourceSet.createResource(URI.createURI("model/"+resourcename+"/ref/test.xtuml"))
		val managedEngine = IncQueryEngine.on(new EMFScope(resourceSet))
		QueryBasedFeatures.instance.prepare(managedEngine)
		resource
	}
	
	static def createEmptyXtumlModel(Resource xtumlrtResource, String modelname) {
		val xtumlrtModel = commonFactory.createModel=>[it.name = modelname]
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
	
	static def createXtProtocolOperationDefinition(Protocol root, String name, VisibilityKind visibility, boolean isStatic, Type returnType, ProtocolBehaviourFeatureKind kind, Parameter ... parameter) {
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
	
	static def createXtProtocolOperationImplementation(XTPort root, XTProtocolOperationDefinition definition, String body) {
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
	
	static def createXtAssociation(XTClass source, XTClass target,String name, boolean unique, boolean ordered, int lowerBound, int upperBound) {
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
	
	static def createXtAssociationClass(XTClass source, XTClass target, XTClass assocClass, String name, boolean unique, boolean ordered, int lowerBound, int upperBound) {
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

	static def createTypeDefinition(Package root, Type type, String name) {
		val typeDef = commonFactory.createTypeDefinition => [
			it.name = name
			it.type = type
		]
		root.typeDefinitions += typeDef
		typeDef
	}

	static def createTypeDefinition(Package root, String name) {
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

	static def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, Package xtpackage) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtpackage ]
		val cppPackage = cppFactory.createCPPPackage => [
			it.commonPackage = xtpackage
			it.ooplNameProvider = provider
		]
		root.subElements += cppPackage
		cppPackage
	}
	
	static def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, org.eclipse.papyrusrt.xtumlrt.common.Package xtpackage,
		CPPHeaderFile headerFile, CPPBodyFile bodyFile
	) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtpackage ]
		val cppPackage = cppFactory.createCPPPackage => [
			it.commonPackage = xtpackage
			it.ooplNameProvider = provider
			it.bodyFile = bodyFile
			it.headerFile = headerFile
		]
		root.subElements += cppPackage
		cppPackage
	}
		
	static def CPPPackage createCPPPackageWithFiles(CPPQualifiedNamedElement root, org.eclipse.papyrusrt.xtumlrt.common.Package xtpackage, 
		CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val headerFile = headerDirectory.createCPPHeaderFile()
		val bodyFile = bodyDirectory.createCPPBodyFile()
		
		createCPPPackage(root, xtpackage, headerFile, bodyFile) => [
			it.headerDir = headerDirectory
			it.bodyDir = bodyDirectory
		]
	}
	
	static def CPPPackage createCPPPackageWithDirectoriesAndFiles(
		CPPQualifiedNamedElement root, org.eclipse.papyrusrt.xtumlrt.common.Package xtpackage, CPPDirectory parentDirectory) {
		val headerDirectory = parentDirectory.createCPPSubDirectory
		val bodyDirectory = headerDirectory
		
		createCPPPackageWithFiles(root, xtpackage, headerDirectory, bodyDirectory)
	}
	

	static def CPPProtocol createCPPProtocol(CPPQualifiedNamedElement root, XTProtocol protocol, CPPHeaderFile header) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = protocol ]
		val cppProtocol = cppFactory.createCPPProtocol => [
			it.xtProtocol = protocol
			it.headerFile = header
			it.ooplNameProvider = provider
		]
		root.subElements += cppProtocol
		cppProtocol
	}
	
	static def CPPProtocolOperationDefinition createCPPProtocolOperationDefinition(CPPQualifiedNamedElement root, XTProtocolOperationDefinition definition) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = definition ]
		val cppdef = cppFactory.createCPPProtocolOperationDefinition => [
			it.xtProtocolOperationDefinition = definition
			it.ooplNameProvider = provider
		]
		root.subElements += cppdef
		cppdef
	}

	static def CPPSignal createCPPSignal(CPPQualifiedNamedElement root, Signal signal) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = signal ]
		val cppSignal = cppFactory.createCPPSignal => [
			it.commonSignal = signal
			it.ooplNameProvider = provider
		]
		root.subElements += cppSignal
		cppSignal
	}

	static def CPPEvent createCPPEvent(CPPQualifiedNamedElement root, XTEvent event) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = event ]
		val cppEvent = cppFactory.createCPPEvent => [
			it.xtEvent = event
			it.ooplNameProvider = provider
		]
		root.subElements += cppEvent
		cppEvent
	}
	
	static def CPPOperation createCPPOperation(CPPQualifiedNamedElement root, Operation operation) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = operation ]
		val cppOperation = cppFactory.createCPPOperation => [
			it.commonOperation = operation
			it.ooplNameProvider = provider
		]
		root.subElements += cppOperation
		cppOperation
	}
	
	static def CPPState createCPPState(CPPQualifiedNamedElement root, State state) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = state ]
		val cppState = cppFactory.createCPPState => [
			it.commonState = state
			it.ooplNameProvider = provider
		]
		root.subElements += cppState
		cppState
	}
	
	static def CPPTransition createCPPTransition(CPPQualifiedNamedElement root, Transition trans) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = trans ]
		val cppTransition = cppFactory.createCPPTransition => [
			it.commonTransition = trans
			it.ooplNameProvider = provider
		]
		root.subElements += cppTransition
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
		cppPort
	}
	
	static def CPPAttribute createCPPAttribute(CPPQualifiedNamedElement root, Attribute attr) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = attr ]
		val cppAttr = cppFactory.createCPPAttribute => [
			it.commonAttribute = attr
			it.ooplNameProvider = provider
		]
		root.subElements += cppAttr
		cppAttr
	}

	static def CPPComponent createCPPComponent(CPPQualifiedNamedElement root, XTComponent xtcomponent,
		CPPHeaderFile mainheader, CPPBodyFile mainbody, CPPHeaderFile declheader, CPPHeaderFile defheader) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtcomponent ]
		val cppComponent = cppFactory.createCPPComponent => [
			it.xtComponent = xtcomponent
			it.mainHeaderFile = mainheader
			it.mainBodyFile = mainbody
			it.definitionHeaderFile = defheader
			it.declarationHeaderFile = declheader
			it.ooplNameProvider = provider
		]
		root.subElements += cppComponent
		cppComponent	
	}
	
	static def CPPComponent createCPPComponentWithFiles(CPPQualifiedNamedElement root, XTComponent xtComponent, 
		CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val declHeader = headerDirectory.createCPPHeaderFile()
		val defHeader = headerDirectory.createCPPHeaderFile()
		val mainHeader = headerDirectory.createCPPHeaderFile()
		val mainBody = bodyDirectory.createCPPBodyFile()
		
		createCPPComponent(root, xtComponent, mainHeader, mainBody, declHeader, defHeader) => [
			it.headerDirectory = headerDirectory
			it.bodyDirectory = bodyDirectory
		]
	}
	
	static def CPPComponent createCPPComponentWithDirectoriesAndFiles(
		CPPQualifiedNamedElement root, XTComponent xtComponent, CPPDirectory parentDirectory) {
		val headerDirectory = parentDirectory.createCPPSubDirectory
		val bodyDirectory = headerDirectory
		
		createCPPComponentWithFiles(root, xtComponent, headerDirectory, bodyDirectory)
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
		cppClass	
	}
	
	static def CPPClass createCPPClassWithFiles(CPPQualifiedNamedElement root, XTClass xtclass, 
		CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val headerFile = headerDirectory.createCPPHeaderFile()
		val bodyFile = bodyDirectory.createCPPBodyFile()
		
		createCPPClass(root, xtclass, headerFile, bodyFile)
	}
	
	static def CPPExternalLibrary createCPPExternalLibrary(Resource resource){
		val externalLibrary = createCPPExternalLibrary
		resource.contents += externalLibrary
		return externalLibrary
	}
	
	static def CPPBasicType createCPPBasicType(CPPQualifiedNamedElement root, Type type) {
		cppFactory.createCPPBasicType => [
			it.commonType = type
			it.ooplNameProvider = ooplFactory.createOOPLExistingNameProvider => [ commonNamedElement = type]
			root.subElements += it
		]
	}
	
	static def loadDefaultContainerImplementations(Resource resource) {
		val resourceSet = resource.resourceSet
		resourceSet.getResource(
			URI.createPlatformPluginURI("/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel", true),
			true)
	}
}
