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

@Singleton
class TestModelUMLContextProvider extends IncQueryBasedUMLContextProvider {

	var Model model
	var Resource resource
	var String elementFQN

	new(String location) {
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
		var elements = model.allOwnedElements.filter(NamedElement).filter[qualifiedName == elementFQN]
		if(elements.size >0){
			return elements.head
		}
		return null;
	}
	
	override protected doGetEngine() {
        IncQueryEngine.on(new EMFScope(model.eResource.resourceSet));
	}
	
}