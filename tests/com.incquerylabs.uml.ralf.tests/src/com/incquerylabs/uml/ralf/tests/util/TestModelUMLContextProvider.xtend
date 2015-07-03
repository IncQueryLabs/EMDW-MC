package com.incquerylabs.uml.ralf.tests.util

import com.google.inject.Singleton
import com.incquerylabs.uml.ralf.scoping.AbstractUMLContextProvider
import com.incquerylabs.uml.ralf.tests.util.queries.AssociationsOfClassMatcher
import com.incquerylabs.uml.ralf.tests.util.queries.AttributesOfClassMatcher
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.incquery.runtime.api.IncQueryEngine
import org.eclipse.incquery.runtime.emf.EMFScope
import org.eclipse.incquery.runtime.exception.IncQueryException
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Model
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.Property
import org.eclipse.uml2.uml.UMLPackage

@Singleton
class TestModelUMLContextProvider extends AbstractUMLContextProvider {

	var IncQueryEngine engine
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

	private def IncQueryEngine getEngine(Model model) {
		if (engine == null) {
			engine = IncQueryEngine.on(new EMFScope(model.eResource.resourceSet));
		}
		return engine;
	}
	
	public def setElementFQN(String elementFQN) {
		this.elementFQN = elementFQN;
	}

	override getPrimitivePackage() {
		EcoreUtil.getObjectByType(resource.getContents(), UMLPackage.Literals.PACKAGE) as Package
	}

	override getContainerResource() {
		resource
	}

	override Iterable<Property> getPropertiesOfClass(Class cl) {
		try {
			val matcher = AttributesOfClassMatcher.on(getEngine(model));
			return matcher.getAllValuesOfattribute(cl);
		} catch (IncQueryException e) {
			e.printStackTrace();
		}
		return super.getPropertiesOfClass(cl);
	}

	override Class getThisType() {
		val reducedClasses = knownClasses.filter[qualifiedName == elementFQN]
		reducedClasses.head
	}

	override Iterable<Property> getAssociationsOfClass(Class cl) {
		try {
			val matcher = AssociationsOfClassMatcher.on(getEngine(model));
			return matcher.getAllValuesOfassociation(cl);
		} catch (IncQueryException e) {
			e.printStackTrace();
		}
		return super.getPropertiesOfClass(cl);
	}
}