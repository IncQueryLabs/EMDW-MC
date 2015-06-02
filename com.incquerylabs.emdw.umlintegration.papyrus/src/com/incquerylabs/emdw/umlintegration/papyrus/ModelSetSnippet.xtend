package com.incquerylabs.emdw.umlintegration.papyrus

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import java.util.HashMap
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.RollingFileAppender
import org.apache.log4j.SimpleLayout
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrus.infra.core.resource.IModelSetSnippet
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.papyrusrt.xtumlrt.common.Type
import org.eclipse.uml2.uml.PrimitiveType
import org.eclipse.uml2.uml.resource.UMLResource

class ModelSetSnippet implements IModelSetSnippet {

	val transformation = new TransformationQrt

	new(){
		val logger = Logger.getLogger(TransformationQrt.package.name)
		if(logger.level != Level.TRACE){
			logger.level = Level.TRACE
			val layout = new SimpleLayout()
			val rollingAppender = new RollingFileAppender(layout, "emdw-papyrus-integration.log")
			rollingAppender.setMaxFileSize("1MB")
			rollingAppender.setMaxBackupIndex(10)
			logger.addAppender(rollingAppender)
		}
	}

	override start(ModelSet modelSet) {
		val resourceSet = new ResourceSetImpl
		val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new EMFScope(#{modelSet, resourceSet}))
		
		ImmutableList.copyOf(modelSet.resources.filter(UMLResource)).forEach[resource |
			if (!resource.contents.filter(org.eclipse.uml2.uml.Model).empty) {
				createMapping(resource, modelSet, resourceSet)
			}
		]
		
		val primitiveTypeMapping = createPrimitiveTypeMapping(engine, resourceSet, modelSet)
		transformation.initialize(engine, primitiveTypeMapping)
		transformation.execute
	}

	def createMapping(Resource umlResource, ModelSet modelSet, ResourceSet resourceSet) {
		
		val xtumlrtModel = CommonFactory.eINSTANCE.createModel
		createResource(umlResource, "xtuml", xtumlrtModel, modelSet, resourceSet)

		val mapping = TraceFactory.eINSTANCE.createRootMapping => [
			umlRoot = umlResource.contents.filter(org.eclipse.uml2.uml.Model).head
			xtumlrtRoot = xtumlrtModel
		]
		createResource(umlResource, "trace", mapping, modelSet, resourceSet)
		
		mapping
	}
	
	def createResource(Resource umlResource, String fileExtension, EObject root, ModelSet modelSet, ResourceSet resourceSet) {
		val uriWithoutExtension = umlResource.getURI.trimFileExtension
		val uri = uriWithoutExtension.appendFileExtension(fileExtension)
		val resource = resourceSet.createResource(uri)
		resource.contents += root
		modelSet.registerModel(new EmfModel(resource))
		resource
	}

	override dispose(ModelSet modelsManager) {
		transformation.dispose
	}
	
	def createPrimitiveTypeMapping(AdvancedIncQueryEngine engine, ResourceSet rs, ModelSet modelSet){
		val primitiveTypeMapping = new HashMap<org.eclipse.uml2.uml.Type, Type>();
			
		val commonTypesPath = "org.eclipse.papyrusrt.xtumlrt.common.model/model/umlPrimitiveTypes.common"
		val commonTypesURI = URI.createPlatformPluginURI(commonTypesPath,true)
		val commonTypesResource = rs.getResource(commonTypesURI,true);
		
		val commonTypesModel = commonTypesResource.contents.head as org.eclipse.papyrusrt.xtumlrt.common.Model
		val commonTypes = commonTypesModel.packages.head.typedefinitions.map[td|td.type]

		val umlTypesURI = URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI)
		val umlTypesResource = modelSet.getResource(umlTypesURI, true)
		
		val model = umlTypesResource.contents.filter(org.eclipse.uml2.uml.Model).head
		val umlTypes = model.packagedElements.filter(PrimitiveType)
		
		commonTypes.forEach[type|
			val umlType = umlTypes.filter[umlType | umlType.name.equals(type.name)].head
			if(umlType != null){
				primitiveTypeMapping.put(umlType, type)
			}
		]

		primitiveTypeMapping
	}

}
