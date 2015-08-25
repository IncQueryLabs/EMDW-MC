package com.incquerylabs.uml.ralf.tests.util

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

@Singleton
class TestModelUMLContextProvider extends UMLContextProvider {

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
		definedOperation = model.allOwnedElements.filter(Operation)
           .findFirst[qualifiedName == elementFQN] 
	}
	
	override protected getContextObject() {
		definedOperation
	}
	
	override protected doGetEngine() {
        IncQueryEngine.on(new EMFScope(resourceSet));
	}

    override getDefinedOperation() {
        definedOperation
    }
	
}