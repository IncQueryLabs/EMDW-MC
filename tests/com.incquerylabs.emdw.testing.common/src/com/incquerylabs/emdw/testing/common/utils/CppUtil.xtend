/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Robert Doczi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.AssociativeCollectionKind
import com.ericsson.xtumlrt.oopl.OOPLClassRefAssocCollectionImplementation
import com.ericsson.xtumlrt.oopl.OOPLClassRefSimpleCollectionImplementation
import com.ericsson.xtumlrt.oopl.OOPLDataType
import com.ericsson.xtumlrt.oopl.OOPLNameProvider
import com.ericsson.xtumlrt.oopl.OOPLSequenceImplementation
import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.SequenceOrderednessKind
import com.ericsson.xtumlrt.oopl.SequenceUniquenessKind
import com.ericsson.xtumlrt.oopl.SimpleCollectionKind
import com.ericsson.xtumlrt.oopl.cppmodel.CPPAttribute
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBasicType
import com.ericsson.xtumlrt.oopl.cppmodel.CPPBodyFile
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClass
import com.ericsson.xtumlrt.oopl.cppmodel.CPPClassReferenceStorage
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
import com.ericsson.xtumlrt.oopl.cppmodel.CPPRelation
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSequence
import com.ericsson.xtumlrt.oopl.cppmodel.CPPSignal
import com.ericsson.xtumlrt.oopl.cppmodel.CPPState
import com.ericsson.xtumlrt.oopl.cppmodel.CPPTransition
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.Attribute
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Operation
import org.eclipse.papyrusrt.xtumlrt.common.Package
import org.eclipse.papyrusrt.xtumlrt.common.Signal
import org.eclipse.papyrusrt.xtumlrt.common.State
import org.eclipse.papyrusrt.xtumlrt.common.Transition
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTAssociation
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTClass
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTComponent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTEvent
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTPort
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocol
import org.eclipse.papyrusrt.xtumlrt.xtuml.XTProtocolOperationDefinition
import com.ericsson.xtumlrt.oopl.cppmodel.CPPFormalParameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPReturnValue
import org.eclipse.papyrusrt.xtumlrt.common.TypedMultiplicityElement
import org.eclipse.papyrusrt.xtumlrt.common.Parameter
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import com.incquerylabs.emdw.cpp.common.EMDWConstants

class CppUtil extends ModelUtil {
	static extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	static extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE

