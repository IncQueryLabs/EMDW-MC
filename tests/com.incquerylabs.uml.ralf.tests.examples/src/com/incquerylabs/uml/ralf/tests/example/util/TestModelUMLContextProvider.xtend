package com.incquerylabs.uml.ralf.tests.example.util

import com.google.inject.Singleton
import com.incquerylabs.uml.ralf.incquery.IncQueryBasedUMLContextProvider
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.NamedElement
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.UMLPackage

/**
 * This context provider loads an UML model from a .uml file, returns the known classes, 
 * types, signals of a given UML model. Also provides an interface for querying the 
 * associations and properties of a given class
 * 
 */
@Singleton
class TestModelUMLContextProvider extends IncQueryBasedUMLContextProvider {
	//The UML model object loaded from the specified .uml file
	var Model model
	//Resource containing the UML model
	var Resource resource
	//Fully qualified name of the "this" element. This is needed as in the test cases, no editor is at 
	//present, therefore the uml containing the given snippet cannot be queried from the editor.
	var String elementFQN

	new(String location) {
		//In the constructor, the model is loaded.
		val resourceSet = new ResourceSetImpl
		resource = resourceSet.createResource(URI.createPlatformPluginURI(location, true)) => [
			load(#{})
		]
		if (resource.allContents.filter(typeof(Model)).size > 0) {
			model = resource.allContents.filter(typeof(Model)).head
		}

	}
	
	public def setElementFQN(String elementFQN) {
		this.elementFQN = elementFQN;
	}

	override protected getPrimitivePackage() {
		EcoreUtil.getObjectByType(resource.getContents(), UMLPackage.Literals.PACKAGE) as Package
	}
	
	override protected getContextObject() {
		// The method whose fully qualified name maches the specified "this" object name will be returned.
		var elements = model.allOwnedElements.filter(NamedElement).filter[qualifiedName == elementFQN]
		if(elements.size >0){
			return elements.head
		}
		return null;
	}
	
	override protected doGetEngine() {
		//Returns a new IncQuery engine on the model
        IncQueryEngine.on(new EMFScope(model.eResource.resourceSet));
	}
	
}