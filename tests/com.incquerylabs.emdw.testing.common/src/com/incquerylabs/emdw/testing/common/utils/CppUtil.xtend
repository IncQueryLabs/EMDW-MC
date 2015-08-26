package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPComponent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPDirectory
import com.ericsson.xtumlrt.oopl.cppmodel.CPPEvent
import com.ericsson.xtumlrt.oopl.cppmodel.CPPExternalLibrary
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
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition

class CppUtil extends AbstractUtil {
	static extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	static extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	
	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
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
	
	static def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, Package xtpackage,
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
		
	static def CPPPackage createCPPPackageWithFiles(CPPQualifiedNamedElement root, Package xtpackage, 
		CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val headerFile = headerDirectory.createCPPHeaderFile()
		val bodyFile = bodyDirectory.createCPPBodyFile()
		
		createCPPPackage(root, xtpackage, headerFile, bodyFile) => [
			it.headerDir = headerDirectory
			it.bodyDir = bodyDirectory
		]
	}
	
	static def CPPPackage createCPPPackageWithDirectoriesAndFiles(
		CPPQualifiedNamedElement root, Package xtpackage, CPPDirectory parentDirectory) {
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
	
	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	static def loadDefaultContainerImplementations(Resource resource) {
		val resourceSet = resource.resourceSet
		resourceSet.getResource(
			URI.createPlatformPluginURI(PATH_CPP_COLLECTIONS, true),
			true)
	}
}