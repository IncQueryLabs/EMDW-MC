package com.incquerylabs.uml.ralf.scoping

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
import org.eclipse.uml2.uml.Class
import org.eclipse.uml2.uml.Type
import org.eclipse.uml2.uml.Signal
import org.eclipse.uml2.uml.Association

/**
 * Simplified UML context, where only primitive types are available from UML model.
 */
@Singleton
class SimpleUMLContextProvider extends AbstractUMLContextProvider {

    val Resource containerResource
    
    new() {
        val set = new ResourceSetImpl()
        UMLResourcesUtil.init(set)
        containerResource = set.getResource(URI.createURI(UMLResource.UML_PRIMITIVE_TYPES_LIBRARY_URI), true)
    }

    override getPrimitivePackage() {
        EcoreUtil.getObjectByType(containerResource.getContents(), UMLPackage.Literals.PACKAGE) as Package
    }
    

    override getPropertiesOfClass(Class cl) {
        return newArrayList
    }

    override getAssociationsOfClass(Class cl) {
        return newArrayList
    }

    override getKnownTypes() {
        containerResource.allContents.filter(typeof(Type)).toSet
    }

    override getKnownClasses() {
        containerResource.allContents.filter(typeof(Class)).toSet
    }

    override getKnownSignals() {
        containerResource.allContents.filter(typeof(Signal)).toSet
    }

    override getKnownAssociations() {
        containerResource.allContents.filter(typeof(Association)).toSet
    }
    
}