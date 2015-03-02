package com.incquerylabs.emdw.umlintegration.papyrus

import com.google.common.collect.ImmutableList
import com.incquerylabs.emdw.umlintegration.TransformationQrt
import com.incquerylabs.emdw.umlintegration.trace.TraceFactory
import com.zeligsoft.xtumlrt.common.CommonFactory
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.AdvancedIncQueryEngine
import org.eclipse.papyrus.infra.core.resource.IModelSetSnippet
import org.eclipse.papyrus.infra.core.resource.ModelSet
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.resource.UMLResource

class ModelSetSnippet implements IModelSetSnippet {

	val transformation = new TransformationQrt

	override start(ModelSet modelsManager) {
		ImmutableList.copyOf(modelsManager.resources.filter(UMLResource)).forEach [ resource |
			if (!resource.contents.filter(Package).empty) {
				val mapping = createMapping(resource, modelsManager)
				val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new MultiEMFScope(#{resource, mapping.eResource.resourceSet}))
				transformation.initialize(mapping, engine)
				transformation.execute
			}
		]
	}

	def createMapping(Resource sourceResource, ModelSet modelSet) {
		val resourceSet = new ResourceSetImpl
		
		val targetFactory = CommonFactory.eINSTANCE
		val targetRoot = targetFactory.createPackage
		createResource(sourceResource, "xtumlrt", targetRoot, modelSet, resourceSet)

		val traceFactory = TraceFactory.eINSTANCE
		val mapping = traceFactory.createRootMapping => [
			umlRoot = sourceResource.contents.filter(Package).head
			xtumlrtRoot = targetRoot
		]
		createResource(sourceResource, "trace", mapping, modelSet, resourceSet)
		
		mapping
	}
	
	def createResource(Resource sourceResource, String fileExtension, EObject root, ModelSet modelSet, ResourceSet resourceSet) {
		val uriWithoutExtension = sourceResource.getURI.trimFileExtension
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
