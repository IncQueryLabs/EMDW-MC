package com.incquerylabs.uml.ralf.tests.util

import com.google.inject.Singleton
import com.incquerylabs.uml.ralf.scoping.AbstractUMLContextProvider
import org.eclipse.emf.common.util.URI
import org.eclipse.emf.ecore.resource.Resource
import org.eclipse.emf.ecore.resource.impl.ResourceSetImpl
import org.eclipse.emf.ecore.util.EcoreUtil
import org.eclipse.uml2.uml.Package
import org.eclipse.uml2.uml.UMLPackage
import org.eclipse.uml2.uml.resource.UMLResource
import org.eclipse.uml2.uml.resources.util.UMLResourcesUtil

@Singleton
class TestUMLContextProvider extends AbstractUMLContextProvider {

	val Resource resource

	new() {
		val set = new ResourceSetImpl()
		UMLResourcesUtil.init(set)
		resource = set.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true)
	}

	override getPrimitivePackage() {
		EcoreUtil.getObjectByType(resource.getContents(), UMLPackage.Literals.PACKAGE) as Package
	}
	
	override getContainerResource() {
		resource
	}

}