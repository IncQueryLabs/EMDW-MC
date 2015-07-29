package com.incquerylabs.uml.ralf.tests.util

import com.google.common.base.Joiner
import com.google.inject.Singleton
import com.incquerylabs.uml.ralf.scoping.UMLContextProvider
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.ResourceSet
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Behavior
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.resource.UMLResource

@Singleton
class TestModelUMLContextProvider extends UMLContextProvider {

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
	
	public def setDefinedBehavior(String elementFQN) {
		definedBehavior = model.allOwnedElements.filter(Behavior)
           .findFirst[
               if (qualifiedName == elementFQN) {
                   true
               } else {
                   val splitString = elementFQN.split("::")
                   val joinedString = Joiner.on("::").join(splitString.take(splitString.length - 1))
                   qualifiedName == splitString.last 
                       && (it.eContainer as NamedElement).qualifiedName == joinedString
               }
           ] 
	}
	
	override protected getContextObject() {
		getDefinedBehavior()
	}
	
	override protected doGetEngine() {
        IncQueryEngine.on(new EMFScope(resourceSet));
	}
	
}