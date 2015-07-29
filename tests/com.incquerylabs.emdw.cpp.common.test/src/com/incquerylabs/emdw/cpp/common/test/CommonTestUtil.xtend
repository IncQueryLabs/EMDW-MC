package com.incquerylabs.emdw.cpp.common.test

import com.ericsson.xtumlrt.oopl.OoplFactory
import com.ericsson.xtumlrt.oopl.cppmodel.CppmodelFactory
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Logger
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.uml2.uml.Component
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.uml2.uml.resource.UMLResource

class CommonTestUtil {

	static extension val Logger logger = Logger.getLogger(CommonTestUtil)
	static extension val UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension val CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension val TraceFactory traceFactory = TraceFactory.eINSTANCE
	static extension val OoplFactory ooplFactory = OoplFactory.eINSTANCE
	static extension val CppmodelFactory cppFactory = CppmodelFactory.eINSTANCE
	
	private static final String COMMON_TYPES_PATH = "/org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
	private static final String CPP_TYPES_PATH = "/com.incquerylabs.emdw.cpp.transformation/model/cppBasicTypes.cppmodel"
	
	static def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <org.eclipse.uml2.uml.Type, Type>newHashMap
		
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
		rs.getResource(URI.createPlatformPluginURI(CPP_TYPES_PATH, true), true)
		primitiveTypeMapping
	}
	
	static def createRootMapping(String umlModelName, ResourceSet resourceSet) {
		val umlResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyUmlUri.uml"))
		val xtumlrtResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyXtumlrtUri.xtuml"))
		val traceResource = resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyTraceUri.trace"))
		resourceSet.createResource(URI.createURI("model/"+umlModelName+"/dummyCppUri.trace"))
		
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
	
	static def createCPPModel(Resource cppResource, org.eclipse.papyrusrt.xtumlrt.common.Model xtModel) {
		val provider = ooplFactory.createOOPLExistingNameProvider=>[commonNamedElement = xtModel ]
		val cppModel = cppFactory.createCPPModel => [
			commonModel = xtModel
			it.ooplNameProvider = provider
		]
		cppResource.contents += cppModel
		cppModel
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

	static def createComponentInPackage(Package root, String name) {
		val comp = createComponent(name)
		root.packagedElements += comp
		comp
	}

	static def createPrimitiveType(Package umlPackage, String name) {
		val primitiveType = umlPackage.createOwnedPrimitiveType(name)
		primitiveType
	}

	static def createClass(Component umlPackage, String name) {
		val umlClass = umlFactory.createClass => [
			it.name = name
		]
		umlPackage.packagedElements += umlClass
		return umlClass
	}
}