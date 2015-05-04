package com.incquerylabs.emdw.umlintegration.papyrus

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import org.apache.log4j.Level
import org.apache.log4j.Logger
import org.apache.log4j.RollingFileAppender
import org.apache.log4j.SimpleLayout
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.papyrus.infra.core.resource.IModelSetSnippet
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.papyrusrt.xtumlrt.common.CommonFactory
import org.eclipse.uml2.uml.Model
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
			if (!resource.contents.filter(Model).empty) {
				createMapping(resource, modelSet, resourceSet)
			}
		]
		
		transformation.initialize(engine)
		transformation.execute
	}

	def createMapping(Resource umlResource, ModelSet modelSet, ResourceSet resourceSet) {
		
		val xtumlrtModel = CommonFactory.eINSTANCE.createModel
		createResource(umlResource, "xtumlrt", xtumlrtModel, modelSet, resourceSet)

		val mapping = TraceFactory.eINSTANCE.createRootMapping => [
			umlRoot = umlResource.contents.filter(Model).head
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

}
