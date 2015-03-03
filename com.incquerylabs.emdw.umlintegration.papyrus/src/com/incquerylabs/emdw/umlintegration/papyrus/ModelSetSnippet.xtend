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

	override start(ModelSet modelSet) {
		ImmutableList.copyOf(modelSet.resources.filter(UMLResource)).forEach[resource |
			if (!resource.contents.filter(Package).empty) {
				val mapping = createMapping(resource, modelSet)
				val engine = AdvancedIncQueryEngine.createUnmanagedEngine(new MultiEMFScope(#{resource, mapping.eResource.resourceSet})) // TODO change to EMFScope when https://bugs.eclipse.org/bugs/show_bug.cgi?id=460722 is fixed
				transformation.initialize(mapping, engine)
				transformation.execute
			}
		]
	}

	def createMapping(Resource umlResource, ModelSet modelSet) {
		val resourceSet = new ResourceSetImpl
		
		val commonFactory = CommonFactory.eINSTANCE
		val xtumlrtPackage = commonFactory.createPackage
		createResource(umlResource, "xtumlrt", xtumlrtPackage, modelSet, resourceSet)

		val traceFactory = TraceFactory.eINSTANCE
		val mapping = traceFactory.createRootMapping => [
			umlRoot = umlResource.contents.filter(Package).head
			xtumlrtRoot = xtumlrtPackage
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
