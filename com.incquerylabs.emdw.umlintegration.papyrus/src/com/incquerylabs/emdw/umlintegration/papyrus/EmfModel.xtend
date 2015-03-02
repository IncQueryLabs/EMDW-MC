package com.incquerylabs.emdw.umlintegration.papyrus

import org.eclipse.papyrus.infra.core.resource.AbstractModel
import org.eclipse.core.runtime.IPath
import org.eclipse.emf.common.util.URI
import java.io.IOException
import org.eclipse.emf.ecore.resource.Resource
import com.google.common.collect.ImmutableMap

class EmfModel extends AbstractModel {

	val Resource resource

	new(Resource resource) {
		this.resource = resource
	}

	override saveModel() throws IOException {
		resource.save(ImmutableMap.of)
	}

	override getModifiedURIs() {
		if (resource.modified) #{resource.getURI} else #{}
	}

	override getIdentifier() {
		resource.getURI.toString
	}

	override changeModelPath(IPath fullPath) {
	}

	override createModel(IPath fullPath) {
	}

	override createModel(URI uri) {
	}

	override importModel(IPath path) {
	}

	override importModel(URI uri) {
	}

	override loadModel(IPath path) {
	}

	override loadModel(URI uri) {
	}

	override setModelURI(URI uri) {
	}

}
