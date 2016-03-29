/*******************************************************************************
 * Copyright (c) 2015-2016, IncQuery Labs Ltd. and Ericsson AB
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *   Akos Horvath, Abel Hegedus, Zoltan Ujhelyi, Peter Lunk - initial API and implementation
 *******************************************************************************/
package com.incquerylabs.uml.ralf.tests.util.context

import com.google.inject.Singleton
import com.incquerylabs.uml.ralf.scoping.UMLContextProvider
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Operation
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.uml2.uml.OpaqueBehavior
import org.eclipse.emf.ecore.EObject

@Singleton
class TestModelUMLContextProvider extends UMLContextProvider {
	var String elementFQN
    var Operation definedOperation
	var Model model
	val ResourceSet resourceSet

	new(String location) {
		resourceSet = new ResourceSetImpl
		resourceSet.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI),
                true) => [
                    load(#{})    
                ]
		val resource = resourceSet.createResource(URI.createPlatformPluginURI(location, true)) => [
			load(#{})
		]
		model =  resource.allContents.filter(typeof(Model)).findFirst[true]
	}
	
	public def setDefinedOperation(String elementFQN) {
		this.elementFQN = elementFQN
		definedOperation = model.allOwnedElements.filter(Operation)
           .findFirst[qualifiedName == elementFQN] 
	}
	
	override protected getContextObject() {
		if(definedOperation != null){
			definedOperation
		}else{
			model.allOwnedElements.filter(OpaqueBehavior).findFirst[qualifiedName == elementFQN]
		}
	}
	
	override protected doGetEngine() {
        IncQueryEngine.on(new EMFScope(resourceSet));
	}

    override getDefinedOperation(EObject _context) {
        definedOperation
    }
	
}