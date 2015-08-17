package com.incquerylabs.emdw.cpp.common.test

import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.uml2.uml.resource.UMLResource
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.ericsson.xtumlrt.oopl.OoplFactory
import org.eclipse.emf.ecore.resource.Resource
import com.ericsson.xtumlrt.oopl.cppmodel.CPPModel
import org.eclipse.uml2.uml.Parameter
import org.eclipse.uml2.uml.ParameterDirectionKind

class CommonTestUtil {

	static extension val Logger logger = Logger.getLogger(CommonTestUtil)
	static extension val UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val TraceFactory traceFactory = TraceFactory.eINSTANCE
	static extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	static extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	private static final String COMMON_TYPES_PATH = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	private static final String CPP_COLLECTIONS_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/defaultImplementations.cppmodel"
	private static final String CPP_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	
	static def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <Type, org.eclipse.papyrusrt.xtumlrt.common.Type>newHashMap
		
		val commonTypesResource = rs.getResource(URI.createPlatformPluginURI(COMMON_TYPES_PATH, true), true)
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true)
		val model = umlTypesResource.contents.filter(Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		logger.debug("Created primitive type mapping")
		rs.getResource(URI.createPlatformPluginURI(CPP_COLLECTIONS_PATH, true), true)
		rs.getResource(URI.createPlatformPluginURI(CPP_TYPES_PATH, true), true)
		primitiveTypeMapping
	}
	
	static def createRootMapping(String umlModelName, ResourceSet resourceSet) {
		val umlResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyUmlUri.uml"))
		val xtumlrtResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyXtumlrtUri.xtuml"))
		val traceResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyTraceUri.trace"))
		val cppResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyCppUri.cppmodel"))
		
		val umlModel = umlFactory.createModel => [
			name = umlModelName
		]
		umlResource.contents += umlModel
		
		val xtumlrtModel = commonFactory.createModel => [
			it.name = umlModelName
		]
		xtumlrtResource.contents += xtumlrtModel

		val mapping = createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtModel
		]
		traceResource.contents += mapping
		
		cppResource.prepareCppModel(xtumlrtModel)
		
		
		mapping
	}
	
	static def CPPModel prepareCppModel(Resource resource, org.eclipse.papyrusrt.xtumlrt.common.Model xtModel) {
		val cppModel = createCppModel(resource, xtModel)
		val modelDir = createCPPDirectory(cppModel.eResource)
		resource.contents += cppFactory.createCPPExternalLibrary
		cppModel.headerDir = modelDir
		cppModel.bodyDir = modelDir
		return cppModel
	}
	
	static def createCppModel(Resource cppResource, org.eclipse.papyrusrt.xtumlrt.common.Model xtModel) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtModel ]
		val cppModel = cppFactory.createCPPModel => [
			commonModel = xtModel
			it.ooplNameProvider = provider
		]
		cppResource.contents += cppModel
		return cppModel
	}

	static def createCPPDirectory(Resource cppResource) {
		val cppDir = cppFactory.createCPPDirectory
		cppResource.contents += cppDir
		return cppDir
	}
	
	static def createPackage(String name) {
		umlFactory.createPackage => [
			it.name = name
		]
	}
	
	static def createPackage(Component comp, String name) {
		val package = createPackage(name)
		comp.packagedElements += package
		package
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

	static def createComponent(Package root, String name) {
		val comp = createComponent(name)
		root.packagedElements += comp
		comp
	}

	static def PrimitiveType findPrimitiveType(Model umlModel, String name) {
		val umlPrimitiveTypesResource = umlModel.eResource.resourceSet.resources.findFirst[it.URI.toString.contains("UMLPrimitiveTypes")]
		val primitiveTypes = umlPrimitiveTypesResource.allContents.filter(PrimitiveType).toList
		return primitiveTypes.findFirst[it.name == name]
	}

	static def createClass(Component umlComp, String name) {
		val umlClass = umlFactory.createClass => [
			it.name = name
		]
		umlComp.nestedClassifiers += umlClass
		return umlClass
	}

	static def createClass(Package umlPackage, String name) {
		val umlClass = umlFactory.createClass => [
			it.name = name
		]
		umlPackage.packagedElements += umlClass
		return umlClass
	}
	
	static def createAttribute(Class umlClass, Type type, String name) {
		val attribute = umlFactory.createProperty => [
			it.type = type
			it.name = name
		]
		umlClass.ownedAttributes += attribute
		return attribute
	}

	static def createAssociation(Component comp, Class source, Class target, String assocName, String sourceEndName, String targetEndName) {
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
	
	static def createOperation(Class umlClass, String name, Parameter... parameters) {
		val operation = umlFactory.createOperation => [
			it.name = name
			it.ownedParameters += parameters
		]
		umlClass.ownedOperations += operation
		return operation
	}
	
	static def createParameter(Type type, String name, ParameterDirectionKind direction, int lowerBound, int upperBound) {
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
}