	// CREATION ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def createCPPResource(Model xtUmlModel) {
		val cppResource = xtUmlModel.eResource.resourceSet.createResource(
			URI.createURI("model/" + xtUmlModel.name + "/ref/test.cppmodel"))
		cppResource
	}

	def prepareCPPModel(Resource resource, Model xtModel) {
		val cppModel = createCPPModel(resource, xtModel)
		val modelDir = createCPPDirectory(cppModel.eResource)
		resource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		return cppModel
	}

	def createCPPModel(Resource cppResource, Model xtModel) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = xtModel]
		val cppModel = cppFactory.createCPPModel => [
			commonModel = xtModel
			it.ooplNameProvider = provider
		]
		cppResource.contents += cppModel
		cppResource.resourceSet.getResource(URI.createURI(PATH_CPP_TYPES), true)
		cppModel
	}
	
	def createCPPModelWithCommonDirectory(Resource cppResource, Model xtModel) {
		val dir = createCPPDirectory
		val cppModel = cppResource.createCPPModel(xtModel) => [
			it.headerDir = dir
			it.bodyDir = dir
		]
		cppResource.contents += dir
		cppModel
	}
	
	def createEmptyCppModel(String modelname) {
		val resourceSet = new ResourceSetImpl
		val cppResource = resourceSet.createResource(URI.createURI('''model/«modelname»/«URI_DUMMY_CPP»'''))

		val provider = ooplFactory.createOOPLDerivedNameProvider=>[name = modelname]
		val dir = createCPPDirectoryWithMakeRules
		val cppPackage = cppFactory.createCPPPackage=>[
			it.ooplNameProvider = provider
			it.bodyDir = dir
			it.headerDir = dir
		]
		cppResource.contents += dir
		cppResource.contents += cppPackage
		
		cppPackage
	}

	def createCPPDirectory(Resource cppResource) {
		val cppDir = createCPPDirectoryWithMakeRules
		cppResource.contents += cppDir
		cppDir
	}

	def createCPPDirectoryWithMakeRules() {
		val makeRules = cppFactory.createCPPMakeFile
		val cppDir = cppFactory.createCPPDirectory => [
			it.makeRulesFile = makeRules
			it.files += makeRules
		]
		cppDir
	}
	
	def createCPPMakefile() {
		cppFactory.createCPPMakeFile
	}
	
	def createCPPSubDirectory(CPPDirectory root) {
		val cppDir = createCPPDirectoryWithMakeRules
		root.subDirectories += cppDir
		cppDir
	}

	def createCPPHeaderFile(CPPDirectory root, CPPHeaderFile ... included) {
		val cppHeader = cppFactory.createCPPHeaderFile => [
			includedHeaders += included
		]
		root.files += cppHeader
		cppHeader
	}

	def createCPPBodyFile(CPPDirectory root, CPPHeaderFile ... included) {
		val cppBody = cppFactory.createCPPBodyFile => [
			includedHeaders += included
		]
		root.files += cppBody
		cppBody
	}

	dispatch def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, Package xtpackage) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = xtpackage]
		val cppPackage = cppFactory.createCPPPackage => [
			it.commonPackage = xtpackage
			it.ooplNameProvider = provider
		]
		root.subElements += cppPackage
		cppPackage
	}

	dispatch def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, Package xtpackage, CPPHeaderFile headerFile, CPPBodyFile bodyFile) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = xtpackage]
		val cppPackage = cppFactory.createCPPPackage => [
			it.commonPackage = xtpackage
			it.ooplNameProvider = provider
			it.bodyFile = bodyFile
			it.headerFile = headerFile
		]
		root.subElements += cppPackage
		cppPackage
	}

	def CPPPackage createCPPPackageWithFiles(CPPQualifiedNamedElement root, Package xtpackage, CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val headerFile = headerDirectory.createCPPHeaderFile()
		val bodyFile = bodyDirectory.createCPPBodyFile()

		createCPPPackage(root, xtpackage, headerFile, bodyFile) => [
			it.headerDir = headerDirectory
			it.bodyDir = bodyDirectory
		]
	}

	dispatch def CPPPackage createCPPPackage(CPPModel root, Package xtpackage) {
		createCPPPackage(root, root.bodyDir, root.headerDir, xtpackage, null, null)
	}

	dispatch def CPPPackage createCPPPackage(CPPComponent root, Package xtpackage, CPPHeaderFile headerFile, CPPBodyFile bodyFile
	) {
		createCPPPackage(root, root.bodyDirectory, root.headerDirectory, xtpackage, headerFile, bodyFile)
	}

	def CPPPackage createCPPPackage(CPPQualifiedNamedElement root, CPPDirectory rootBodyDir, CPPDirectory rootHeaderDir, Package xtpackage, CPPHeaderFile headerFile, CPPBodyFile bodyFile) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtpackage ]
		val bodyDir = createCPPDirectoryWithMakeRules
		var CPPDirectory other
		if(rootBodyDir!=rootHeaderDir) {
			other = createCPPDirectoryWithMakeRules
		} else {
			other = bodyDir
		}
		val headerDir = other
		val cppPackage = cppFactory.createCPPPackage => [
			it.commonPackage = xtpackage
			it.ooplNameProvider = provider
			it.headerDir = headerDir
			it.bodyDir = bodyDir
			it.headerFile = headerFile
			it.bodyFile = bodyFile
		]
		root.subElements += cppPackage
		rootBodyDir.subDirectories += bodyDir
		if(rootBodyDir!=rootHeaderDir) {
			rootHeaderDir.subDirectories += headerDir
		}
		cppPackage
	}

	def CPPPackage createCPPPackageWithDirectoriesAndFiles(CPPQualifiedNamedElement root, Package xtpackage, CPPDirectory parentDirectory) {
		val headerDirectory = parentDirectory.createCPPSubDirectory
		val bodyDirectory = headerDirectory

		createCPPPackageWithFiles(root, xtpackage, headerDirectory, bodyDirectory)
	}

	def CPPProtocol createCPPProtocol(CPPQualifiedNamedElement root, XTProtocol protocol, CPPHeaderFile header) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = protocol]
		val cppProtocol = cppFactory.createCPPProtocol => [
			it.xtProtocol = protocol
			it.headerFile = header
			it.ooplNameProvider = provider
		]
		root.subElements += cppProtocol
		cppProtocol
	}

	def CPPProtocolOperationDefinition createCPPProtocolOperationDefinition(CPPQualifiedNamedElement root,
		XTProtocolOperationDefinition definition) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = definition]
		val cppdef = cppFactory.createCPPProtocolOperationDefinition => [
			it.xtProtocolOperationDefinition = definition
			it.ooplNameProvider = provider
		]
		root.subElements += cppdef
		cppdef
	}

	def CPPSignal createCPPSignal(CPPQualifiedNamedElement root, Signal signal) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = signal]
		val cppSignal = cppFactory.createCPPSignal => [
			it.commonSignal = signal
			it.ooplNameProvider = provider
		]
		root.subElements += cppSignal
		cppSignal
	}

	def CPPEvent createCPPEvent(CPPQualifiedNamedElement root, XTEvent event) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = event]
		val cppEvent = cppFactory.createCPPEvent => [
			it.xtEvent = event
			it.ooplNameProvider = provider
		]
		root.subElements += cppEvent
		cppEvent
	}

	def CPPOperation createCPPOperation(CPPQualifiedNamedElement root, Operation operation) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = operation]
		val cppOperation = cppFactory.createCPPOperation => [
			it.commonOperation = operation
			it.ooplNameProvider = provider
		]
		root.subElements += cppOperation
		cppOperation
	}

	def CPPState createCPPState(CPPQualifiedNamedElement root, State state) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = state]
		val cppState = cppFactory.createCPPState => [
			it.commonState = state
			it.ooplNameProvider = provider
		]
		root.subElements += cppState
		cppState
	}

	def CPPTransition createCPPTransition(CPPQualifiedNamedElement root, Transition trans) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = trans]
		val cppTransition = cppFactory.createCPPTransition => [
			it.commonTransition = trans
			it.ooplNameProvider = provider
		]
		root.subElements += cppTransition
		cppTransition
	}

	def CPPPort createCPPPort(CPPQualifiedNamedElement root, XTPort port, CPPHeaderFile header,
		CPPBodyFile body) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = port]
		val cppPort = cppFactory.createCPPPort => [
			it.xtPort = port
			it.headerFile = header
			it.bodyFile = body
			it.ooplNameProvider = provider
		]
		root.subElements += cppPort
		cppPort
	}

	def CPPAttribute createCPPAttribute(CPPQualifiedNamedElement root, Attribute attr) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = attr]
		val cppAttr = cppFactory.createCPPAttribute => [
			it.commonAttribute = attr
			it.ooplNameProvider = provider
		]
		root.subElements += cppAttr
		cppAttr
	}

	def CPPComponent createCPPComponent(CPPQualifiedNamedElement root, XTComponent xtcomponent,
		CPPHeaderFile mainheader, CPPBodyFile mainbody, CPPHeaderFile declheader, CPPHeaderFile defheader) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = xtcomponent]
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

	def CPPComponent createCPPComponentWithFiles(CPPQualifiedNamedElement root, XTComponent xtComponent,
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

	def CPPComponent createCPPComponentWithDirectoriesAndFiles(CPPQualifiedNamedElement root,
		XTComponent xtComponent, CPPDirectory parentDirectory) {
		val headerDirectory = parentDirectory.createCPPSubDirectory
		val bodyDirectory = headerDirectory

		createCPPComponentWithFiles(root, xtComponent, headerDirectory, bodyDirectory)
	}

	def CPPComponent createCPPComponentWithDirectoriesAndFiles(CPPPackage root, XTComponent xtComponent) {
		val headerDirectory = root.headerDir.createCPPSubDirectory
		var CPPDirectory bodyDirectory = headerDirectory
		if(root.headerDir != root.bodyDir) {
			bodyDirectory = root.bodyDir.createCPPSubDirectory
		}

		createCPPComponentWithFiles(root, xtComponent, headerDirectory, bodyDirectory)
	}

	def CPPClass createCPPClass(CPPQualifiedNamedElement root, XTClass xtclass, CPPHeaderFile header,
		CPPBodyFile body) {
		val provider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = xtclass]
		val cppClass = root.createCPPClass(provider, header, body) => [
			it.xtClass = xtclass
		]
		cppClass
	}

	def CPPClass createCPPClass(CPPQualifiedNamedElement root, String name, CPPHeaderFile header,
		CPPBodyFile body) {
		val provider = ooplFactory.createOOPLDerivedNameProvider => [it.name = name]
		val cppClass = root.createCPPClass(provider, header, body)
		cppClass
	}

	def CPPClass createCPPClass(CPPQualifiedNamedElement root, OOPLNameProvider provider, CPPHeaderFile header,
		CPPBodyFile body) {
		val cppClass = cppFactory.createCPPClass => [
			it.headerFile = header
			it.bodyFile = body
			it.ooplNameProvider = provider
		]
		root.subElements += cppClass
		cppClass
	}

	def CPPClass createCPPClassWithFiles(CPPQualifiedNamedElement root, XTClass xtclass,
		CPPDirectory headerDirectory, CPPDirectory bodyDirectory) {
		val headerFile = headerDirectory.createCPPHeaderFile()
		val bodyFile = bodyDirectory.createCPPBodyFile()

		createCPPClass(root, xtclass, headerFile, bodyFile)
	}

	def CPPExternalLibrary createCPPExternalLibrary(Resource resource) {
		val externalLibrary = createCPPExternalLibrary
		resource.contents += externalLibrary
		return externalLibrary
	}

	def CPPBasicType createCPPBasicType(CPPQualifiedNamedElement root, Type type) {
		cppFactory.createCPPBasicType => [
			it.commonType = type
			it.ooplNameProvider = ooplFactory.createOOPLExistingNameProvider => [commonNamedElement = type]
			root.subElements += it
		]
	}
	
	def CPPRelation createCPPRelation(CPPClass root, XTAssociation xtAssoc, CPPClassReferenceStorage cppReferenceStorage) {
		val cppAssoc = createCPPRelation => [
			it.xtRelation = xtAssoc
			it.referenceStorage += cppReferenceStorage
			it.subElements += cppReferenceStorage
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtAssoc
			]
		]
		root.subElements += cppAssoc
		cppAssoc
	}
	
	def CPPClassReferenceStorage createCPPClassReferenceStorage(XTAssociation xtAssoc, OOPLDataType cppClassReference) {
		createCPPClassReferenceStorage => [
			it.type = cppClassReference
			it.ooplNameProvider = createOOPLExistingNameProvider => [
				commonNamedElement = xtAssoc
			]
			it.subElements += cppClassReference as CPPQualifiedNamedElement
		]
	}
	
	def OOPLDataType createCPPClassRefSimpleCollection(XTAssociation xtAssoc, CPPClass cppTargetClass, SimpleCollectionKind kind) {
		val xtTargetClass = xtAssoc.target
		val implementation = getClassRefSimpleCollectionImplementation(cppTargetClass.eResource, kind)
		val referenceType = createCPPClassRefSimpleCollection => [
			it.commonType = xtTargetClass
			it.ooplClass = cppTargetClass
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtTargetClass
			]
			it.implementation = implementation
		]
		return referenceType
	}
	
	def OOPLDataType createCPPClassRefAssocCollection(XTAssociation xtAssoc, CPPClass cppTargetClass, AssociativeCollectionKind kind) {
		val xtTargetClass = xtAssoc.target
		val implementation = getClassRefAssocCollectionImplementation(cppTargetClass.eResource, kind)
		val referenceType = createCPPClassRefAssocCollection => [
			it.commonType = xtTargetClass
			it.ooplClass = cppTargetClass
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtTargetClass
			]
			it.implementation = implementation
		]
		return referenceType
	}
	
	def OOPLDataType createCPPClassReference(XTAssociation xtAssoc, CPPClass cppTargetClass) {
		val xtTargetClass = xtAssoc.target
		
		val referenceType = createCPPClassReference => [
			it.commonType = xtTargetClass
			it.ooplClass = cppTargetClass
			it.ooplNameProvider = createOOPLExistingNameProvider =>[
				commonNamedElement = xtTargetClass
			]
		]
		return referenceType
	}
	
	def CPPSequence createCPPSequence(CPPAttribute root, OOPLDataType type, boolean ordered, boolean unique) {
		val implementation = getSequenceImplementation(type, ordered, unique)
		val seq = cppFactory.createCPPSequence => [
			it.elementType = type
			it.implementation = implementation
		]
		root.unnamedSequenceType = seq
		seq
	}
	
	def CPPSequence createCPPSequence(CPPFormalParameter root, OOPLDataType type, boolean ordered, boolean unique) {
		val implementation = getSequenceImplementation(type, ordered, unique)
		val seq = cppFactory.createCPPSequence => [
			it.elementType = type
			it.implementation = implementation
		]
		root.unnamedSequenceType = seq
		seq
	}
	
	def CPPFormalParameter createCPPFormalParameter(CPPQualifiedNamedElement root, Parameter parameter, OOPLDataType type, boolean multiValue) {
		val cppFormalParameter = cppFactory.createCPPFormalParameter => [
			it.commonParameter = parameter
			it.ooplNameProvider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = parameter ]
			if(multiValue){
				createCPPSequence(it, type, false, true)
			}
		]
		root.subElements += cppFormalParameter
		cppFormalParameter
	}
	
	def CPPReturnValue createCPPReturnValue(CPPOperation operation, TypedMultiplicityElement xtReturnValue) {
		val cppReturnValue = cppFactory.createCPPReturnValue => [
			it.commonTypedMultiplicityElement = xtReturnValue
		]
		operation.subElements += cppReturnValue
		
		return cppReturnValue
	}

	// OTHER ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	def loadDefaultContainerImplementations(Resource resource) {
		val resourceSet = resource.resourceSet
		resourceSet.getResource(URI.createURI(PATH_CPP_COLLECTIONS), true)
	}
	
	def CPPBasicType findCPPBasicType(CPPQualifiedNamedElement root, Type type) {
		val cppBasicTypesResource = root.eResource.resourceSet.resources.findFirst[it.URI.toString.equals(EMDWConstants.CPP_BASIC_TYPES_LIBRARY_PATH)]
		val basicTypes = cppBasicTypesResource.allContents.filter(CPPBasicType).toList
		return basicTypes.findFirst[it.commonType == type]
	}
	
	def OOPLClassRefSimpleCollectionImplementation getClassRefSimpleCollectionImplementation(Resource res, SimpleCollectionKind kind) {
		val implementationResource = res.resourceSet.getResource(
			URI.createURI(PATH_CPP_COLLECTIONS),
			true)
		val implementations = implementationResource.contents
													.filter[
														it instanceof OOPLClassRefSimpleCollectionImplementation
													].toList
		val implementation = implementations.findFirst[(it as OOPLClassRefSimpleCollectionImplementation).kind == kind]
		return implementation as OOPLClassRefSimpleCollectionImplementation
	}
	
	def OOPLClassRefAssocCollectionImplementation getClassRefAssocCollectionImplementation(Resource res, AssociativeCollectionKind kind) {
		val implementationResource = res.resourceSet.getResource(
			URI.createURI(PATH_CPP_COLLECTIONS),
			true)
		val implementations = implementationResource.contents
													.filter[
														it instanceof OOPLClassRefAssocCollectionImplementation
													].toList
		val implementation = implementations.findFirst[(it as OOPLClassRefAssocCollectionImplementation).kind == kind]
		return implementation as OOPLClassRefAssocCollectionImplementation
	}
	
	def OOPLSequenceImplementation getSequenceImplementation(OOPLDataType type, boolean ordered, boolean unique) {
		val implementationResource = type.eResource.resourceSet.getResource(
			URI.createURI(EMDWConstants.CPP_COLLECTIONS_LIBRARY_PATH, true),
			true)
		val orderness = decodeSequenceOrderness(ordered)
		val uniqueness = decodeSequenceUniqueness(unique)
		val implementations = implementationResource.contents
													.filter[
														it instanceof OOPLSequenceImplementation
													].toList
		val implementation = implementations.findFirst[
												(it as OOPLSequenceImplementation).orderedness==orderness &&
												(it as OOPLSequenceImplementation).uniqueness==uniqueness
											]
		return implementation as OOPLSequenceImplementation
	}
	
	def decodeSequenceOrderness(boolean ordered) {
		if(ordered) {
			return SequenceOrderednessKind.ORDERED
		} else {
			return SequenceOrderednessKind.UNORDERED
		}
	}
	
	def decodeSequenceUniqueness(boolean unique) {
		if(unique) {
			return SequenceUniquenessKind.UNIQUE
		} else {
			return SequenceUniquenessKind.NON_UNIQUE
		}
	}
}