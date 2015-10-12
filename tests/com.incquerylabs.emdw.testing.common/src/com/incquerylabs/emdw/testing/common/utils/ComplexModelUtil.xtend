package com.incquerylabs.emdw.testing.common.utils

import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.Model
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.UMLFactory
import org.eclipse.uml2.uml.resource.UMLResource

class ComplexModelUtil extends ModelUtil {
	static extension UMLFactory umlFactory = UMLFactory.eINSTANCE
	static extension CommonFactory commonFactory = CommonFactory.eINSTANCE
	static extension TraceFactory traceFactory = TraceFactory.eINSTANCE

	static extension CppUtil cppUtil = new CppUtil
	
	def createBasicRootMapping(String umlModelName, ResourceSet rs) {
		var resourceSet = rs
		if (resourceSet == null) {
			resourceSet = new ResourceSetImpl
		}
		val umlResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_UML»'''))
		val xtumlrtResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_XTUML»'''))
		val traceResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_TRACE»'''))
		resourceSet.getResource(URI.createURI(PATH_RALF_COLLECTIONS), true)

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

		mapping
	}
	
	def createRootMapping(String umlModelName, ResourceSet rs) {
		val mapping = createBasicRootMapping(umlModelName, rs)
		
		val cppResource = rs.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_CPP»'''))
		rs.getResource(URI.createPlatformPluginURI(PATH_CPP_COLLECTIONS, true), true)
		prepareCPPModel(cppResource, mapping.xtumlrtRoot)

		mapping
	}
	
	def createPrimitiveTypeMapping(ResourceSet rs){
		val primitiveTypeMapping = <org.eclipse.uml2.uml.Type, Type>newHashMap
		
		val commonTypesResource = rs.getResource(URI.createPlatformPluginURI(PATH_COMMON_TYPES, true), true)
		val commonTypesModel = commonTypesResource.contents.head as Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = rs.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true)
		val model = umlTypesResource.contents.filter(org.eclipse.uml2.uml.Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		logger.debug("Created primitive type mapping")
		rs.getResource(URI.createPlatformPluginURI(PATH_CPP_TYPES, true), true)
		primitiveTypeMapping
	}
}