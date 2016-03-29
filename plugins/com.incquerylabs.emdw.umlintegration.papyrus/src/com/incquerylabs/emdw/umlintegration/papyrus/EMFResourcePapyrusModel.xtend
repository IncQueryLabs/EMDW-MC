/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Daniel Segesdi, Tamas Borbas, Denes Harmath - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.emdw.umlintegration.papyrus

import java.io.IOException
import org.eclipse.core.runtime.IPath
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.papyrus.infra.core.resource.AbstractModel

class EMFResourcePapyrusModel extends AbstractModel {

	val Resource resource

	new(Resource resource) {
		this.resource = resource
	}
	
	def getResource(){
		resource
	}

	override saveModel() throws IOException {
		resource.save(#{})
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
