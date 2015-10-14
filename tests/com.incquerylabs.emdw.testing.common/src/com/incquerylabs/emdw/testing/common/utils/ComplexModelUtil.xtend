package com.incquerylabs.emdw.testing.common.utils

import com.ericsson.xtumlrt.oopl.OoplQueryBasedFeatures
import com.ericsson.xtumlrt.oopl.cppmodel.derived.QueryBasedFeatures
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.api.GenericPatternGroup
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFBaseIndexWrapper
import org.eclipse.incquery.runtime.emf.EMFScope
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
	
	def prepareUMLResource(String umlModelName, ResourceSet resourceSet) {
		val umlResource = resourceSet.createResource(URI.createURI('''model/«umlModelName»/«URI_DUMMY_UML»'''))
		val umlModel = umlFactory.createModel => [
			name = umlModelName
		]
		umlResource.contents += umlModel
		resourceSet.getResource(URI.createURI(PATH_RALF_COLLECTIONS), true)
		
		return umlModel
	}
	
	def loadExistingUMLResource(String umlModelPath, ResourceSet resourceSet) {
		val umlResource = resourceSet.getResource(URI.createPlatformPluginURI(umlModelPath, true), true)
        val umlModel =  umlResource.allContents.filter(typeof(org.eclipse.uml2.uml.Model)).findFirst[true]
        resourceSet.getResource(URI.createURI(PATH_RALF_COLLECTIONS), true)
        
        return umlModel
	}
	
	def createBasicRootMapping(String umlModelName, ResourceSet resourceSet) {
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
	
	def createRootMapping(org.eclipse.uml2.uml.Model umlModel, AdvancedIncQueryEngine engine) {
        
        // we need to expand the indexing to the additional resource set
		val emfBaseIndex = engine.baseIndex as EMFBaseIndexWrapper
        val additionalResourceSet = new ResourceSetImpl
		emfBaseIndex.navigationHelper.addRoot(additionalResourceSet)
		
		val xtumlrtResource = additionalResourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyXtumlrtUri.xtuml"))
		val traceResource = additionalResourceSet.createResource(URI.createURI("model/"+umlModel.name+"/dummyTraceUri.trace"))
		
		val xtumlrtModel = commonFactory.createModel => [
			it.name = umlModel.name
		]
		xtumlrtResource.contents += xtumlrtModel

		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlModel
			xtumlrtRoot = xtumlrtModel
		]
		traceResource.contents += mapping
		
		mapping
	}
	
	def createRootMapping(String umlModelName, ResourceSet rs) {
		val mapping = createBasicRootMapping(umlModelName, rs)
		
		prepareCPPResource(mapping.xtumlrtRoot)
		
		mapping
	}
	
	def prepareCPPResource(Model xumlrtModel) {
		val rs = xumlrtModel.eResource.resourceSet
		// initialize CPP and OOPL query based features eagerly
		val managedEngine = IncQueryEngine.on(new EMFScope(rs))
		GenericPatternGroup.of(OoplQueryBasedFeatures.instance, QueryBasedFeatures.instance).prepare(managedEngine)
    	
    	// create dummy resource
		val cppResource = rs.createResource(URI.createURI('''model/«xumlrtModel.name»/«URI_DUMMY_CPP»'''))
		rs.getResource(URI.createPlatformPluginURI(PATH_CPP_COLLECTIONS, true), true)
		rs.getResource(URI.createPlatformPluginURI(PATH_CPP_TYPES, true), true)
		
		prepareCPPModel(cppResource, xumlrtModel)
	}
	
	def createPrimitiveTypeMapping(ResourceSet umlRS, ResourceSet xumlrtRS){
		val primitiveTypeMapping = <org.eclipse.uml2.uml.Type, Type>newHashMap
		
		val commonTypesResource = xumlrtRS.getResource(URI.createPlatformPluginURI(PATH_COMMON_TYPES, true), true) => [ load(#{}) ]
		val commonTypesModel = commonTypesResource.contents.head as Model
		val commonTypes = commonTypesModel.packages.head.typeDefinitions.map[td|td.type]
		
		val umlTypesResource = umlRS.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true) => [ load(#{}) ]
		val model = umlTypesResource.contents.filter(org.eclipse.uml2.uml.Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			// Here the void xtUML type is put into the map with null key because 
			// UML null types are mapped to void in xtUML as there is no void UML basic type.
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			primitiveTypeMapping.put(umlType, type)
		]
		
		primitiveTypeMapping
	}
	
	def cleanUpResourceSet(ResourceSet resourceSet) {
		val resources = resourceSet.resources
		resources.forEach[it.unload]
		resources.clear;
	}
	
	@Deprecated
	def createPrimitiveTypeMapping(ResourceSet rs){
		createPrimitiveTypeMapping(rs, rs)
	}
}